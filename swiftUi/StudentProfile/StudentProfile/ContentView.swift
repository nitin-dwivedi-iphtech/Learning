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
    @EnvironmentObject var userSetting: ProfileSetting
    @State private var selectedTab = 0
    
    @FetchRequest(
        entity: Student.entity(), sortDescriptors: []
    ) var student: FetchedResults<Student>
    
    var body: some View {
        let currentStudent = student.first
        
        TabView(selection: $selectedTab) {
            NavigationView {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.blue.opacity(0.5), Color.purple.opacity(0.5)]), startPoint: .leading, endPoint: .trailing)
                        .ignoresSafeArea()
                    
                    VStack(spacing: 10) {
                        HStack {
                            HeaderView()
                            
                            Spacer()
                            
                            Button(action: {
                                withAnimation {
                                    userSetting.appDisplayTheme = (userSetting.appDisplayTheme + 1) % 3
                                }
                            }) {
                                Image(systemName: themeIconName)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.primary)
                                    .frame(width: 36, height: 36)
                                    .background(Color(.systemBackground).opacity(0.6))
                                    .clipShape(Circle())
                                    .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 2)
                            }
                        }
                        .padding(.horizontal, 20)
                        
                        CardView {
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
            
            NavigationView {
                if let validStudent = currentStudent {
                    DetailAcadamicView(academicModel: academicModel)
                        .environment(\.currentStudent, validStudent)
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
        .preferredColorScheme(selectedColorScheme)
    }
    
    private var themeIconName: String {
        switch userSetting.appDisplayTheme {
        case 1: return "sun.max.fill"
        case 2: return "moon.fill"
        default: return "circle.lefthalf.filled"
        }
    }
    
    private var selectedColorScheme: ColorScheme? {
        switch userSetting.appDisplayTheme {
        case 1: return .light
        case 2: return .dark
        default: return nil
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ProfileSetting())
    }
}
