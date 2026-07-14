//
//  BarView.swift
//  StudentProfile
//
//  Created by iPHTech 40 on 14/07/26.
//

import SwiftUI


struct BarView: View {
    let day: String
    let height: CGFloat
    let color: Color
    
    var body: some View {
        VStack(spacing: 8) {
            Spacer()
            RoundedRectangle(cornerRadius: 6)
                .fill(color)
                .frame(height: height)
            
            Text(day)
                .font(.system(size: 11, weight: .semibold, design: .rounded))
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
    }
}

//#Preview {
//    BarView()
//}
