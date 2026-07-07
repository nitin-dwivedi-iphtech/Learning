//
//  SubjectView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 07/07/26.
//

import SwiftUI

struct SubjectView:View{
    
    let subjectData = [
        Subject(name: "COA", des: "Computer Organization", progress: 0.45),
        Subject(name: "DSA", des: "Data Structures", progress: 0.80),
        Subject(name: "OS", des: "Operating Systems", progress: 0.65),
        Subject(name: "DBMS", des: "Database Management Systems", progress: 0.90),
        Subject(name: "CN", des: "Computer Networks", progress: 0.30)
    ]
    
    var body: some View{
        Section{
            VStack(alignment: .leading, spacing: 12){
                Text("Subject")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                
                ForEach(subjectData){subject in
                    SubjectCard(name: subject.name, des: subject.des, progress: subject.progress)
                }
            }
        }
    }
}

struct SubjectCard:View{
    var name:String
    var des:String
    var progress:Float
    
    var body: some View{
        HStack {
            VStack(alignment: .leading) {
                
                Text(name)
                    .font(.headline)
                
                Text(des)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
                    
            Spacer()
                    
            ProgressView(value: progress)
                .frame(width: 100)
        }
    }
}

struct SubjectPreview:PreviewProvider{
    static var previews: some View {
        SubjectView()
    }
}
