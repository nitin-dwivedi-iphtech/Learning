//
//  DetailAcadamicInstitutionView.swift
//  StudentProfile
//
//  Created by iPHTech 40 on 09/07/26.
//

import SwiftUI

struct DetailAcadamicInstitutionView: View {
    
    @ObservedObject var acadamicModel: AcadamicModel
    
    var body: some View {
        
        let firstRecord = acadamicModel.acadamics.first
        
        VStack(alignment: .leading, spacing: 16) {
            
            VStack(alignment: .leading, spacing: 8) {
                Text("\(firstRecord?.institution ?? "N/A")")
                    .font(.system(size: 11, weight: .bold, design: .rounded))
                    .foregroundColor(.blue)
                    .tracking(1)
                
                Text(firstRecord?.course ?? "N/A")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(.primary)
                    .fixedSize(horizontal: false, vertical: true)
                
                Text(firstRecord?.departmentName ?? "N/A")
                    .font(.system(size: 13, design: .rounded))
                    .foregroundColor(.secondary)
                    .padding(.bottom, 12)
                
                HStack {
                    Label("Semester \(firstRecord?.currentSemester ?? "N/A")", systemImage: "clock.fill")
                    Spacer()
                    Text("STU-2026-8942")
                }
                .font(.system(size: 12, weight: .medium, design: .rounded))
                .foregroundColor(.secondary)
            }
            .padding(20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(.systemBackground))
            .cornerRadius(18)
            .shadow(color: Color.black.opacity(0.03), radius: 10, x: 0, y: 5)
            
        }
        .padding(20)
    }
    
}

struct DetailAcadamicInstitutionView_Previews: PreviewProvider {
    static var previews: some View {
        DetailAcadamicInstitutionView(acadamicModel: AcadamicModel.shared)
    }
}
