import SwiftUI
import CoreData

@available(iOS 15.0, *)
struct StatsSummaryView: View {
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var student: Student
    
    var academicModel: AcadamicModel
    
    var academics: Acadamics? {
        academicModel.acadamics.first
    }
    
    private var averageProgress: Double {
        guard !academicModel.enrolledSubjects.isEmpty else { return 0.0 }
        let totalProgress = academicModel.enrolledSubjects.reduce(0.0) { $0 + $1.progress }
        return (totalProgress / Double(academicModel.enrolledSubjects.count)) * 100
    }
    
    private var totalCredits: Int16 {
        academics?.creditsCompleted ?? 0
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    
                    HStack(spacing: 16) {
                        StatCard(
                            title: "Current CGPA",
                            value: String(format: "%.2f", academics?.cgpa ?? 0.0),
                            subtitle: academics?.course ?? "No Course Registered",
                            icon: "graduationcap.fill",
                            color: .purple
                        )
                        
                        StatCard(
                            title: "Avg. Progress",
                            value: String(format: "%.0f%%", averageProgress),
                            subtitle: "\(totalCredits) Credits Earned",
                            icon: "doc.plaintext.fill",
                            color: .orange
                        )
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Subject Progression")
                            .font(.system(.headline, design: .rounded))
                            .foregroundColor(.primary)
                            .padding(.horizontal)
                        
                        VStack(spacing: 16) {
                            if academicModel.enrolledSubjects.isEmpty {
                                Text("No subjects added yet.")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .frame(height: 160)
                            } else {
                                HStack(alignment: .bottom, spacing: 14) {
                                    ForEach(academicModel.enrolledSubjects.prefix(7), id: \.self) { (subject: Subjects) in
                                        let progressValue: Double = subject.progress
                                        
                                        let codeValue: String = String(subject.subjectCode)
                                        
                                        let baseHeight: Double = max(progressValue, 0.1)
                                        let barHeight: CGFloat = CGFloat(baseHeight * 150.0)
                                        
                                        BarView(
                                            day: codeValue,
                                            height: barHeight,
                                            color: .blue
                                        )
                                    }
                                }
                                .frame(height: 160)
                                .padding(.top, 10)
                            }
                            
                            Divider()
                            
                            HStack {
                                Label(
                                    "Attendance: \(String(format: "%.1f%%", academics?.attendancePercentage ?? 0.0))",
                                    systemImage: "bolt.fill"
                                )
                                .font(.system(size: 13, weight: .semibold, design: .rounded))
                                .foregroundColor(.purple)
                                Spacer()
                            }
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(16)
                        .padding(.horizontal)
                    }
                    .padding(.top, 10)
                }
                .padding(.top)
            }
            .navigationTitle("Academic Stats")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.gray.opacity(0.6))
                    }
                }
            }
        }
    }
}

struct StatsSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        let sampleStudent = Student(context: context)
        let sampleModel = AcadamicModel.shared
        
        if #available(iOS 15.0, *) {
            StatsSummaryView(
                student: sampleStudent,
                academicModel: sampleModel
            )
            .preferredColorScheme(.dark)
        }
    }
}
