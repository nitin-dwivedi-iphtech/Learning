//
//  UserPersonalView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 08/07/26.
//

import SwiftUI

struct UserPersonalView: View {
    @EnvironmentObject var userSetting: ProfileSetting
    
    let dateOfBirth = "October 14, 2002"
    let gender = "Female"
    
    var body: some View {
        Section {
            VStack(alignment: .leading, spacing: 16) {
                HStack{
                    
                    Text("Personal Details")
                        .font(.system(size: 23, weight: .bold, design: .rounded))
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    Image(systemName: "ellipsis")
                        .font(.system(size: 16))
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        
                }
                
                VStack(spacing: 14) {
                    PersonalDataRow(icon: "envelope.fill", label: "Email Address", value: userSetting.userEmail)
                    
                    PersonalDataRow(icon: "phone.fill", label: "Phone Number", value: userSetting.userPhone)
                    
                    PersonalDataRow(icon: "calendar", label: "Date of Birth", value: dateOfBirth)
                    
                    PersonalDataRow(icon: "person.fill", label: "Gender", value: gender)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }.padding(.bottom,20)
    }
}

struct PersonalDataRow: View {
    var icon: String
    var label: String
    var value: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.blue)
                .frame(width: 28, height: 28)
                .background(Color.blue.opacity(0.08))
                .clipShape(Circle())
            
            Text(label)
                .font(.system(size: 14, design: .rounded))
                .foregroundColor(.secondary)
            
            Spacer()
            
            Text(value)
                .font(.system(size: 14, weight: .semibold, design: .rounded))
                .foregroundColor(.primary)
                .multilineTextAlignment(.trailing)
                .lineLimit(1)
        }
    }
}

struct UserPersonalView_Previews: PreviewProvider {
    static var previews: some View {
        UserPersonalView()
            .environmentObject(ProfileSetting())
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
