//
//  SkillsView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 07/07/26.
//

import SwiftUI
import CoreData

enum ProficiencyLevel: String {
    case beginner = "Beginner"
    case intermediate = "Intermediate"
    case advanced = "Advanced"
    
    var color: Color {
        switch self {
        case .beginner: return .green
        case .intermediate: return .orange
        case .advanced: return .blue
        }
    }
    
    static func from(proficiency: Float) -> ProficiencyLevel {
        if proficiency >= 8.0 { return .advanced }
        if proficiency >= 5.0 { return .intermediate }
        return .beginner
    }
}

struct SkillView: View {
    @Environment(\.currentStudent) private var currentStudent: Student?
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        entity: Skill.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Skill.skillName, ascending: true)]
    ) private var fetchedSkills: FetchedResults<Skill>
    
    @State private var activeSkillForEdit: Skill? = nil
    @State private var addingTechnicalSkill = true
    
    let columns = [
        GridItem(.adaptive(minimum: 140, maximum: .infinity), spacing: 12)
    ]
    
    
    private var technicalSkills: [Skill] {
        guard let currentStudent = currentStudent else { return [] }
        return fetchedSkills.filter {
            $0.stud_Skill == currentStudent &&
            $0.isTechnical &&
            $0.skillName != nil &&
            !$0.skillName!.isEmpty
        }
    }
    
    private var nonTechnicalSkills: [Skill] {
        guard let currentStudent = currentStudent else { return [] }
        return fetchedSkills.filter {
            $0.stud_Skill == currentStudent &&
            !$0.isTechnical &&
            $0.skillName != nil &&
            !$0.skillName!.isEmpty
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            
            // Technical Section
            VStack(alignment: .leading, spacing: 14) {
                HStack {
                    Text("Technical Skills")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(.primary)
                    Spacer()
                    
                    Button {
                        addingTechnicalSkill = true
                        createNewSkillIntent()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.blue)
                    }
                }
                
                if technicalSkills.isEmpty {
                    noSkillsPlaceholder(text: "No Technical Skills Found")
                } else {
                    LazyVGrid(columns: columns, alignment: .leading, spacing: 12) {
                        ForEach(technicalSkills, id: \.objectID) { skill in
                            MetaSkillView(skill: skill)
                                .onTapGesture {
                                    activeSkillForEdit = skill
                                }
                        }
                    }
                }
            }
            
            // Non-Technical Section
            VStack(alignment: .leading, spacing: 14) {
                HStack {
                    Text("Non-Technical / Activities")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(.primary)
                    Spacer()
                    
                    Button {
                        addingTechnicalSkill = false
                        createNewSkillIntent() //
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.orange)
                    }
                }
                
                if nonTechnicalSkills.isEmpty {
                    noSkillsPlaceholder(text: "No Activities Found")
                } else {
                    LazyVGrid(columns: columns, alignment: .leading, spacing: 12) {
                        ForEach(nonTechnicalSkills, id: \.objectID) { skill in
                            MetaSkillView(skill: skill)
                                .onTapGesture {
                                    activeSkillForEdit = skill
                                }
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        
        .sheet(item: $activeSkillForEdit, onDismiss: cleanUpBlankSkills) { skill in
            EditSkillSheetView(skill: skill, isNew: skill.skillName == nil)
        }
    }
    
    
    private func createNewSkillIntent() {
        guard let student = currentStudent else { return }
        
        let newSkill = Skill(context: viewContext)
        newSkill.isTechnical = addingTechnicalSkill
        newSkill.stud_Skill = student
        newSkill.studentId = student.studentId
        
        activeSkillForEdit = newSkill
    }
    
    private func cleanUpBlankSkills() {
        for skill in fetchedSkills where skill.skillName == nil || skill.skillName!.isEmpty {
            viewContext.delete(skill)
        }
        try? viewContext.save()
    }
    
    @ViewBuilder
    private func noSkillsPlaceholder(text: String) -> some View {
        Text(text)
            .font(.system(size: 13, weight: .medium, design: .rounded))
            .foregroundColor(.secondary)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color(.secondarySystemGroupedBackground))
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
    }
}

struct MetaSkillView: View {
    @ObservedObject var skill: Skill
    
    var body: some View {
        let currentTier = ProficiencyLevel.from(proficiency: skill.proficiency)
        
        HStack(spacing: 12) {
            Image(systemName: skill.skillImage ?? "gearshape.fill")
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(.primary.opacity(0.8))
                .frame(width: 28, height: 28)
                .background(Color(.label).opacity(0.04))
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            
            VStack(alignment: .leading, spacing: 2) {
                Text(skill.skillName ?? "Unknown Skill")
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                    .foregroundColor(.primary)
                    .lineLimit(1)
                
                Text(currentTier.rawValue)
                    .font(.system(size: 11, weight: .medium, design: .rounded))
                    .foregroundColor(currentTier.color)
            }
            
            Spacer(minLength: 0)
            
            Circle()
                .fill(currentTier.color)
                .frame(width: 6, height: 6)
                .opacity(0.8)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.secondarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
    }
}
