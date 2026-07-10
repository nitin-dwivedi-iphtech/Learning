//
//  AcadamicEditHeaderView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 09/07/26.
//

import SwiftUI

struct AcadamicEditHeaderView: View {
    
    @ObservedObject var acadamicModel: AcadamicModel
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var universityName: String
    @Binding var departmentName: String
    @Binding var courseName: String
    @Binding var currentSemester: String
    @Binding var studentID: String
    @Binding var currentCGPA: Float
    @Binding var attendanceRate: Float
    @Binding var completedCredits: Int16
    
    var body: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Cancel")
                    .foregroundColor(.red)
                    .font(.body)
            }
            
            Spacer()
            
            Text("Edit Academics")
                .font(.system(size: 17, weight: .semibold, design: .rounded))
                .foregroundColor(.primary) // Auto-toggles black/white based on theme
            
            Spacer()
            
            Button(action: {
                // updates the array in acadamicModel
                acadamicModel.updateData(for: acadamicModel, universityName: universityName, departmentName: departmentName, courseName: courseName, currentSemester: currentSemester, currentCGPA: currentCGPA,attendanceRate: attendanceRate, completedCredits: completedCredits)
                
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Save")
                    .bold()
                    .font(.body)
            }
            .disabled(universityName.isEmpty || studentID.isEmpty)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        // Uses secondary group card background to look native on form pages
        .background(Color(.secondarySystemGroupedBackground))
        
    }
}

//struct AcadamicEditHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        AcadamicEditHeaderView(acadamicModel: <#AcadamicModel#>, universityName: <#Binding<String>#>, departmentName: <#Binding<String>#>, courseName: <#Binding<String>#>, currentSemester: <#Binding<String>#>, studentID: <#Binding<String>#>, currentCGPA: <#Binding<Float>#>, attendanceRate: <#Binding<Float>#>, completedCredits: <#Binding<Int16>#>)
//    }
//}
