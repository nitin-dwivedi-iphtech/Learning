//
//  UserProfileView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 07/07/26.
//

import SwiftUI

struct UserProfileView:View{
    
    @EnvironmentObject var userSetting:ProfileSetting
    
    var body: some View{
        HStack{
            Image("user")
                .resizable()
                .frame(minWidth: 30, idealWidth: 60, maxWidth: 98, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 98, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .cornerRadius(25, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            
            VStack{
                Text("\(userSetting.username)")
                    .font(.system(size: 28,design: .rounded))
                    .padding(.bottom,5)
                Text("Master's Computer Application")
                    .font(.system(size:15,design: .rounded))
            }.padding(.leading,40)
        }.padding(.horizontal,10)
    }
}

struct UserProfilePreview : PreviewProvider{
    static var previews: some View {
        UserProfileView()
    }
}
