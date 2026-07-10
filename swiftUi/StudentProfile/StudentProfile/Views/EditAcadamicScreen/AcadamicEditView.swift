//
//  AcadamicEditView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 09/07/26.
//

import SwiftUI

struct AcadamicEditView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var acadamicModel: AcadamicModel
    
    // Form States matching your academic structure
    @State private var universityName: String = "Stanford University"
    @State private var departmentName: String = "Department of Computer Science"
    @State private var courseName: String = "Master of Computer Applications"
    @State private var currentSemester: String = "Semester IV"
    @State private var studentID: String = "STU-2026-8942"
    @State private var currentCGPA: Float = 9.24
    @State private var attendanceRate: Float = 94
    @State private var completedCredits: Int16 = 78
    
    // Constants for graduation limits
    let totalRequiredCredits: Double = 90
    let semesters = ["Semester I", "Semester II", "Semester III", "Semester IV"]
    
    var body: some View {
        let firstRecord = acadamicModel.acadamics.first
        
        VStack(spacing: 0) {
            
            AcadamicEditHeaderView(acadamicModel: acadamicModel, universityName: $universityName, departmentName: $departmentName, courseName: $courseName, currentSemester: $currentSemester, studentID: $studentID, currentCGPA: $currentCGPA, attendanceRate: $attendanceRate, completedCredits: $completedCredits)
            
            Divider()
            
            Form {
                AcadamicInstitutionEditView(universityName: $universityName, departmentName: $departmentName, courseName: $courseName, currentSemester: $currentSemester)
                
                AcadamicEdit_Id_Performance(studentID:$studentID, currentCGPA:$currentCGPA, attendanceRate:$attendanceRate)
                
                AcademicEditCreditView(completedCredits: $completedCredits)
            }
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        .navigationBarHidden(true)
        .onAppear {
            universityName = firstRecord?.institution ?? ""
            departmentName = firstRecord?.departmentName ?? ""
            courseName = "\(firstRecord?.course, default: "")"
            currentSemester = "\(firstRecord?.currentSemester ?? "")"
            studentID = firstRecord?.studentId ?? ""
            currentCGPA = firstRecord?.cgpa ?? 0
            attendanceRate = firstRecord?.attendancePercentage ?? 0
            completedCredits = firstRecord?.creditsCompleted ?? 0
                
        }
    }
}

struct AcadamicEditView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AcadamicEditView(acadamicModel: AcadamicModel.shared)
                .preferredColorScheme(.light)
            AcadamicEditView(acadamicModel: AcadamicModel.shared)
                .preferredColorScheme(.dark)
        }
    }
}
