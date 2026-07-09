//
//  DetailAcadamicView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 08/07/26.
//

import SwiftUI

// Model structure for clean representation of subjects
struct Subjec: Identifiable {
    let id = UUID()
    let code: String
    let name: String
    let credits: Int
    let iconName: String
    let tintColor: Color
}

struct DetailAcadamicView: View {
    // Mock / Static Data matching an MCA student portfolio
        let universityName = "Stanford University"
        let departmentName = "Department of Computer Science"
        let courseName = "Master of Computer Applications"
        let currentSemester = "Semester IV"
        let studentID = "STU-2026-8942"
        let currentCGPA = "9.24"
        let attendanceRate = "94%"
        let completedCredits = "78 / 90"
        
        @Environment(\.presentationMode) var presentationMode
        
        // Dynamic list for enrolled subjects
        let subjects = [
            Subjec(code: "MCA-401", name: "Advanced Software Engineering", credits: 4, iconName: "terminal.fill", tintColor: .purple),
            Subjec(code: "MCA-402", name: "Cloud Computing & DevOps", credits: 4, iconName: "cloud.fill", tintColor: .blue),
            Subjec(code: "MCA-403", name: "Big Data Analytics", credits: 3, iconName: "chart.pie.fill", tintColor: .orange),
            Subjec(code: "MCA-499", name: "Major Project / Dissertation", credits: 6, iconName: "doc.text.below.ecg.fill", tintColor: .pink)
        ]
        
        var body: some View {
            ZStack {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()
                
                    VStack(alignment: .center, spacing: 5) {
                        
                        // MARK: - Header
                        DetailAcadamicHeaderView()
                        
                        ScrollView(.vertical, showsIndicators: false) {
                        // MARK: - Institution Details Card
                        DetailAcadamicInstitutionView()
                        
                        // MARK: - Core Metrics Grid (CGPA, Credits & Attendance)
                       DetailAcadamicCoreMetrixView()
                            
                        PerformanceMetricBox(
                                title: "Completed Credits",
                                value: completedCredits,
                                subtitle: "Required for graduation: 90 credits",
                                icon: "trophy.fill",
                                accentColor: .orange
                        )
                            
                        Divider().padding(.vertical)
                        
                        SkillView()
                            
                        Divider().padding(.vertical)
                        
                        // MARK: - Enrolled Subjects Section
                        DetailAcadamicEnrolledSubjectView()
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 8)
                    .padding(.bottom, 10)
                }
            }.navigationBarHidden(true)
        }
}

struct DetailAcadamicView_Previews: PreviewProvider {
    static var previews: some View {
        DetailAcadamicView()
    }
}
