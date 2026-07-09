//
//  UserEditFieldsView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 08/07/26.
//

import SwiftUI



struct UserEditFieldsView:View{
    
    @Binding var inputName: String
    @Binding var inputEmail: String
    @Binding var inputPhone: String
    @Binding var inputId: String
    @Binding var inputDate: Date
    @Binding var inputGender: String
    
    var body: some View{
        
        VStack{
            
            CustomTextField(text: $inputId, title: "Student ID", placeholder: "Enter student ID", icon: "id")
            
            CustomTextField(text: $inputName, title: "Full Name", placeholder: "Enter your name", icon: "person")
            
            CustomTextField(text: $inputEmail, title: "Email Address", placeholder: "Enter your email", icon: "envelope")
            
            CustomTextField(text: $inputPhone, title: "Phone Number", placeholder: "Enter your phone", icon: "phone")
            
            CustomDatePicker(selection:$inputDate,title: "Date of Birth", icon: "calendar")
            
            CustomGenderPicker(selectedGender: $inputGender,title: "Gender",  icon: "person.and.arrow.left.and.arrow.right")
           
        }
    }
}

//struct UserEditFields_Preview:PreviewProvider{
//    static var previews: some View{
//        UserEditFieldsView(inputName: <#Binding<String>#>, inputEmail: <#Binding<String>#>, inputPhone: <#Binding<String>#>)
//    }
//}
