//
//  UserPdfView.swift
//  StudentProfile
//
//  Created by iPHTech 40 on 13/07/26.
//

import SwiftUI
import CoreData

@MainActor
struct UserPdfView: View {
    @ObservedObject var student: Student
    let academicModel: AcadamicModel = AcadamicModel.shared
    
    private let labelWidth: CGFloat = 140
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("STUDENT PORTFOLIO REPORT")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundColor(.primary)
                    Text("Generated on \(dateFormatter.string(from: Date()))")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Spacer()
                Image(systemName: "person.crop.circle.badge.checkmark")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
            }
            
            Divider()
            
            VStack(alignment: .leading, spacing: 14) {
                Text("Personal Profile")
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(.blue)
                    .textCase(.uppercase)
                
                VStack(alignment: .leading, spacing: 10) {
                    infoRow(label: "Full Name:", value: student.username ?? "N/A")
                    infoRow(label: "Student ID:", value: student.studentId ?? "N/A")
                    infoRow(label: "Email Address:", value: student.userEmail ?? "N/A")
                    infoRow(label: "Phone Number:", value: student.userPhone ?? "N/A")
                    infoRow(label: "Gender:", value: student.gender ?? "N/A")
                    
                    if let dob = student.dob {
                        infoRow(label: "Date of Birth:", value: dateFormatter.string(from: dob))
                    } else {
                        infoRow(label: "Date of Birth:", value: "N/A")
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 14) {
                Text("Academic Performance")
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(.blue)
                    .textCase(.uppercase)
                
                VStack(alignment: .leading, spacing: 10) {
                    infoRow(label: "Current Status:", value: "Enrolled")
                    infoRow(label: "Evaluation Period:", value: "Fall Semester 2026")
                    infoRow(label: "Academic Record:", value: "Verified by Registrar Office")
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(8)
            
            Spacer()
            
            Text("Confidential Document - Student Profile System")
                .font(.caption2)
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding(40)
        .frame(width: 612, height: 792) 
        .background(Color(.systemBackground))
    }
    
    private func infoRow(label: String, value: String) -> some View {
        HStack(alignment: .top, spacing: 8) {
            Text(label)
                .font(.system(size: 14, weight: .semibold, design: .rounded))
                .foregroundColor(.secondary)
                .frame(width: labelWidth, alignment: .leading)
            
            Text(value)
                .font(.system(size: 14, weight: .regular, design: .rounded))
                .foregroundColor(.primary)
        }
    }
}

#Preview {
    let dummyContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    let mockStudent = Student(context: dummyContext)
    
    mockStudent.username = "John Doe"
    mockStudent.studentId = "STU-2026-8942"
    mockStudent.userEmail = "johndoe@stanford.edu"
    mockStudent.userPhone = "+1 (555) 019-2834"
    mockStudent.gender = "Male"
    mockStudent.dob = Calendar.current.date(byAdding: .year, value: -20, to: Date())
    
    return UserPdfView(student: mockStudent)
}
