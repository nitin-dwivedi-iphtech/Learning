//
//  WeatherDetailView.swift
//  WeatherApp
//
//  Created by iPHTech6 on 06/07/26.
//


import SwiftUI

class ScoreBoard : ObservableObject{
    @Published private(set) var score : Int = 45
    
    func updatScore(score: Int){
        self.score = score
    }
}

// Parent View

struct WeatherDetailView : View{
    var isNight: Bool
    let forecast: WeatherDay
    @StateObject var scoreBoard = ScoreBoard()
    
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

                Text("\(scoreBoard.score)°")
                    .font(.system(size: 70, weight: .bold))
              
               
                Text(forecast.description)
                    .font(.title2)
                    .italic()
                
                ButtonView(scoreBoard: scoreBoard)
               
            }
            .foregroundColor(.white)
        }
        .navigationBarHidden(false)
    }
}

// child View

struct ButtonView : View{
    
    var scoreBoard : ScoreBoard
    
    var body : some View{
        VStack{
            
            Text("\(scoreBoard.score)°")
                .font(.system(size: 30, weight: .bold))
          
            Button{
                scoreBoard.updatScore(score: 80)
            }label:{
                Text("Update")
                    .frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.orange)
                    .cornerRadius(15)
            }
        }
    }
}

struct Preview: PreviewProvider {
    static var previews: some View {
        WeatherDetailView(
            isNight: false, forecast: WeatherDay(day: "Mon", imageName: "cloud.sun.fill", temp: 72, description: "Scattered Clouds")
        )
    }
}
