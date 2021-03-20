//
//  MathFunctions.swift
//  BitBackWeatherApp
//
//  Created by Sachin Raturi on 2021-03-17.
//

import Foundation

struct MathFunctions {
    
    static func kelvinToCels(temp: Double) -> String {
        
        return Double(temp - 273.15).roundedTo(toPlaces: 2).removeTrailingZero()
    }
    static func kelvinToFehr(temp : Double) -> String {
        
        return (1.8*(temp - 273) + 32).roundedTo(toPlaces: 2).removeTrailingZero()
    }
}

extension Double {
    /// Rounds the double to decimal places value
    func roundedTo(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    ///stackoverflow
    func removeTrailingZero() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 16
        return String(formatter.string(from: number) ?? "")
    }
}
