//
//  SkillsView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 07/07/26.
//

import SwiftUI



struct SkillView:View{
    
    let skills: [Skills] = [
            Skills(name: "Soccer", image: "sun.max"),
            Skills(name: "Java", image: "sun.max"),
            Skills(name: "Swift", image: "swift"),
            Skills(name: "Hockey", image: "sun.max"),
            Skills(name: "UI/UX", image: "paintpalette"),
            Skills(name: "ML", image: "cpu")
        ]
    
    let columns = [
            GridItem(.adaptive(minimum: 100), spacing: 10)
        ]
    
    var body: some View{
        Section{
            VStack(alignment: .leading, spacing: 12){
                Text("Skills")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                  
                LazyVGrid(columns: columns,alignment: .center, spacing: 10){
                    ForEach(skills){skill in
                        MetaSkillView(skill:skill.name, image: skill.image)
                    }
                }
            
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}


struct MetaSkillView:View{
    
    var skill:String
    var image:String
    
    var body: some View{
        HStack(alignment:.center,spacing:10){
            Image(systemName:image)
                .padding(.leading,5)
            
            Text("\(skill)")
                .font(.system(size: 15, design: .rounded))
                .padding(.all,10)
              
        }.background(Color("BrandBlue"))
        .cornerRadius(10)
        
    }
}

struct SkillPreview:PreviewProvider{
    static var previews: some View {
        ContentView()
    }
}
