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
    
    var body: some View{
        
        VStack{
            CustomTextField(text: $inputName, title: "Full Name", placeholder: "Enter your name", icon: "person")
            
            CustomTextField(text: $inputEmail, title: "Email Address", placeholder: "Enter your email", icon: "envelope")
            
            CustomTextField(text: $inputPhone, title: "Phone Number", placeholder: "Enter your phone", icon: "phone")
            
            CustomTextField(text: $inputId, title: "Enter ID", placeholder: "Enter student ID", icon: "id")
           
        }
    }
}

//struct UserEditFields_Preview:PreviewProvider{
//    static var previews: some View{
//        UserEditFieldsView(inputName: <#Binding<String>#>, inputEmail: <#Binding<String>#>, inputPhone: <#Binding<String>#>)
//    }
//}
