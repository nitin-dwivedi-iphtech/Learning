//
//  EditSkillSheetView.swift
//  StudentProfile
//
//  Created by iPHTech 40 on 13/07/26.
//

import SwiftUI
import CoreData

struct EditSkillSheetView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var skill: Skill
    let isNew: Bool
    
    @State private var inputName: String = ""
    @State private var inputProficiency: Float = 5.0
    @State private var showingDeleteAlert = false
    
    init(skill: Skill, isNew: Bool) {
        self.skill = skill
        self.isNew = isNew
        
        _inputName = State(initialValue: isNew ? "" : (skill.skillName ?? ""))
        _inputProficiency = State(initialValue: isNew ? 5.0 : skill.proficiency)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Skill Configuration")) {
                    TextField("Skill Title (e.g., SwiftUI, Design)", text: $inputName)
                }
                
                Section(header: Text("Proficiency Metric: \(String(format: "%.1f", inputProficiency))/10")) {
                    Slider(value: $inputProficiency, in: 0...10, step: 0.5)
                    
                    HStack {
                        Text("Competency Tier:")
                        Spacer()
                        let tier = ProficiencyLevel.from(proficiency: inputProficiency)
                        Text(tier.rawValue)
                            .font(.system(.body, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(tier.color)
                    }
                }
                
                if !isNew {
                    Section {
                        Button {
                            showingDeleteAlert = true
                        } label: {
                            HStack {
                                Spacer()
                                Image(systemName: "trash.fill")
                                    .font(.system(size: 14, weight: .semibold))
                                Text("Delete Skill")
                                    .font(.system(size: 15, weight: .bold, design: .rounded))
                                Spacer()
                            }
                            .foregroundColor(.red)
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationTitle(isNew ? "Create Competency" : "Modify Competency")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        if isNew {
                            viewContext.delete(skill)
                            try? viewContext.save()
                        }
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        saveDataAndDismiss()
                    }
                    .disabled(inputName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            }
            .alert(isPresented: $showingDeleteAlert) {
                Alert(
                    title: Text("Delete Skill"),
                    message: Text("Are you sure you want to delete this skill permanent record?"),
                    primaryButton: .destructive(Text("Delete")) {
                        viewContext.delete(skill)
                        try? viewContext.save()
                        presentationMode.wrappedValue.dismiss()
                    },
                    secondaryButton: .cancel()
                )
            }
        }
    }
    
    private func saveDataAndDismiss() {
        let trimmedName = inputName.trimmingCharacters(in: .whitespacesAndNewlines)
        skill.skillName = trimmedName
        skill.proficiency = inputProficiency
        
        if isNew || skill.skillImage == nil {
            skill.skillImage = skill.isTechnical ? "terminal.fill" : "person.3.fill"
        }
        
        if let parentStudent = skill.stud_Skill {
            skill.studentId = parentStudent.studentId
        }
        
        try? viewContext.save()
        presentationMode.wrappedValue.dismiss()
    }
}
