//
//  ContentView.swift
//  WeatherApp
//
//  Created by iPHTech6 on 06/07/26.
//

import SwiftUI

struct ContentView: View {
    @State var isNight:Bool = false
    var gradientColors: [Color] {
        isNight ? [.black, .gray] : [Color("BrandBlue"), Color("BrandWhite")]
    }
    var body: some View {
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                
                Text("Lucknow, IND")
                    .font(.system(size:40,weight:.medium))
                    .foregroundColor(isNight ? Color.white :Color.black)
                
                Image(systemName: isNight ? "cloud.rain" : "sun.max")
                    .resizable()
                    .frame(width: 160, height: 160, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .foregroundColor(isNight ? Color.blue :Color.yellow)
                
                Text("76°")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(isNight ? Color.white : Color.black)
                    .padding(.all,20)
                Spacer()
                
                HStack(spacing:40){
                    OtherWeatherContent(isNight: $isNight, day: "Mon", imageName: "cloud", temp: 50)
                    OtherWeatherContent(isNight: $isNight, day: "Tue", imageName: "sun.min", temp: 48)
                    OtherWeatherContent(isNight: $isNight, day: "Wed", imageName: "cloud.rain", temp: 74)
                    OtherWeatherContent(isNight: $isNight, day: "Thus", imageName: "sun.max", temp: 50)
                    OtherWeatherContent(isNight: $isNight, day: "Fri", imageName: "moon", temp: 50)
                }.padding(.horizontal)
                
                Spacer()
                
                Button{
                    isNight.toggle()
                } label:{
                    Text("Mode")
                        .font(.system(size:20))
                        .frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(15)
                }
                Spacer()
            }
            
          
        }
    }
}

struct OtherWeatherContent: View{
    @Binding var isNight:Bool
    var day:String
    var imageName:String
    var temp:Int
    
    var body: some View{
        VStack{
            Text("\(day)")
                .font(.system(size:20))
                .foregroundColor(isNight ? Color.white : Color.black)
            Image(systemName:imageName)
                .resizable()
                .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .foregroundColor(isNight ? Color.white : Color.black)
                
            Text("\(temp)°")
                .foregroundColor(isNight ? Color.white : Color.black)
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
