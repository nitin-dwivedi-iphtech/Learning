//
//  Extensions.swift
//  StudentProfile
//
//  Created by iPHTech6 on 08/07/26.
//

import SwiftUI
import CoreData

struct CurrentStudent: EnvironmentKey{
    static let defaultValue: Student?  = nil
}

extension EnvironmentValues{
    var currentStudent: Student?{
        get{self[CurrentStudent.self]}
        set{self[CurrentStudent.self] = newValue}
    }
}

/*
    SaveData extension in ProfileEditView.swift
*/

extension ProfileEditView{
    func saveData(name: String, email: String, phone: String, id: String,gender: String,dob: Date,student: Student?, viewContext:NSManagedObjectContext){
        
        let targetStudent: Student = student ?? Student(context:viewContext)
        targetStudent.username = name
        targetStudent.userPhone = phone
        targetStudent.userEmail = email
        targetStudent.studentId = id
        targetStudent.gender = gender
        targetStudent.dob = dob
        
        if viewContext.hasChanges{
            do{
                try viewContext.save()
            }
            catch{
                print("Failed to save to database: \(error.localizedDescription)")
            }
        }
    }
}

/*
 
    Extension for Student entity
    for adding the dummy data
 */

extension Student {
    static func createDummyStudent(in context: NSManagedObjectContext) {
        let dummy = Student(context: context)
        dummy.username = "John Doe"
        dummy.studentId = "STU2026001"
        dummy.userEmail = "john.doe@university.edu"
        dummy.userPhone = "+1 (555) 019-2834"
        dummy.gender = "Male"
        dummy.dob = Calendar.current.date(byAdding: .year, value: -20, to: Date()) // 20 years old
        
        // Save the context to persist the dummy student
        do {
            try context.save()
        } catch {
            print("Failed to save dummy student: \(error.localizedDescription)")
        }
    }
}
