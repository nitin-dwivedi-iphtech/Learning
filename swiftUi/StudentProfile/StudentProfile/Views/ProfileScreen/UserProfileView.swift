//
//  UserProfileView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 07/07/26.
//

import SwiftUI

// Handels the data fetching and passing to UserProfileView view
struct UserProfileLoader: View{
    @Environment(\.currentStudent) private var currentStudent
    var body: some View {
        if let student = currentStudent {
            UserProfileView(student: student)
        }
    }
}



struct UserProfileView: View {
    
    @ObservedObject var student: Student
        
    init(student:Student){
        self.student = student
    }
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 16) {
            
            Image("user")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
                .clipShape(Circle())
            
            
            VStack(alignment: .leading, spacing: 4) {
                Text(student.username ?? "N/A")
                    .font(.system(.title2, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text("Student Id: \(student.studentId ?? "N/A")")
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.secondary)
                
                
                HStack(spacing: 10) {
                    Label(student.userEmail ?? "N/A", systemImage: "envelope")
                    Text("•")
                        .foregroundColor(.secondary)
                    Label(student.userPhone ?? "N/A", systemImage: "phone")
                }
                .font(.system(size: 13, design: .rounded))
                .foregroundColor(.blue)
                .padding(.top, 2)
            }.lineLimit(1)
            
            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
    }
}

//struct UserProfilePreview: PreviewProvider {
//    static var previews: some View {
//        UserProfileViewstudent: <#Student?#>()
//            .environment(\.currentStudent, nil)
//            .previewLayout(.sizeThatFits)
//            .padding()
//    }
//}
