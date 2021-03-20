//
//  SingleDayController.swift
//  BitBackWeatherApp
//
//  Created by Sachin Raturi on 2021-03-19.
//

import Foundation
import SwiftUI

class SingleDayController: ObservableObject {
    
    var daily: Daily
    let audioManager = AudioController.getInstance()
    
    //@Published var hasWeatherIcon: Bool = false
    @Published var weatherIcon: UIImage?
    @Binding var isCelsious: Bool
    
    
    let dayTimePeriodFormatter = DateFormatter()
    let dateString: String
    
    init(daily: Daily, isCelsious: Binding<Bool>) {
        // print("init is called!")
        self._isCelsious = isCelsious
        self.daily = daily
        dayTimePeriodFormatter.dateFormat = "EEE"
        let nsDate = NSDate(timeIntervalSince1970: Double(daily.sunrise!))
        dateString = dayTimePeriodFormatter.string(from: nsDate as Date)
        getWeatherIcon()
    }
    
    func getWeatherIcon() {
        NetWorkManager.getImage(icon: daily.weather![0].icon!) { (iconStr,result)  in
            DispatchQueue.main.async {
                if(iconStr == self.daily.weather![0].icon){
                    self.weatherIcon = result
                }
            }
        }
    }
    
    func getTodayMax() -> String {
        if isCelsious {
            return MathFunctions.kelvinToCels(temp: daily.temp?.max ?? 0)
        } else {
            return MathFunctions.kelvinToFehr(temp: daily.temp?.max ?? 0)
        }
    }
    func speakWeather()  {
        let temp = getTodayMax()
        dayTimePeriodFormatter.dateFormat = "EEEE"
        let nsDate = NSDate(timeIntervalSince1970: Double(daily.sunrise!))
        let fullDay = dayTimePeriodFormatter.string(from: nsDate as Date)
        
        let text = "\(fullDay) will be a \(daily.weather?[0].weatherDescription ?? "NA") day with a temprature of \(temp) degrees \(isCelsious ? "celsius" : "fahrenheit")."
        audioManager.speakText(text: text)
    }
}
