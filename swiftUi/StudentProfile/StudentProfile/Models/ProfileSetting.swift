//
//  ProfileSetting.swift
//  StudentProfile
//
//  Created by iPHTech6 on 07/07/26.
//

import SwiftUI

class ProfileSetting:ObservableObject{
    
    @AppStorage("Profile-Liked") var isLiked = false{
        willSet{
            objectWillChange.send()
        }
    }
    @AppStorage("Username") var username = "Kane Watson"{
        willSet{
            objectWillChange.send()
        }
    }
    @AppStorage("Email") var userEmail = "ram@exm.com"{
        willSet{
            objectWillChange.send()
        }
    }
    @AppStorage("Phone") var userPhone = "8456324785"{
        willSet{
            objectWillChange.send()
        }
    }
}
