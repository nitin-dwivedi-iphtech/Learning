    //
    //  AcadamicInfoView.swift
    //  StudentProfile
    //
    //  Created by iPHTech6 on 08/07/26.
    //

    import SwiftUI

    struct AcadamicInfoView: View {
        // Mock / Static Data matching an MCA student portfolio
        let universityName = "Stanford University"
        let departmentName = "Department of Computer Science"
        let courseName = "Master of Computer Applications"
        let currentSemester = "Semester IV"
        let studentID = "STU-2026-8942"
        let currentCGPA = "9.24"
        let attendanceRate = "94%"
        
        @Binding var selectedTab: Int
        @ObservedObject var acadamicModel: AcadamicModel
        
        var body: some View {
            ZStack {
                    
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment:.leading,spacing: 20) {
                        HStack{
                            Text("Acadamics")
                                .font(.system(size: 23, weight: .bold, design: .rounded))
                            Spacer()
                            Image(systemName: "ellipsis")
                                .font(.system(size: 16))
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                .onTapGesture {
                                    withAnimation{
                                        selectedTab = 1
                                    }
                                }
                                
                        }
                        DetailAcadamicInstitutionView(acadamicModel: acadamicModel)
                        
                        DetailAcadamicCoreMetrixView(academicModel: acadamicModel)
                        
                    }
                    .padding(.horizontal, 8)
                    .padding(.top, 15)
                    .padding(.bottom, 25)
                    .shadow(color: Color.black.opacity(0.08), radius: 10, x: 0, y: 4)
                }
            }
        }
    }

    struct PerformanceMetricBox: View {
        var title: String
        var value: String
        var subtitle: String
        var icon: String
        var accentColor: Color
        
        var body: some View {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image(systemName: icon)
                        .font(.system(size: 16))
                        .foregroundColor(accentColor)
                    Spacer()
                    Text(title)
                        .font(.system(size: 12, weight: .medium, design: .rounded))
                        .foregroundColor(.secondary)
                        .padding(.trailing,5)
                }
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(value)
                        .font(.system(size: 26, weight: .bold, design: .rounded))
                        .foregroundColor(.primary)
                    
                    Text(subtitle)
                        .font(.system(size: 11))
                        .foregroundColor(.secondary)
                }
            }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(.systemBackground))
            .cornerRadius(18)
            .shadow(color: Color.black.opacity(0.03), radius: 12, x: 0, y: 6)
        }
    }


//    struct AcadamicInfoView_Previews: PreviewProvider {
//        static var previews: some View {
//            AcadamicInfoView()
//                .preferredColorScheme(.light)
//        }
//    }
