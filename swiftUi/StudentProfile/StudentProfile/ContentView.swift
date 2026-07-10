//
//  ContentView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 07/07/26.
//

//
//  ContentView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 07/07/26.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject private var academicModel = AcadamicModel.shared
    @State private var selectedTab = 0
    
    @FetchRequest(
        entity: Student.entity(), sortDescriptors: []
    ) var student : FetchedResults<Student>
    
    private func checkForEmptyData() {
        if student.isEmpty {
            Student.createDummyStudent(in: viewContext)
            Acadamics.createDummyAcadamics(in: viewContext)
            
            try? viewContext.save()
        }
    }
    
    var body: some View {
        
        let currentStudent = student.first
        
        TabView(selection: $selectedTab) {
            
            NavigationView {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.blue.opacity(0.5), Color.purple.opacity(0.5)]), startPoint: .leading, endPoint: .trailing)
                        .ignoresSafeArea()
                    
                    VStack(spacing: 10) {
                        HeaderView()
                            .padding(.horizontal, 20)
                        
                        CardView {
                            // data found
                            if let validStudent = currentStudent {
                                UserProfileView(student: validStudent)
                                    .padding(.bottom, 20)
                                
                                Section {
                                    UserAboutView()
                                        .padding(.leading, 8)
                                    
                                    Divider()
                                        .padding(.top, 10)
                                }
                                
                                Section {
                                    AcadamicInfoView(selectedTab: $selectedTab, acadamicModel: academicModel)
                                    
                                    Divider()
                                        .padding(.top, 10)
                                    
                                    UserPersonalView(student: validStudent)
                                }
                            } else {
                                // loading if data not found
                                VStack(spacing: 12) {
                                    ProgressView()
                                        .progressViewStyle(CircularProgressViewStyle())
                                    Text("Loading Profile...")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 40)
                            }
                        }
                    }
                }
                .navigationBarHidden(true)
                .onAppear {
                    checkForEmptyData()
                    if let validStudent = student.first, let studentId = validStudent.studentId {
                        academicModel.configure(studentId: studentId, context: viewContext)
                    }
                }
                .onChange(of: student.first) { newStudent in
                    if let validStudent = newStudent, let studentId = validStudent.studentId {
                        academicModel.configure(studentId: studentId, context: viewContext)
                    }
                }
                
            }.tabItem {
                Label("Home", systemImage: "house.fill")
            }
            .tag(0)
            
            // Acadamic View
            NavigationView {
                if currentStudent != nil {
                    DetailAcadamicView(academicModel: academicModel)
                } else {
                    VStack(spacing: 12) {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                        Text("Loading Profile...")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 40)
                }
            }.tabItem {
                Label("Acadamics", systemImage: "graduationcap.fill")
            }
            .tag(1)
            
        }
        .environment(\.currentStudent, currentStudent)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ProfileSetting())
    }
}
