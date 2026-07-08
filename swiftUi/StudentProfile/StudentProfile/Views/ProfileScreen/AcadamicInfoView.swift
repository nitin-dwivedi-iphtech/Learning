//
//  AcadamicInfoView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 08/07/26.
//

import SwiftUI

struct AcadamicInfoView: View {
    // Mock / Static Data matching an MCA student portfolio
    let universityName = "Stanford University"
    let departmentName = "Department of Computer Science"
    let courseName = "Master of Computer Applications"
    let currentSemester = "Semester IV"
    let studentID = "STU-2026-8942"
    let currentCGPA = "9.24"
    let attendanceRate = "94%"
    
    var body: some View {
        ZStack {
            
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment:.leading,spacing: 20) {
                    HStack{
                        Text("Acadamics")
                            .font(.system(size: 23, weight: .bold, design: .rounded))
                        Spacer()
                        Image(systemName: "ellipsis")                            .font(.system(size: 16))
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            
                    }
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(universityName.uppercased())
                                    .font(.system(size: 12, weight: .bold, design: .rounded))
                                    .foregroundColor(.blue)
                                    .tracking(1.5)
                                
                                Text(courseName)
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                    .foregroundColor(.primary)
                                
                                Text(departmentName)
                                    .font(.system(size: 13, design: .rounded))
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            
                            Image(systemName: "graduationcap.circle.fill")
                                .font(.system(size: 40))
                                .foregroundColor(Color.blue.opacity(0.8))
                        }
                        
                        Divider().padding(.vertical, 4)
                        
                        HStack {
                            Label(currentSemester, systemImage: "clock.fill")
                            Spacer()
                            Label(studentID, systemImage: "person.text.rectangle.fill")
                        }
                        .font(.system(size: 13, weight: .medium, design: .rounded))
                        .foregroundColor(.secondary)
                    }
                    .padding(18)
                    .background(Color(.systemBackground))
                    .cornerRadius(18)
                    .shadow(color: Color.black.opacity(0.08), radius: 10, x: 0, y: 4)
                    
                    HStack(spacing: 16) {
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
                .padding(.horizontal, 8)
                .padding(.top, 15)
                .padding(.bottom, 25)
                .shadow(color: Color.black.opacity(0.08), radius: 10, x: 0, y: 4)
            }
        }
    }
}

struct PerformanceMetricBox: View {
    var title: String
    var value: String
    var subtitle: String
    var icon: String
    var accentColor: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: icon)
                    .font(.system(size: 16))
                    .foregroundColor(accentColor)
                Spacer()
                Text(title)
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundColor(.secondary)
                    .padding(.trailing,5)
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(value)
                    .font(.system(size: 26, weight: .bold, design: .rounded))
                    .foregroundColor(.primary)
                
                Text(subtitle)
                    .font(.system(size: 11))
                    .foregroundColor(.secondary)
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemBackground))
        .cornerRadius(18)
        .shadow(color: Color.black.opacity(0.03), radius: 12, x: 0, y: 6)
    }
}


struct AcadamicInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AcadamicInfoView()
            .preferredColorScheme(.light)
    }
}
