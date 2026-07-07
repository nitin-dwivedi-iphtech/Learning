//
//  HeaderView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 07/07/26.
//

import SwiftUI

struct HeaderView:View{
    
    @EnvironmentObject var userSetting:ProfileSetting
    
    var body: some View{
        HStack {
            
            Text("My Profile")
                .font(.system(size: 30,design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Spacer()
            
            Image(systemName: userSetting.isLiked ? "star.fill" :"star")
                .onTapGesture {
                    userSetting.isLiked.toggle()
                }
                .foregroundColor(.yellow)
                .padding(.all,5)
            
            NavigationLink(destination:ProfileEditView()){
                Image(systemName: "pencil.circle.fill")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.all,5)
                    .clipShape(Circle())
            }
        }
    }
}

struct HeaderPreview:PreviewProvider{
    static var previews: some View{
        HeaderView().environmentObject(ProfileSetting())
    }
}
