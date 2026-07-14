//
//  AcadamicEditCreditView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 09/07/26.
//

import SwiftUI

struct AcademicEditCreditView: View {
    
    @Binding var completedCredits: Int16
    let totalRequiredCredits: Double = 90
    
    var body: some View {
        
        // double proxy binding
        let sliderBinding = Binding<Double>(
            get: { Double(completedCredits) },
            set: { completedCredits = Int16($0) }
        )
        
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
                
                Slider(value: sliderBinding, in: 0...totalRequiredCredits, step: 1)
                    .accentColor(.orange)
            }
            .padding(.vertical, 4)
        }
    }
}

struct AcademicEditCreditView_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            AcademicEditCreditView(completedCredits: .constant(75))
        }
    }
}
