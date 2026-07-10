//
//  PersistenceController.swift
//  StudentProfile
//
//  Created by iPHTech6 on 08/07/26.
//

import CoreData

struct PersistenceController{
    static let shared = PersistenceController()
    
    let container : NSPersistentContainer
    init(){
        container = NSPersistentContainer(name: "StudentProfileModel")
        
        container.loadPersistentStores{(storeDes, err) in
            if let err = err as NSError?{
                // for handeling preview crash
                if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
                    print("Preview Core Data loading failed silently: \(err)")
                }
                else {
                    fatalError("Database error \(err)")
                }
            }
            else{
                print(storeDes)
            }
        }
       
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
