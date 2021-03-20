//
//  MyGradients.swift
//  BitBackWeatherApp
//
//  Created by Sachin Raturi on 2021-03-16.
//

import Foundation
import SwiftUI

struct WeatherGradients {
    static let clouds = LinearGradient(gradient: Gradient(colors: [Color( red: 0.53, green: 0.65, blue: 0.74, opacity: 1), Color( red: 0.64, green: 0.72, blue: 0.79, opacity: 1), Color( red: 0.67, green: 0.74, blue: 0.78, opacity: 1)]), startPoint: .top, endPoint: .bottom)
    
    
    
    static let clear = LinearGradient(gradient: Gradient(colors: [Color( red: 0.39, green: 0.64, blue: 0.84, opacity: 1), Color( red: 0.45, green: 0.68, blue: 0.85, opacity: 1), Color( red: 0.6, green: 0.82, blue: 0.97, opacity: 1)]), startPoint: .top, endPoint: .bottom)
    
    static let snow = LinearGradient(gradient: Gradient(colors: [Color( red: 0.81, green: 0.88, blue: 0.94, opacity: 1), Color( red: 0.67, green: 0.7, blue: 0.73, opacity: 1), Color(red: 0.49, green: 0.51, blue: 0.57, opacity: 1)]), startPoint: .top, endPoint: .bottom)
    
    static let rain = LinearGradient(gradient: Gradient(colors: [Color( red: 0.12, green: 0.15, blue: 0.18, opacity: 1), Color( red: 0.2, green: 0.37, blue: 0.52, opacity: 1), Color( red: 0.5, green: 0.63, blue: 0.75, opacity: 1)]), startPoint: .top, endPoint: .bottom)
    
    static let thunder = LinearGradient(gradient: Gradient(colors: [Color( red: 0.27, green: 0.4, blue: 0.62, opacity: 1), Color( red: 0.54, green: 0.51, blue: 0.64, opacity: 1), Color( red: 0.79, green: 0.68, blue: 0.66, opacity: 1)]), startPoint: .top, endPoint: .bottom)
    
    static let atmosphere = LinearGradient(gradient: Gradient(colors: [Color( red: 0.68, green: 0.58, blue: 0.51, opacity: 1), Color( red: 0.47, green: 0.38, blue: 0.36, opacity: 1), Color( red: 0.2, green: 0.2, blue: 0.22, opacity: 1)]), startPoint: .top, endPoint: .bottom)
    
    static let hot = LinearGradient(gradient: Gradient(colors: [Color( red: 0.49, green: 0.05, blue: 0.39, opacity: 1), Color( red: 0.49, green: 0.13, blue: 0.37, opacity: 1), Color( red: 0.73, green: 0.19, blue: 0.3, opacity: 1), Color( red: 0.95, green: 0.3, blue: 0.19, opacity: 1)]), startPoint: .bottom, endPoint: .top)
}
