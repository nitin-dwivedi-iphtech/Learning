//
//  AcadamicInstitutionEditView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 09/07/26.
//

import SwiftUI

struct AcadamicInstitutionEditView: View {
    @Binding var universityName:String
    @Binding var departmentName:String
    @Binding var courseName:String
    @Binding var currentSemester:String
    
    let semesters = ["I", "II", "III", "IV"]
    
    
    var body: some View {
        Section(header: Text("Institution Info")) {
            AcademicInputField(label: "University", text: $universityName, placeholder: "Enter University Name")
            AcademicInputField(label: "Department", text: $departmentName, placeholder: "Enter Department")
            AcademicInputField(label: "Course / Degree", text: $courseName, placeholder: "Enter Course Name")
         
            Picker("Current Semester", selection: $currentSemester) {
                ForEach(semesters, id: \.self) { sem in
                    Text("Semester \(sem)").tag(sem)
                }
            }
            .pickerStyle(MenuPickerStyle())
            
        }
    }
}

//struct AcadamicInstitutionEditView_Previews: PreviewProvider {
//    static var previews: some View {
//        AcadamicInstitutionEditView()
//    }
//}
