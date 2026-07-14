//
//  CustomTextField.swift
//  StudentProfile
//
//  Created by iPHTech6 on 08/07/26.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var text: String
    
    let title: String
    let placeholder: String
    let icon: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.system(size: 15, design: .rounded))
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
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
            .background(Color(.secondarySystemGroupedBackground))
            .cornerRadius(8)
        }
    }
}

struct CustomDatePicker: View {
    
    @Binding var selection: Date
    
    let title: String
    let icon: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.system(size: 15, design: .rounded))
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            HStack(spacing: 10) {
                Image(systemName: icon)
                    .foregroundColor(.blue)
                    .frame(width: 20)
                
                DatePicker("", selection: $selection, displayedComponents: .date)
                    .labelsHidden()
                    .font(.system(.body, design: .rounded))
                
                Spacer()
            }
            .padding()
            .background(Color(.secondarySystemGroupedBackground))
            .cornerRadius(8)
        }
    }
}

struct CustomGenderPicker: View {
    
    let options = ["Male", "Female"]
    
    @Binding var selectedGender: String
    
    let title: String
    let icon: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.system(size: 15, design: .rounded))
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            HStack(spacing: 16) {
                Image(systemName: icon)
                    .foregroundColor(.blue)
                    .frame(width: 20)
                
                HStack(spacing: 20) {
                    ForEach(options, id: \.self) { option in
                        Button(action: {
                            selectedGender = option
                        }) {
                            HStack(spacing: 6) {
                                Image(systemName: selectedGender == option ? "largecircle.fill.circle" : "circle")
                                    .font(.system(size: 18))
                                    .foregroundColor(selectedGender == option ? .blue : .secondary) // Fallback to adaptive grey
                                
                                Text(option)
                                    .font(.system(.body, design: .rounded))
                                    .foregroundColor(.primary)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                
                Spacer()
            }
            .padding()
            .background(Color(.secondarySystemGroupedBackground))
            .cornerRadius(8)
        }
    }
}

struct CustomFields_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            VStack(spacing: 20) {
                CustomTextField(text: .constant(""), title: "Email Address", placeholder: "enter email", icon: "envelope")
                CustomDatePicker(selection: .constant(Date()), title: "Date of Birth", icon: "calendar")
                CustomGenderPicker(selectedGender: .constant("Male"), title: "Gender", icon: "person.circle")
            }
            .padding()
            .preferredColorScheme(.light)
            .previewDisplayName("Light Mode")
            
            VStack(spacing: 20) {
                CustomTextField(text: .constant(""), title: "Email Address", placeholder: "enter email", icon: "envelope")
                CustomDatePicker(selection: .constant(Date()), title: "Date of Birth", icon: "calendar")
                CustomGenderPicker(selectedGender: .constant("Male"), title: "Gender", icon: "person.circle")
            }
            .padding()
            .preferredColorScheme(.dark)
            .previewDisplayName("Dark Mode")
        }
        .background(Color(.systemGroupedBackground))
    }
}
