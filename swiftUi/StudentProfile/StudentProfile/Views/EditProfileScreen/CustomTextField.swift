//
//  CustomTextField.swift
//  StudentProfile
//
//  Created by iPHTech6 on 08/07/26.
//

import SwiftUI


struct CustomTextField: View {
    
    @Binding var text: String
    @EnvironmentObject var userSetting:ProfileSetting
    
    let title: String
    let placeholder: String
    let icon: String
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.system(size:15, design: .rounded))
                .fontWeight(.semibold)
//                .foregroundColor(.gray)
            
            HStack(spacing: 10) {
                Image(systemName: icon)
                    .foregroundColor(.blue)
                    .frame(width: 20)
                
                TextField(placeholder, text: $text)
                    .font(.system(.body, design: .rounded))
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(8)
        }
    }
}


//struct CustomTextField_Preview: PreviewProvider {
//    static var previews: some View {
//        CustomTextField(
//            title: "Email Address",
//            placeholder: "enter email",
//            text: .constant("\(text)"), // Pass a static binding string here
//            icon: "envelope"     // SF Symbol name string
//        )
//    }
//}
