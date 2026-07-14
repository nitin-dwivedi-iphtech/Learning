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
    @Environment(\.currentStudent) private var currentStudent: Student?
    @ObservedObject var academicModel: AcadamicModel
    
    
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
