//
//  PersistenceController.swift
//  StudentProfile
//
//  Created by iPHTech6 on 08/07/26.
//

import CoreData
import Foundation

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "StudentProfileModel")
        
        container.loadPersistentStores { (storeDes, err) in
            if let err = err as NSError? {
                if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
                    print("Preview Core Data loading failed silently: \(err)")
                } else {
                    fatalError("Database error \(err)")
                }
            } else {
                print("Core Data Store Loaded Successfully")
            }
        }
        
        container.viewContext.automaticallyMergesChangesFromParent = true
        
        generateDummyDataIfNeeded()
    }
    
    private func generateDummyDataIfNeeded() {
        let context = container.viewContext
        
        let request: NSFetchRequest<Student> = NSFetchRequest<Student>(entityName: "Student")
        request.fetchLimit = 1
        
        do {
            let studentCount = try context.count(for: request)
            
            if studentCount == 0 {
                print("Core Data is empty. Running your custom entity extensions...")
                
                let dummyStudent = Student.createDummyStudent(in: context)
                
                let dummyAcadamics = Acadamics.createDummyAcadamics(in: context, student: dummyStudent)
                
                Skill.createDummySkills(in: context, for: dummyStudent)
                
                Subjects.createDummySubjects(in: context, for: dummyAcadamics)
                
                print("Successfully ran all extensions and linked relationship trees!")
            } else {
                print("Existing student profile found. Extensions skipped.")
            }
        } catch {
            print("Error processing data extensions: \(error.localizedDescription)")
        }
    }
}
