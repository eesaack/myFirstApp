//
//  ContentView.swift
//  Shared
//
//  Created by eesaack on 2022-02-15.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityNameView(cityName: "Almaty")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: 1)
                
                HStack(spacing: 30) {
                WeatherDayView(dayOfWeek: "MON",
                               imageName: "cloud.sun.fill",
                               temperature: 1)
                WeatherDayView(dayOfWeek: "TUE",
                               imageName: "cloud.drizzle.fill",
                               temperature: -2)
                WeatherDayView(dayOfWeek: "WED",
                               imageName: "cloud.snow.fill",
                               temperature: -2)
                WeatherDayView(dayOfWeek: "THU",
                               imageName: "cloud.sleet.fill",
                               temperature: -5)
                WeatherDayView(dayOfWeek: "FRI",
                               imageName: "cloud.sleet.fill",
                               temperature: -6)
                }
                
                Spacer()
                
                Button{
                    isNight .toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
            
            
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lighBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityNameView: View {
    
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 5) {
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)

            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
            
            Text("Mostly Sunny")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
                .padding()
        }
        .padding(.bottom, 40)
        
    }
}

