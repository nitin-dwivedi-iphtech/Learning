//
//  DetailAcadamicCoreMetrixView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 09/07/26.
//

import SwiftUI

struct DetailAcadamicCoreMetrixView: View {
    
    @ObservedObject var academicModel: AcadamicModel
    
    let attendanceRate = "94%"
    let completedCredits = "78 / 90"
    
    var body: some View {
        
        let firstRecord = academicModel.acadamics.first

        VStack(spacing: 14) {
            HStack(spacing: 14) {
                PerformanceMetricBox(
                    title: "Current CGPA",
                    value: "\(firstRecord?.cgpa, default: "0")",
                    subtitle: "Scale: 10.00",
                    icon: "chart.bar.doc.horizontal.fill",
                    accentColor: .blue
                )
                
                PerformanceMetricBox(
                    title: "Attendance",
                    value: "\(firstRecord?.attendancePercentage, default: "0")%",
                    subtitle: "Minimum: 75%",
                    icon: "checkmark.seal.fill",
                    accentColor: .green
                )
            }
            
        }
    }
}

struct DetailAcadamicCoreMetrixView_Previews: PreviewProvider {
    static var previews: some View {
        DetailAcadamicCoreMetrixView(academicModel: AcadamicModel.shared)
    }
}
