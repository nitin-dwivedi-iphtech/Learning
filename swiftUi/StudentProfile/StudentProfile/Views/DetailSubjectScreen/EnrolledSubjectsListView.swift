//
//  EnrolledSubjectsListView.swift
//  StudentProfile
//
//  Created by iPHTech 40 on 14/07/26.
//

import SwiftUI

struct EnrolledSubjectsListView: View {
    
    let subjects: [Subjects]
    @State var searchText:String = ""
    
    var filterSubject:[Subjects]{
        if searchText.isEmpty {
            return subjects
        }
        else{
           return subjects.filter{ sub in
                sub.subjectName?.lowercased().contains(searchText.lowercased()) ?? false
            }
        }
    }
    
    var body: some View {
        if #available(iOS 15.0, *) {
            ScrollView {
                VStack(spacing: 16) {
                    
                    if subjects.isEmpty {
                        VStack(spacing: 12) {
                            Image(systemName: "book.closed.fill")
                                .font(.system(size: 40))
                                .foregroundColor(.secondary)
                            Text("No courses registered yet.")
                                .font(.system(.headline, design: .rounded))
                                .foregroundColor(.secondary)
                        }
                        .padding(.top, 60)
                    } else {
                        ForEach(filterSubject, id: \.objectID) { subject in
                            NavigationLink(destination: SubjectDetailView(subject: subject)) {
                                SubjectRowView(subject: subject)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground).ignoresSafeArea())
            .navigationTitle("Enrolled Courses")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText, prompt: "Search skills...")
        }
    }
}

struct SubjectRowView: View {
    let subject: Subjects
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 14) {
                Image(systemName: subject.subjectIcon ?? "book.closed.fill")
                    .font(.system(size: 20))
                    .foregroundColor(.blue)
                    .frame(width: 44, height: 44)
                    .background(Color.blue.opacity(0.12))
                    .cornerRadius(12)
                
                VStack(alignment: .leading, spacing: 3) {
                    Text(subject.subjectName ?? "Unknown Subject")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundColor(.primary)
                    
                    HStack(spacing: 8) {
                        Text("\(subject.subjectCode)")
                            .font(.system(.caption, design: .monospaced))
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(Color(.secondarySystemFill))
                            .cornerRadius(4)
                        
                        Text("•  \(subject.credits) Credits")
                            .font(.system(size: 13))
                            .foregroundColor(.secondary)
                    }
                }
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text("Course Progress")
                        .font(.system(size: 12, weight: .semibold, design: .rounded))
                        .foregroundColor(.secondary)
                    Spacer()
                    Text("\(Int16(subject.progress * 100))%")
                        .font(.system(size: 12, weight: .bold, design: .rounded))
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
            .padding(.top, 4)
        }
        .padding(.all, 16)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.03), radius: 6, x: 0, y: 3)
    }
}
