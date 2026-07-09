//
//  AcadamicEdit_Id_Performance.swift
//  StudentProfile
//
//  Created by iPHTech6 on 09/07/26.
//

import SwiftUI

struct AcadamicEdit_Id_Performance: View {
    @Binding var studentID: String
    @Binding var currentCGPA: String
    @Binding var attendanceRate: String
    
    var body: some View {
        Section(header: Text("Academic Metrics")) {
            AcademicInputField(label: "Student ID", text: $studentID, placeholder: "STU-YYYY-XXXX")
                .keyboardType(.numbersAndPunctuation)
            
            HStack {
                Text("Current CGPA")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Spacer()
                TextField("0.00", text: $currentCGPA)
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.trailing)
                    .font(.body)
                    .foregroundColor(.primary)
            }
            
            HStack {
                Text("Attendance Rate")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Spacer()
                HStack(spacing: 3) {
                    TextField("100", text: $attendanceRate)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(.primary)
                    Text("%")
                        .foregroundColor(.secondary)
                }
                .font(.body)
            }
        }
        
    }
}

//struct AcadamicEdit_Id_Performance_Previews: PreviewProvider {
//    static var previews: some View {
//        AcadamicEdit_Id_Performance()
//    }
//}
