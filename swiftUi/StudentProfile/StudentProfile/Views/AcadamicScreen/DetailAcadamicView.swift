//
//  DetailAcadamicView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 08/07/26.
//

import SwiftUI
import CoreData

struct Subjec: Identifiable {
    let id = UUID()
    let code: String
    let name: String
    let credits: Int
    let iconName: String
    let tintColor: Color
}

struct DetailAcadamicView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var academicModel: AcadamicModel
    
    // Dynamic list for enrolled subjects
    let subjects = [
        Subjec(code: "MCA-401", name: "Advanced Software Engineering", credits: 4, iconName: "terminal.fill", tintColor: .purple),
        Subjec(code: "MCA-402", name: "Cloud Computing & DevOps", credits: 4, iconName: "cloud.fill", tintColor: .blue),
        Subjec(code: "MCA-403", name: "Big Data Analytics", credits: 3, iconName: "chart.pie.fill", tintColor: .orange),
        Subjec(code: "MCA-499", name: "Major Project / Dissertation", credits: 6, iconName: "doc.text.below.ecg.fill", tintColor: .pink)
    ]
    
    
    var body: some View {
        
        let firstRecord = academicModel.acadamics.first
        
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 5) {
                
                DetailAcadamicHeaderView(acadamicModel: academicModel)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    DetailAcadamicInstitutionView(acadamicModel: academicModel)
                    
                    
                    DetailAcadamicCoreMetrixView(academicModel: academicModel)
                    
                    
                    PerformanceMetricBox(
                        title: "Completed Credits",
                        value: "\(firstRecord?.creditsCompleted ?? 0)",
                        subtitle: "Required for graduation: 90 credits",
                        icon: "trophy.fill",
                        accentColor: .orange
                        
                    )
                    
                    
                    Divider().padding(.vertical)
                    
                    
                    SkillView()
                    
                    
                    Divider().padding(.vertical)
                    
                    
                    DetailAcadamicEnrolledSubjectView(academicModel: academicModel)
                    
                }
                
                .padding(.horizontal, 16)
                .padding(.top, 8)
            }
        }
        .navigationBarHidden(true)
    }
}

struct DetailAcadamicView_Previews: PreviewProvider {
    static var previews: some View {
        DetailAcadamicView(academicModel: AcadamicModel.shared)
    }
}
