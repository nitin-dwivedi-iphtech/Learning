//
//  AcadamicEdit_Id_Performance.swift
//  StudentProfile
//
//  Created by iPHTech6 on 09/07/26.
//

import SwiftUI

struct AcadamicEdit_Id_Performance: View {
    @Binding var studentID: String
    @Binding var currentCGPA: Float
    @Binding var attendanceRate: Float
    
    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    var body: some View {
        Section(header: Text("Academic Metrics")) {
            HStack {
                Text("Current CGPA")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Spacer()
                TextField("0.00", value: $currentCGPA, formatter: numberFormatter)
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
                    TextField("100", value: $attendanceRate, formatter: numberFormatter)
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
