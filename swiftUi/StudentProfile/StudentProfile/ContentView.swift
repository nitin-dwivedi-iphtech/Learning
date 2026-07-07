//
//  ContentView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 07/07/26.
//
import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView{
            ZStack {
              
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5),Color.blue.opacity(0.5), Color.purple.opacity(0.5)]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    HeaderView()
                        .padding(.horizontal, 20)
                    
                    CardView()
                }
            }
            .navigationBarHidden(true)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ProfileSetting())
    }
}
