//
//  ProfileEditView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 07/07/26.
//
//
//  ProfileEditView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 07/07/26.
//

import SwiftUI

struct ProfileEditView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var student: Student
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var selectedImage: UIImage? = nil
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
    @State private var id: String = ""
    @State private var dob: Date = Date()
    @State private var gender: String = ""
    @State private var showAlert = false
    
    func validateField(name: String, email: String, phone: String) -> Bool {
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
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                UserEditHeaderView()
                    .padding(.top, 10)
                
                ScrollView {
                    VStack(spacing: 20) {
                        HeroSectionView(name: $name, email: $email, phone: $phone, id: $id, dob: $dob, gender: $gender)
                        
                        if #available(iOS 16.0, *) {
                            UserImageView(student: student, selectedImage: $selectedImage, size: 70)
                        } else {
                            Group {
                                if let selectedImage = selectedImage {
                                    Image(uiImage: selectedImage)
                                        .resizable()
                                } else {
                                    Image("user")
                                        .resizable()
                                        .renderingMode(.template)
                                        .foregroundColor(.secondary)
                                }
                            }
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                        }
                        
                        CardView {
                            UserEditFieldsView(inputName: $name, inputEmail: $email, inputPhone: $phone, inputId: $id, inputDate: $dob, inputGender: $gender)
                                .padding(.horizontal, 20)
                                .padding(.bottom, 30)
                        }
                    }
                    .padding(.top, 12)
                }
                
                Spacer(minLength: 10)
                
                Button(action: {
                    if validateField(name: name, email: email, phone: phone) {
                        
                        saveProfileChanges(name: name, email: email, phone: phone, id: id, gender: gender, dob: dob, viewContext: viewContext, selectedImage: selectedImage)
                        
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
                .padding(.vertical, 15)
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Invalid Input"),
                        message: Text("Please make sure all fields are filled properly. Check that your email is valid and your phone number contains 10 digits."),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
        }
        .onAppear {
            self.name = student.username ?? ""
            self.email = student.userEmail ?? ""
            self.phone = student.userPhone ?? ""
            self.id = student.studentId ?? ""
            self.gender = student.gender ?? ""
            
            if let filename = student.userImage, !filename.isEmpty {
                let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                let fileURL = documentsDirectory.appendingPathComponent(filename)
                
                if let data = try? Data(contentsOf: fileURL, options: .uncached), let uiImage = UIImage(data: data) {
                    self.selectedImage = uiImage
                }
            }
        }
    }
}
