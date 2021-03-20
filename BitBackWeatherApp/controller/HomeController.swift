//
//  Controller.swift
//  BitBackWeatherApp
//
//  Created by Sachin Raturi on 2021-03-17.
//

import Foundation
import SwiftUI

class HomeController:ObservableObject {
    
    
    private let locationManager: LocationManager
    private let MAX_USER_PULL = 3
    private var userPullCount = 0;
    
    // all the variables need to trigger changes in UI
    @Published var country = "NA"
    @Published var city = "NA"
    @Published var locationAvailable = false
    @Published var isFetchingInfo = true
    @Published var isCelcious = true
    @Published var background: LinearGradient = WeatherGradients.thunder
    @Published var isClearSky = false
    @Published var weatherData = dummyWeatherData

    
    init() {
        locationManager = LocationManager()
        locationManager.startUpdates {
            // we want to fetch data as soon as location is available.
            self.fetchWeatherInfoFromNetwork()
        }
        scheduleTimerForUpdates()
        
    }
    
    
    func userPulledDown() {
        userPullCount += 1
        if userPullCount >= MAX_USER_PULL {
            fetchWeatherInfoFromNetwork()
        }
    }
    
    /**
     fetched weather information from the api and updates data async
     */
    func fetchWeatherInfoFromNetwork() {
        
        isFetchingInfo = true
        NetWorkManager.fetchTodaysWeatherFromNetwork(lat: locationManager.latitude, long: locationManager.longitude) { (decodedResult) in
            guard let res = decodedResult else {
                return
            }
            // let whoever is observing us know we have location available
            DispatchQueue.main.async {
                self.updateAppStateFromWeather(newData: res)
            }
        }
        
        
        
    }
    
    func updateAppStateFromWeather(newData:WeatherData) {
        self.city = self.locationManager.city
        self.country = self.locationManager.country
        self.updateBackground()
        self.locationAvailable = true
        self.weatherData = newData
        self.isFetchingInfo = false
        // reset user pull down count
        self.userPullCount = 0;
        
        // city or country might have changed
        self.city = self.locationManager.city
        self.country = self.locationManager.country
        self.updateBackground()
    }
    
    func scheduleTimerForUpdates() {
        Timer.scheduledTimer(withTimeInterval: 60, repeats: true){ timer in
            // we set user count to max - 1 so that next time user pull down, we update weather
            self.userPullCount = self.MAX_USER_PULL - 1;
        }
    }
    func getTodaysForcast() -> String {
        let currTemp:String
        
        if isCelcious {
            currTemp = MathFunctions.kelvinToCels(temp: weatherData.current?.temp ?? 0)
        }else {
            currTemp = MathFunctions.kelvinToFehr(temp: weatherData.current?.temp ?? 0)
        }
        let feelsLike: String
        if isCelcious {
            feelsLike = MathFunctions.kelvinToCels(temp: weatherData.current?.feelsLike ?? 0)
        }else {
            feelsLike = MathFunctions.kelvinToFehr(temp: weatherData.current?.feelsLike ?? 0)
        }
        return "Today’s temprature in \(city), \(country) will be \(currTemp) degrees \(isCelcious ? "celsius" : "fahrenheit"). you will see \(weatherData.current?.weather?[0].weatherDescription ?? "NA") and temperature will feel like \(feelsLike) degrees \(isCelcious ? "celsius" : "fahrenheit")."
    }
    
    func getTommrowForcast() -> String {
        let currTemp:String
        
        if isCelcious {
            currTemp = MathFunctions.kelvinToCels(temp: weatherData.daily?[1].temp?.max ?? 0)
        }else {
            currTemp = MathFunctions.kelvinToFehr(temp: weatherData.daily?[1].temp?.max ?? 0)
        }
        
        return "Tommorrow will be a \(weatherData.daily?[1].weather?[0].weatherDescription ?? "NA") day with a temprature of \(currTemp) degrees \(isCelcious ? "celsius" : "fahrenheit")."
    }
    
    
    func updateBackground() {
        if(isHotTemperature()){
            isClearSky = true
            background = WeatherGradients.hot
            return
        }
        
        switch weatherData.current?.weather?[0].main {
        case "Rain":
            isClearSky = false
            background =  WeatherGradients.rain
        case "Clouds":
            isClearSky = false
            background =  WeatherGradients.clouds
        case "Clear":
            isClearSky = true
            background =  WeatherGradients.clear
        case "Atmosphere":
            isClearSky = false
            background =  WeatherGradients.atmosphere
        case "Snow":
            isClearSky = false
            background =  WeatherGradients.snow
        case "Thunderstorm":
            isClearSky = false
            background =  WeatherGradients.thunder
        default:
            background =  WeatherGradients.clear
            isClearSky = true
        }
        
        
    }
    
    func isHotTemperature() -> Bool {
        let x = Double(MathFunctions.kelvinToCels(temp: (weatherData.daily?[0].temp?.day) ?? 0)) ?? 0 > 28
        return x
    }
}
