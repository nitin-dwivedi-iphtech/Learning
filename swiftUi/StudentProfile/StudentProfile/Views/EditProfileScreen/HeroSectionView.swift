//
//  HeroSectionView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 08/07/26.
//

import SwiftUI


struct HeroSectionView:View{
    
    @Binding  var name: String
    @Binding  var email: String
    @Binding  var phone: String
    @Binding  var id: String
    @Binding  var dob: Date
    @Binding  var gender: String
    
    var progress: Double {
        let count:[Bool] = [
            !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
            !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
            !phone.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
            !id.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
            !gender.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        ]
        let total = Double(count.count)
        let filled = Double(count.filter({ value in
            value == true
        }).count)
        
        return filled/total
    }
    
    var body: some View{
        
        VStack(alignment:.leading,spacing:11){
            
            ProgressView(value:progress)
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
        HeroSectionView(
            name: .constant(""),
            email: .constant(""),
            phone: .constant(""),
            id: .constant(""),
            dob: .constant(Date()),
            gender: .constant("")
        )
    }
}
