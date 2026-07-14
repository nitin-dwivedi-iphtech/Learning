//
//  DetailAcadamicEnrolledSubjectView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 09/07/26.
//

import SwiftUI

struct DetailAcadamicEnrolledSubjectView: View {
    
    @ObservedObject var academicModel: AcadamicModel
    
    private var coreDataSubjects: [Subjects] {
        guard let currentAcademicRecord = academicModel.acadamics.first else { return [] }
        
        if let subjectSet = currentAcademicRecord.subjectRecord as? Set<Subjects> {
            return Array(subjectSet)
        }
        
        return []
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Enrolled Subjects")
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .padding(.horizontal, 4)
            
            VStack(spacing: 0) {
                if coreDataSubjects.isEmpty {
                    Text("No Enrolled Subjects Found")
                        .font(.system(size: 14, weight: .medium, design: .rounded))
                        .foregroundColor(.secondary)
                        .padding(.vertical, 24)
                        .frame(maxWidth: .infinity, alignment: .center)
                } else {
                    // Show a preview of up to 3 subjects on the dashboard
                    ForEach(coreDataSubjects.prefix(3), id: \.objectID) { subject in
                        NavigationLink(destination: SubjectDetailView(subject: subject)) {
                            HStack(spacing: 14) {
                                Image(systemName: subject.subjectIcon ?? "book.closed.fill")
                                    .font(.system(size: 18))
                                    .foregroundColor(.blue)
                                    .frame(width: 36, height: 36)
                                    .background(Color.blue.opacity(0.12))
                                    .cornerRadius(10)
                                
                                VStack(alignment: .leading, spacing: 3) {
                                    Text(subject.subjectName ?? "Unknown Subject")
                                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                                        .foregroundColor(.primary)
                                        .lineLimit(1)
                                    
                                    HStack(spacing: 8) {
                                        Text("\(subject.subjectCode)")
                                            .font(.system(.caption, design: .monospaced))
                                            .padding(.horizontal, 5)
                                            .padding(.vertical, 2)
                                            .background(Color(.secondarySystemFill))
                                            .cornerRadius(4)
                                        
                                        Text("•   \(subject.credits) Credits")
                                            .font(.system(size: 12))
                                            .foregroundColor(.secondary)
                                    }
                                }
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(Color(.lightGray))
                            }
                            .padding(.vertical, 12)
                            .padding(.horizontal, 16)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Divider().padding(.leading, 66)
                    }
                    
                    // "See More" navigation cell to view all details
                    NavigationLink(destination: EnrolledSubjectsListView(subjects: coreDataSubjects)) {
                        HStack {
                            Text("See More Enrolled Subjects")
                                .font(.system(size: 14, weight: .bold, design: .rounded))
                                .foregroundColor(.blue)
                            Spacer()
                            Image(systemName: "arrow.right.circle.fill")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.blue)
                        }
                        .padding(.all, 14)
                        .background(Color.blue.opacity(0.05))
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .background(Color(.systemBackground))
            .cornerRadius(18)
            .shadow(color: Color.black.opacity(0.04), radius: 8, x: 0, y: 4)
        }
    }
}

struct DetailAcadamicEnrolledSubjectView_Previews: PreviewProvider {
    static var previews: some View {
        DetailAcadamicEnrolledSubjectView(academicModel: AcadamicModel.shared)
    }
}
