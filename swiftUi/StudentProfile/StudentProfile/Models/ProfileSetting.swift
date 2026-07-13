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
    @AppStorage("appDisplayTheme") var appDisplayTheme: Int = 0{
        willSet{
            objectWillChange.send()
        }
    }
}
