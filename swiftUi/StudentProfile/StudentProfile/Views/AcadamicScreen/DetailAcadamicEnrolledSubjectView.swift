//
//  DetailAcadamicEnrolledSubjectView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 09/07/26.
//

import SwiftUI

struct DetailAcadamicEnrolledSubjectView: View {
    
    
    let universityName = "Stanford University"
    let departmentName = "Department of Computer Science"
    let courseName = "Master of Computer Applications"
    let currentSemester = "Semester IV"
    let studentID = "STU-2026-8942"
    let currentCGPA = "9.24"
    let attendanceRate = "94%"
    let completedCredits = "78 / 90"
    
    let subjects = [
        Subjec(code: "MCA-401", name: "Advanced Software Engineering", credits: 4, iconName: "terminal.fill", tintColor: .purple),
        Subjec(code: "MCA-402", name: "Cloud Computing & DevOps", credits: 4, iconName: "cloud.fill", tintColor: .blue),
        Subjec(code: "MCA-403", name: "Big Data Analytics", credits: 3, iconName: "chart.pie.fill", tintColor: .orange),
        Subjec(code: "MCA-499", name: "Major Project / Dissertation", credits: 6, iconName: "doc.text.below.ecg.fill", tintColor: .pink)
    ]
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Enrolled Subjects")
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .padding(.horizontal, 4)
            
            VStack(spacing: 0) {
                ForEach(subjects) { subject in
                    HStack(spacing: 14) {
                        Image(systemName: subject.iconName)
                            .font(.system(size: 18))
                            .foregroundColor(subject.tintColor)
                            .frame(width: 36, height: 36)
                            .background(subject.tintColor.opacity(0.12))
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading, spacing: 3) {
                            Text(subject.name)
                                .font(.system(size: 15, weight: .semibold, design: .rounded))
                                .foregroundColor(.primary)
                                .lineLimit(1)
                            
                            HStack(spacing: 8) {
                                Text(subject.code)
                                    .font(.system(.caption, design: .monospaced))
                                    .padding(.horizontal, 5)
                                    .padding(.vertical, 2)
                                    .background(Color(.secondarySystemFill))
                                    .cornerRadius(4)
                                
                                Text("•   \(subject.credits) Credits")
                                    .font(.system(size: 12))
                                    .foregroundColor(.secondary)
                            }
                        }
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(Color(.lightGray))
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                    
                    if subject.id != subjects.last?.id {
                        Divider().padding(.leading, 66)
                    }
                }
            }
            .background(Color(.systemBackground))
            .cornerRadius(18)
            .shadow(color: Color.black.opacity(0.04), radius: 8, x: 0, y: 4)
        }
    }
}

struct DetailAcadamicEnrolledSubjectView_Previews: PreviewProvider {
    static var previews: some View {
        DetailAcadamicEnrolledSubjectView()
    }
}
