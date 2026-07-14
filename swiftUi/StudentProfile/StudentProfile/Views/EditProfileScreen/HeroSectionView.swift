//
//  HeroSectionView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 08/07/26.
//

import SwiftUI

struct HeroSectionView: View {
    
    @Binding var name: String
    @Binding var email: String
    @Binding var phone: String
    @Binding var id: String
    @Binding var dob: Date
    @Binding var gender: String
    
    var progress: Double {
        let count: [Bool] = [
            !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
            !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
            !phone.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
            !id.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
            !gender.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        ]
        let total = Double(count.count)
        let filled = Double(count.filter({ $0 == true }).count)
        
        return filled / total
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 11) {
            
            ProgressView(value: progress)
                .frame(maxWidth: .infinity)
                .animation(.spring(response: 0.4, dampingFraction: 0.75), value: progress)
            
            Text("Complete your profile!")
                .font(.system(size: 20, design: .rounded))
                .fontWeight(.medium)
                .foregroundColor(.primary)
            
            Text("Fill details and feel free to contact for any query")
                .font(.system(size: 15, design: .rounded))
                .foregroundColor(.secondary)
            
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.secondarySystemGroupedBackground))
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }
}

struct HeroSection_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            HeroSectionView(
                name: .constant(""),
                email: .constant(""),
                phone: .constant(""),
                id: .constant(""),
                dob: .constant(Date()),
                gender: .constant("")
            )
            .preferredColorScheme(.light)
            .previewDisplayName("Light Mode")
            
            HeroSectionView(
                name: .constant(""),
                email: .constant(""),
                phone: .constant(""),
                id: .constant(""),
                dob: .constant(Date()),
                gender: .constant("")
            )
            .preferredColorScheme(.dark)
            .previewDisplayName("Dark Mode")
        }
        .background(Color(.systemGroupedBackground)) 
    }
}
