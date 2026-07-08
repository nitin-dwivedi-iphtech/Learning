//
//  ContentView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 07/07/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab = 0
    
    @FetchRequest(
        entity: Student.entity(), sortDescriptors: []
    ) var student : FetchedResults<Student>
    
    var body: some View {
        
        let currentStudent = student.first
        
        TabView(selection:$selectedTab){
            
            NavigationView{
                ZStack {
                  
                    LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5),Color.blue.opacity(0.5), Color.purple.opacity(0.5)]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                    .ignoresSafeArea()
                    
                    VStack(spacing: 20) {
                        HeaderView()
                            .padding(.horizontal, 20)
                        
                        CardView{
                            UserProfileView(student: currentStudent)
                                .padding(.bottom,20)
                            
                            Section {
                                UserAboutView()
                                    .padding(.leading,8)
                                
                                Divider()
                                    .padding(.top, 10)
                            }
                            Section {
                                AcadamicInfoView()
                                
                                Divider()
                                    .padding(.top, 10)
                                
//                                SkillView()
//                                    .padding(.top,20)
//                                    .padding(.leading,8)
//
//                                SubjectView()
//                                    .padding(.top,20)
//                                    .padding(.leading,8)
                                UserPersonalView()
                                
                                
                            }
                        }
                    }
                }
                .navigationBarHidden(true)
            
            }.tabItem {
                Label("Home", systemImage: "house.fill")
            }
            .tag(0)
            
            // Acadamic View
            NavigationView{
                DetailAcadamicView()
            }.tabItem {
                Label("Acadamics", systemImage: "graduationcap.fill")
            }
            .tag(1)
            
        }.environment(\.currentStudent, currentStudent)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ProfileSetting())
    }
}
