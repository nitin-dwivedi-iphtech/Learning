//
//  UserEditHeaderView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 08/07/26.
//

import SwiftUI


struct UserEditHeaderView:View{
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View{
        HStack{
            
            Image(systemName: "chevron.backward")
                .font(.system(size: 18, weight: .semibold, design: .rounded))
                .foregroundColor(.primary)
                .onTapGesture {
                    self.presentationMode.wrappedValue.dismiss()
                }
                
            
            Text("Edit Profile")
                .font(.system(size: 25,design: .rounded))
                .fontWeight(.medium)
            
            Spacer()
        }.padding(.horizontal)
    }
}

struct UserEditHeader_Preview:PreviewProvider{
    static var previews: some View{
        UserEditHeaderView()
    }
}
