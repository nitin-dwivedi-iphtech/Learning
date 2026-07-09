//
//  AcadamicEditCreditView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 09/07/26.
//

import SwiftUI

struct AcadamicEditCreditView: View {
    
    @Binding var completedCredits:Double
    let totalRequiredCredits: Double = 90
    
    var body: some View {
        Section(header: Text("Credit Progress")) {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("Completed Credits")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text("\(Int(completedCredits)) / \(Int(totalRequiredCredits))")
                        .font(.body)
                        .bold()
                        .foregroundColor(.primary)
                }
                
                Slider(value: $completedCredits, in: 0...totalRequiredCredits, step: 1)
                    .accentColor(.orange)
            }
            .padding(.vertical, 4)
        }
    }
}

//struct AcadamicEditCreditView_Previews: PreviewProvider {
//    static var previews: some View {
//        AcadamicEditCreditView()
//    }
//}
