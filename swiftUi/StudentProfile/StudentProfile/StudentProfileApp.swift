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
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(userSetting)
        }
    }
}
