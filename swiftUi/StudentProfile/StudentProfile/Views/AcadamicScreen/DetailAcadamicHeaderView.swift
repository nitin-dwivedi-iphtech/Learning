//
//  DetailAcadamicHeaderView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 09/07/26.
//

import SwiftUI

struct DetailAcadamicHeaderView: View {
    
    @State private var isShowingEditSheet = false
    @ObservedObject var acadamicModel:AcadamicModel
    
    var body: some View {
        HStack(alignment:.center) {
            
            Text("Academic Profile")
                .font(.system(size: 26, weight: .bold, design: .rounded))
                .padding(.leading)
            Spacer()
            Image(systemName: "pencil.circle.fill")
                .font(.title)
                .foregroundColor(.blue)
                .padding(.all,5)
                .clipShape(Circle())
                .onTapGesture{
                    isShowingEditSheet = true
                }
            
        }
        .padding(.horizontal, 4)
        .sheet(isPresented: $isShowingEditSheet) {
            AcadamicEditView(acadamicModel: acadamicModel)
        }
        
    }
}

struct DetailAcadamicHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        DetailAcadamicHeaderView(acadamicModel: AcadamicModel.shared)
    }
}
