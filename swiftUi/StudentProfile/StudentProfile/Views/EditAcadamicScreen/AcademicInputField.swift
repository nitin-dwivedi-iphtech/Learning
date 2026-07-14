//
//  AcademicInputField.swift
//  StudentProfile
//
//  Created by iPHTech6 on 09/07/26.
//

import SwiftUI

struct AcademicInputField: View {
    var label: String
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.caption)
                .foregroundColor(.blue)
                .bold()
            TextField(placeholder, text: $text)
                .font(.body)
                .foregroundColor(.primary)
        }
        .padding(.vertical, 2)
    }
}

//struct AcademicInputField_Previews: PreviewProvider {
//    static var previews: some View {
//        AcademicInputField()
//    }
//}
