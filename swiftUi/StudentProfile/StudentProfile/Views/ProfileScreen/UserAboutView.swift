//
//  UserAboutView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 07/07/26.
//

import SwiftUI

struct UserAboutView:View{
    
    var userBioData = """
    I am interested in coding and technologies.I like to solve complex problems and prarticipate in olampiyards.
    """
    
    var body: some View{
        Section{
            VStack(alignment: .leading, spacing: 12) {
                Text("About")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                        
                Text(userBioData)
                    .font(.system(size: 17, design: .rounded))
                    .fixedSize(horizontal: false, vertical: true)
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
