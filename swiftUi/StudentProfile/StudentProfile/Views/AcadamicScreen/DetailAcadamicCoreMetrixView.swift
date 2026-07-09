//
//  DetailAcadamicCoreMetrixView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 09/07/26.
//

import SwiftUI

struct DetailAcadamicCoreMetrixView: View {
    
    let currentCGPA = "9.24"
    let attendanceRate = "94%"
    let completedCredits = "78 / 90"
    
    var body: some View {
        VStack(spacing: 14) {
            HStack(spacing: 14) {
                PerformanceMetricBox(
                    title: "Current CGPA",
                    value: currentCGPA,
                    subtitle: "Scale: 10.00",
                    icon: "chart.bar.doc.horizontal.fill",
                    accentColor: .blue
                )
                
                PerformanceMetricBox(
                    title: "Attendance",
                    value: attendanceRate,
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
        DetailAcadamicCoreMetrixView()
    }
}
