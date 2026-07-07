//
//  CardView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 07/07/26.
//

import SwiftUI

struct CardView: View {
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                UserProfileView()
                    .padding(.bottom,20)
                
                UserAboutView()
                    .padding(.leading,8)
                
                SkillView()
                    .padding(.top,20)
                    .padding(.leading,8)
                
                SubjectView()
                    .padding(.top,20)
                    .padding(.leading,8)
            }
        }
        .padding(.top,30)
        .padding(.horizontal,5)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.white)
        .cornerRadius(45)
        .ignoresSafeArea(edges: .bottom)
    }
}

struct CardPreview:PreviewProvider{
    static var previews: some View {
        CardView()
    }
}
