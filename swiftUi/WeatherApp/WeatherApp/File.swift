//
//  File.swift
//  WeatherApp
//
//  Created by iPHTech6 on 06/07/26.
//

import SwiftUI

struct Content:View{
    var isNight: Bool
    let forecast: WeatherDay
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: isNight ? [.black, .gray] : [.blue, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text(forecast.day)
                    .font(.largeTitle)
                    .bold()
                
                Image(systemName: forecast.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                
                Text("\(forecast.temp)°")
                    .font(.system(size: 70, weight: .bold))
                
                Text(forecast.description)
                    .font(.title2)
                    .italic()
            }
            .foregroundColor(.white)
        }
    }
    
}


struct Preview: PreviewProvider {
    static var previews: some View {
        Content()
    }
}
