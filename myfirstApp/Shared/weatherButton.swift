//
//  weatherButton.swift
//  myfirstApp
//
//  Created by eesaack on 2022-02-19.
//

import SwiftUI
struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .foregroundColor(textColor)
            .cornerRadius(10)
    }
}
