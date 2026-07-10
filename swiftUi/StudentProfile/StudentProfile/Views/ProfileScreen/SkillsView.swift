//
//  SkillsView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 07/07/26.
//

import SwiftUI

struct Skills: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let isTechnical: Bool
    let proficiency: ProficiencyLevel
}

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
}

struct SkillView: View {
    
    let skills: [Skills] = [
        Skills(name: "Swift", image: "swift", isTechnical: true, proficiency: .advanced),
        Skills(name: "Java", image: "cup.and.saucer.fill", isTechnical: true, proficiency: .intermediate),
        Skills(name: "ML", image: "cpu", isTechnical: true, proficiency: .beginner),
        Skills(name: "UI/UX", image: "paintpalette.fill", isTechnical: true, proficiency: .advanced),
        Skills(name: "Soccer", image: "figure.soccer", isTechnical: false, proficiency: .advanced),
        Skills(name: "Hockey", image: "figure.hockey", isTechnical: false, proficiency: .intermediate)
    ]
    
    let columns = [
        GridItem(.adaptive(minimum: 140, maximum: .infinity), spacing: 12)
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            
            VStack(alignment: .leading, spacing: 14) {
                Text("Technical Skills")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundColor(.primary)
                
                LazyVGrid(columns: columns, alignment: .leading, spacing: 12) {
                    ForEach(skills.filter { $0.isTechnical }) { skill in
                        MetaSkillView(skill: skill)
                    }
                }
            }
            
            VStack(alignment: .leading, spacing: 14) {
                Text("Non-Technical / Activities")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundColor(.primary)
                
               
                LazyVGrid(columns: columns, alignment: .leading, spacing: 12) {
                    ForEach(skills.filter { !$0.isTechnical }) { skill in
                        MetaSkillView(skill: skill)
                    }
                }
            }
        }
        .padding(.horizontal, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
struct MetaSkillView: View {
    var skill: Skills
    
    var body: some View {
        HStack(spacing: 12) {
            
            Image(systemName: skill.image)
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(.primary.opacity(0.8))
                .frame(width: 28, height: 28)
                .background(Color(.label).opacity(0.04))
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            
            
            VStack(alignment: .leading, spacing: 2) {
                Text(skill.name)
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                    .foregroundColor(.primary)
                    .lineLimit(1)
                
                
                Text(skill.proficiency.rawValue)
                    .font(.system(size: 11, weight: .medium, design: .rounded))
                    .foregroundColor(skill.proficiency.color)
            }
            
            Spacer(minLength: 0)
            
            
            Circle()
                .fill(skill.proficiency.color)
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
struct SkillPreview: PreviewProvider {
    static var previews: some View {
        ScrollView {
            SkillView()
                .padding()
        }
        .background(Color(.systemGroupedBackground))
    }
}
