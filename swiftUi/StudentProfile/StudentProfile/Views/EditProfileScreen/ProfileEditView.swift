//
//  ProfileEditView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 07/07/26.
//

import SwiftUI
struct ProfileEditView : View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.currentStudent) var currentStudent
    @Environment(\.managedObjectContext) private var viewContext
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
    @State private var id: String = ""
    @State private var showAlert = false
    
    func validateField(name:String, email:String, phone:String)->Bool{
        let trimmedName = name.trimmingCharacters(in: .whitespacesAndNewlines)
            let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)
            let trimmedPhone = phone.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if trimmedName.isEmpty || trimmedEmail.isEmpty || trimmedPhone.isEmpty {
                return false
            }
            
             let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
            let isEmailValid = emailPredicate.evaluate(with: trimmedEmail)
            
             let phoneRegex = "^[0-9]{10}$"
            let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
            let isPhoneValid = phonePredicate.evaluate(with: trimmedPhone)
            
             return isEmailValid && isPhoneValid
    }
    
    var body:some View{
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("BrandWhite").opacity(0.5), Color.white.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                VStack(alignment:.center, spacing:20){
                    UserEditHeaderView()
                    
                    ScrollView{
                        HeroSectionView()
                        
                        UserImageView()
                        
                        CardView{
                            UserEditFieldsView(inputName: $name, inputEmail: $email, inputPhone: $phone, inputId: $id)
                                .padding(.horizontal, 20)
                                .padding(.bottom, 30)
                        }
                    }
                }
                
                Spacer(minLength: 10)
                
                Button(action: {
                     if validateField(name: name, email: email, phone: phone) {
                        saveData(name: name, email: email, phone: phone,id:id, student:currentStudent, viewContext:viewContext)
                        
                        self.presentationMode.wrappedValue.dismiss()
                    } else {
                        self.showAlert = true
                    }
                }) {
                    Text("Save")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.blue)
                        .cornerRadius(12)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 15)
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Invalid Input"),
                        message: Text("Please make sure all fields are filled properly. Check that your email is valid and your phone number contains 10 digits."),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
            
        }
        .navigationBarHidden(true)
        .onAppear{
            self.name = currentStudent?.username ?? ""
            self.email = currentStudent?.userEmail ?? ""
            self.phone = currentStudent?.userPhone ?? ""
            self.id = currentStudent?.studentId ?? ""
        }
    }
}


struct ProfileEdit_Preview : PreviewProvider{
    static var previews:some View{
        ProfileEditView()
            .environmentObject(ProfileSetting())
    }
}
