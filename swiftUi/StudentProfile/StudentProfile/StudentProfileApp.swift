//
//  StudentProfileApp.swift
//  StudentProfile
//
//  Created by iPHTech6 on 07/07/26.
//

import SwiftUI

@main
struct StudentProfileApp: App {
    
    @StateObject private var userSetting = ProfileSetting()
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(userSetting)
        }
    }
}
