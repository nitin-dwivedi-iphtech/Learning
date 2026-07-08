//
//  HeroSectionView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 08/07/26.
//

import SwiftUI


struct HeroSectionView:View{
    var body: some View{
        
        VStack(alignment:.leading,spacing:11){
            
            ProgressView(value:0.35)
                .frame(maxWidth:.infinity)
            
            Text("Complete you profile !")
                .font(.system(size: 20,design: .rounded))
                .fontWeight(.medium)
            
            
            Text("Fill details and feel free to contact for any query")
                .font(.system(size: 15,design: .rounded))
                .foregroundColor(.gray)
            
        }.frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .padding(.horizontal)
    }
}


struct HeroSection_Preview:PreviewProvider{
    static var previews: some View{
        HeroSectionView()
    }
}
