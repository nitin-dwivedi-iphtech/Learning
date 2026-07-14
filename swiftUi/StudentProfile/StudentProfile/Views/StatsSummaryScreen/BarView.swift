//
//  BarView.swift
//  StudentProfile
//
//  Created by iPHTech 40 on 14/07/26.
//

import SwiftUI
import Charts

struct BarView: View {
    let subjects: [Subjects]
    let color: Color
    
    var body: some View {
        VStack(spacing: 0) {
            if #available(iOS 16.0, *) {
                Chart(subjects, id: \.self) { subject in
                    BarMark(
                        x: .value("Subject Code", String(subject.subjectCode )),
                        y: .value("Progression", max(subject.progress, 0.01))
                    )
                    .foregroundStyle(
                        LinearGradient(
                            gradient: Gradient(colors: [color, color.opacity(0.6)]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .cornerRadius(8)
                }
                .frame(height: 150)
                .chartYScale(domain: 0...1.0)
                .chartXAxis(.hidden)
                .chartYAxis(.hidden)
            }
            
            HStack(spacing: 0) {
                ForEach(subjects, id: \.self) { subject in
                    Text(String(subject.subjectCode))
                        .font(.system(size: 11, weight: .semibold, design: .rounded))
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.top, 10)
        }
    }
}
