//
//  StudentContactView.swift
//  StudentProfile
//
//  Created by iPHTech 40 on 13/07/26.
//

import SwiftUI

struct StudentContactView: View {
    @Environment(\.openURL) var openURL
    @ObservedObject var student:Student
    
    private var phoneNumber: String {
        student.userPhone ?? "No Number Provided"
    }
    
    var body: some View {
        Button {
            let cleanedNumber = phoneNumber.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
            
            if let url = URL(string: "tel://\(cleanedNumber)") {
                openURL(url)
            }
        } label: {
            HStack(spacing: 10) {
                Image(systemName: "phone.fill")
                    .font(.system(size: 14, weight: .bold))
                
                Text(phoneNumber)
                    .font(.system(size: 15, weight: .semibold, design: .rounded))
            }
            .foregroundColor(.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(Color.green) // Classic phone color theme
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        }
    }
}

//#Preview {
//    StudentContactView(openURL: )
//}
