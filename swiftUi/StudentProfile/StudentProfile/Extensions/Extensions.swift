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
    func saveData(name: String, email: String, phone: String, id: String,student: Student?, viewContext:NSManagedObjectContext){
        let targetStudent: Student = student ?? Student(context:viewContext)
        targetStudent.username = name
        targetStudent.userPhone = phone
        targetStudent.userEmail = email
        targetStudent.studentId = id
        do{
            try viewContext.save()
        }
        catch{
            print("Failed to save to database: \(error.localizedDescription)")
        }
    }
}
