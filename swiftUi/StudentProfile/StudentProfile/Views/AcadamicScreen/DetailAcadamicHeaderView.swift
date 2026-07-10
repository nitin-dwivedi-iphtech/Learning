//
//  DetailAcadamicHeaderView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 09/07/26.
//

import SwiftUI

struct DetailAcadamicHeaderView: View {
    
    @ObservedObject var acadamicModel:AcadamicModel
    
    var body: some View {
        HStack(alignment:.center) {
            
            Text("Academic Profile")
                .font(.system(size: 26, weight: .bold, design: .rounded))
                .padding(.leading)
            Spacer()
            NavigationLink(destination:AcadamicEditView(acadamicModel: acadamicModel)){
                Image(systemName: "pencil.circle.fill")
                    .font(.title)
                    .foregroundColor(.blue)
                    .padding(.all,5)
                    .clipShape(Circle())
            }
        }
        .padding(.horizontal, 4)
        
        
    }
}

struct DetailAcadamicHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        DetailAcadamicHeaderView(acadamicModel: AcadamicModel.shared)
    }
}
