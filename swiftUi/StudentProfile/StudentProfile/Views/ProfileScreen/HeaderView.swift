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
    
    @Binding var showStatsSheet: Bool
    
    @ObservedObject var student: Student
    
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
                showStatsSheet = true
            }) {
                Image(systemName: "chart.bar.fill")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(.primary)
                    .frame(width: 36, height: 36)
                    .background(Color(.systemBackground).opacity(0.6))
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 2)
            }
            
            Button(action: {
                isShowingEditSheet = true
            }) {
                Image(systemName: "pencil")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(.primary)
                    .frame(width: 36, height: 36)
                    .background(Color(.systemBackground).opacity(0.6))
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 2)
            }
        }
        .sheet(isPresented: $isShowingEditSheet) {
            ProfileEditView(student: student)
        }
    }
}
