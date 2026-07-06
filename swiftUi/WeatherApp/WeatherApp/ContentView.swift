//
//  ContentView.swift
//  WeatherApp
//
//  Created by iPHTech6 on 06/07/26.
//

import SwiftUI

struct WeatherDay: Identifiable, Hashable {
    let id = UUID()
    let day: String
    let imageName: String
    let temp: Int
    let description: String
}

struct LazyView<Content: View>: View {
    let build: () -> Content
    
    var body: some View {
        build()
    }
}

struct ContentView: View {
    @State var isNight: Bool = false
    var gradientColors: [Color] {
        isNight ? [.black, .gray] : [Color("BrandBlue"), Color("BrandWhite")]
    }
    
    let weeklyForecast = [
        WeatherDay(day: "Mon", imageName: "cloud", temp: 50, description: "Mostly Cloudy"),
        WeatherDay(day: "Tue", imageName: "sun.min", temp: 48, description: "Partly Sunny"),
        WeatherDay(day: "Wed", imageName: "cloud.rain", temp: 74, description: "Heavy Rain Showers"),
        WeatherDay(day: "Thu", imageName: "sun.max", temp: 50, description: "Clear and Sunny"),
        WeatherDay(day: "Fri", imageName: "moon", temp: 50, description: "Clear Night")
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    Text("Lucknow, IND")
                        .font(.system(size:40, weight:.medium))
                        .foregroundColor(isNight ? Color.white : Color.black)
                    
                    Image(systemName: isNight ? "cloud.rain" : "sun.max")
                        .resizable()
                        .frame(width: 160, height: 160, alignment: .center)
                        .aspectRatio(contentMode: .fill)
                        .foregroundColor(isNight ? Color.blue : Color.yellow)
                    
                    Text("76°")
                        .font(.title)
                        .foregroundColor(isNight ? Color.white : Color.black)
                        .padding(.all, 20)
                    
                    Spacer()
                    
                    HStack(spacing: 40) {
                        ForEach(weeklyForecast) { forecast in
                            
                            NavigationLink(destination: LazyView { WeatherDetailView(isNight: isNight, forecast: forecast) }) {
                                OtherWeatherContent(isNight: $isNight, day: forecast.day, imageName: forecast.imageName, temp: forecast.temp)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    Button {
                        isNight.toggle()
                    } label: {
                        Text("Mode")
                            .font(.system(size:20))
                            .frame(width: 300, height: 50, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(15)
                    }
                    Spacer()
                }
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct OtherWeatherContent: View {
    @Binding var isNight: Bool
    var day: String
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack {
            Text("\(day)")
                .font(.system(size:20))
                .foregroundColor(isNight ? Color.white : Color.black)
            Image(systemName: imageName)
                .resizable()
                .frame(width: 30, height: 30, alignment: .center)
                .aspectRatio(contentMode: .fill)
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
