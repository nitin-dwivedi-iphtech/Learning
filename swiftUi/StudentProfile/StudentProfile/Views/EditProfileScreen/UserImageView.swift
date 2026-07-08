//
//  UserImageView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 08/07/26.
//

import SwiftUI


struct UserImageView:View{
    var body: some View{
        Image("user")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 120, height: 120)
            .clipShape(Circle())
        
    }
}
struct UserImage_Preview:PreviewProvider{
    static var previews: some View{
        UserImageView()
    }
}

