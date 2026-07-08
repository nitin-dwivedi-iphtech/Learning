//
//  CardView.swift
//  StudentProfile
//
//  Created by iPHTech6 on 07/07/26.
//

import SwiftUI

struct CardView<Content:View>: View {
    
    let content:Content
    
    init(@ViewBuilder content:()->Content){
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .clipShape(RoundedCorner(radius: 45, corners: [.topLeft, .topRight]))
            
            ScrollView{
                VStack(alignment: .leading) {
                    content
                } .padding(.top, 15)
                .padding(.horizontal, 15)
                .padding(.bottom, 60)
            }.padding(.top,15)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .ignoresSafeArea(edges: .bottom)
    }
}


struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let extendedRect = CGRect(
                    x: rect.origin.x,
                    y: rect.origin.y,
                    width: rect.size.width,
                    height: rect.size.height + 100
                )
                
                let path = UIBezierPath(
                    roundedRect: extendedRect,
                    byRoundingCorners: corners,
                    cornerRadii: CGSize(width: radius, height: radius)
                )
        return Path(path.cgPath)
    }
}
