//
//  HeaderView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 07/07/26.
//

import SwiftUI

struct HeaderView: View {
    
    @EnvironmentObject var userSetting: ProfileSetting
    @State private var isShowingEditSheet = false
    
    var body: some View {
        HStack {
            Text("My Profile")
                .font(.system(size: 30, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Spacer()
            
            Image(systemName: userSetting.isLiked ? "star.fill" : "star")
                .foregroundColor(.yellow)
                .padding(.all, 5)
                .onTapGesture {
                    userSetting.isLiked.toggle()
                }
            
            Button(action: {
                isShowingEditSheet = true
            }) {
                Image(systemName: "pencil.circle.fill")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.all, 5)
                    .clipShape(Circle())
            }
        }
        .sheet(isPresented: $isShowingEditSheet) {
            ProfileEditView()
        }
    }
}

struct HeaderPreview: PreviewProvider {
    static var previews: some View {
        
        HeaderView()
            .padding()
        
            .environmentObject(ProfileSetting())
    }
}
