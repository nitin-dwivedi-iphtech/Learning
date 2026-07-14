//
//  SubjectDetailView.swift
//  StudentProfile
//
//  Created by iPHTech 40 on 14/07/26.
//

import SwiftUI

struct SubjectDetailView: View {
    
    let subject: Subjects
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                VStack(spacing: 12) {
                    Image(systemName: subject.subjectIcon ?? "book.closed.fill")
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                        .frame(width: 84, height: 84)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .shadow(color: Color.blue.opacity(0.3), radius: 8, x: 0, y: 4)
                    
                    Text(subject.subjectName ?? "Unknown Subject")
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.primary)
                    
                    Text("\(subject.subjectCode)")
                        .font(.system(.subheadline, design: .monospaced))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Color(.secondarySystemFill))
                        .cornerRadius(6)
                }
                .padding(.top, 10)
                
                HStack(spacing: 16) {
                    DetailMetricCard(title: "Credits Weight", value: "\(subject.credits) Units", icon: "bookmark.fill", color: .purple)
                    DetailMetricCard(title: "Status", value: "In Progress", icon: "checkmark.circle.fill", color: .green)
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 14) {
                    Text("Subject Coverage Progress")
                        .font(.system(size: 15, weight: .bold, design: .rounded))
                        .foregroundColor(.primary)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Syllabus Completed")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.secondary)
                            Spacer()
                            Text("\(Int16(subject.progress * 100))%")
                                .font(.system(size: 13, weight: .bold, design: .rounded))
                                .foregroundColor(.blue)
                        }
                        
                        if #available(iOS 15.0, *) {
                            ProgressView(value: subject.progress, total: 1.0)
                                .tint(.blue)
                                .background(Color.blue.opacity(0.12))
                                .scaleEffect(x: 1, y: 1.5, anchor: .center)
                                .clipShape(Capsule())
                                .frame(height: 10)
                        }
                    }
                }
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(16)
                .shadow(color: Color.black.opacity(0.03), radius: 6, x: 0, y: 3)
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Course Description")
                        .font(.system(size: 15, weight: .bold, design: .rounded))
                        .foregroundColor(.primary)
                    
                    Text("This course covers fundamental to advanced conceptual modules designed to establish practical capabilities and subject-specific academic achievements.")
                        .font(.system(size: 13, design: .rounded))
                        .foregroundColor(.secondary)
                        .lineSpacing(4)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(.systemBackground))
                .cornerRadius(16)
                .shadow(color: Color.black.opacity(0.03), radius: 6, x: 0, y: 3)
                .padding(.horizontal)
            }
            .padding(.bottom, 24)
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        .navigationTitle("Subject Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailMetricCard: View {
    let title: String
    let value: String
    let icon: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Image(systemName: icon)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(color)
            
            Text(value)
                .font(.system(size: 16, weight: .bold, design: .rounded))
                .foregroundColor(.primary)
            
            Text(title)
                .font(.system(size: 11, weight: .medium))
                .foregroundColor(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemBackground))
        .cornerRadius(14)
        .shadow(color: Color.black.opacity(0.02), radius: 4, x: 0, y: 2)
    }
}
