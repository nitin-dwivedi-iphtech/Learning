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
    
    let semesters = ["Semester I", "Semester II", "Semester III", "Semester IV"]
    
    
    var body: some View {
        Section(header: Text("Institution Info")) {
            AcademicInputField(label: "University", text: $universityName, placeholder: "Enter University Name")
            AcademicInputField(label: "Department", text: $departmentName, placeholder: "Enter Department")
            AcademicInputField(label: "Course / Degree", text: $courseName, placeholder: "Enter Course Name")
            HStack{
                Picker("Current Semester", selection: $currentSemester) {
                    ForEach(semesters, id: \.self) { sem in
                        Text(sem).tag(sem)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                
                Spacer()
                
                Text("\(currentSemester)")
                    .font(.system(size:15))
            }
        }
    }
}

//struct AcadamicInstitutionEditView_Previews: PreviewProvider {
//    static var previews: some View {
//        AcadamicInstitutionEditView()
//    }
//}
