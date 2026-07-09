//
//  AcadamicEditView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 09/07/26.
//

import SwiftUI

struct AcadamicEditView: View {
    @Environment(\.presentationMode) var presentationMode
    
    // Form States matching your academic structure
    @State private var universityName: String = "Stanford University"
    @State private var departmentName: String = "Department of Computer Science"
    @State private var courseName: String = "Master of Computer Applications"
    @State private var currentSemester: String = "Semester IV"
    @State private var studentID: String = "STU-2026-8942"
    @State private var currentCGPA: String = "9.24"
    @State private var attendanceRate: String = "94"
    @State private var completedCredits: Double = 78
    
    // Constants for graduation limits
    let totalRequiredCredits: Double = 90
    let semesters = ["Semester I", "Semester II", "Semester III", "Semester IV"]
    
    var body: some View {
        VStack(spacing: 0) {
            
            AcadamicEditHeaderView()
            
            Divider()
            
            Form {
               AcadamicInstitutionEditView(universityName: $universityName, departmentName: $departmentName, courseName: $courseName, currentSemester: $currentSemester)
                
                AcadamicEdit_Id_Performance(studentID:$studentID, currentCGPA:$currentCGPA, attendanceRate:$attendanceRate)
                
                AcadamicEditCreditView(completedCredits: $completedCredits)
            }
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        .navigationBarHidden(true)
    }
}

struct AcadamicEditView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AcadamicEditView()
                .preferredColorScheme(.light)
            AcadamicEditView()
                .preferredColorScheme(.dark)
        }
    }
}
