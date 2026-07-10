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

struct StudentAcadamics: EnvironmentKey {
    static let defaultValue: [Acadamics] = []
}


extension EnvironmentValues{
    var currentStudent: Student?{
        get{self[CurrentStudent.self]}
        set{self[CurrentStudent.self] = newValue}
    }
    
    var studentAcadamics: [Acadamics] {
        get{ self[StudentAcadamics.self] }
        set{ self[StudentAcadamics.self] = newValue }
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
        dummy.studentId = "STU-2026-8942"
        dummy.userEmail = "john.doe@university.edu"
        dummy.userPhone = "+1 (555) 019-2834"
        dummy.gender = "Male"
        dummy.dob = Calendar.current.date(byAdding: .year, value: -20, to: Date())
        
        do {
            try context.save()
        } catch {
            print("Failed to save dummy student: \(error.localizedDescription)")
        }
    }
}

/*
 Extension for Acadamics entity
 for adding dummy data
 
 */

extension Acadamics {
    static func createDummyAcadamics( in context : NSManagedObjectContext ) {
        let dummy = Acadamics(context: context)
        dummy.attendancePercentage = 84.5
        dummy.cgpa = 7.2
        dummy.course = "Masters of Computer Applications"
        dummy.creditsCompleted = 48
        dummy.currentSemester = "IV"
        dummy.departmentName = "Department of Computer Science"
        dummy.institution = "Stanford University"
        dummy.studentId = "STU-2026-8942"
        
        do{
            try context.save()
        } catch {
            print("Failed to save dummy student_acadamics: \(error.localizedDescription)")
        }
    }
}

/*
 AcadamicModel to fetch updated data from db automatic
 */

extension AcadamicModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        if let updatedRecords = controller.fetchedObjects as? [Acadamics] {
            DispatchQueue.main.async {
                self.acadamics = updatedRecords
            }
        }
    }
}
