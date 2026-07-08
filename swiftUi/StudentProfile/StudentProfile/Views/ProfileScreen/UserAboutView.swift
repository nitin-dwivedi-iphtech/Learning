//
//  UserAboutView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 07/07/26.
//

import SwiftUI

struct UserAboutView:View{
    @State private var isExpanded: Bool = false
    var userBioData = """
        I am a passionate software engineering student specializing in building efficient mobile architectures and clean user interfaces. My primary technical focus centers around native iOS development, state management solutions, and microservices architecture. I routinely spend my free time analyzing algorithmic edge cases, debugging complex concurrency issues, and competing in local programming hackathons.
        
        Beyond writing code, I love breaking down intricate computer science concepts into digestible ideas for open-source documentation. My current academic goals include deep-diving into machine learning pipelines and exploring real-time database synchronizations. I thrive in collaborative environments where I can build impactful tools that solve genuine, day-to-day productivity challenges for users globally.
        """
    
    var body: some View{
        Section{
            VStack(alignment: .leading, spacing: 12) {
                Text("About")
                    .font(.system(size: 23, weight: .bold, design: .rounded))
                        
                Text(userBioData)
                    .font(.system(size: 16, design: .rounded))
                    .foregroundColor(Color.gray)
                    .lineSpacing(4)
                    .lineLimit(isExpanded ? nil : 3)
                    .fixedSize(horizontal: false, vertical: true)
                Button(action: {
                            withAnimation(.easeInOut(duration: 0.25)) {
                                isExpanded.toggle()
                            }
                }) {
                        HStack(spacing: 4) {
                            Text(isExpanded ? "Read Less" : "Read More")
                            Image(systemName: isExpanded ? "chevron.up" :"chevron.down")
                                .font(.system(size: 12, weight: .bold))
                        }
                        .font(.system(size: 14, weight: .bold, design: .rounded))
                        .foregroundColor(.blue)
                        .padding(.vertical, 4)
                }
            
                            
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct UserAboutPreview:PreviewProvider {
    static var previews: some View {
        UserAboutView()
    }
}
