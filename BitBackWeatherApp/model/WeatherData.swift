// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let result = try? newJSONDecoder().decode(Result.self, from: jsonData)

import Foundation

// MARK: - Result
struct WeatherData: Codable {
    let lat, lon: Double?
    let timezone: String?
    let timezoneOffset: Int?
    let current: Current?
    var daily: [Daily]?
    
    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone
        case timezoneOffset = "timezone_offset"
        case current, daily
    }
}

// MARK: - Current
struct Current: Codable {
    let dt, sunrise, sunset: Int?
    let temp, feelsLike: Double?
    let pressure, humidity: Int?
    let dewPoint, uvi: Double?
    let clouds, visibility: Int?
    let windSpeed: Double?
    let windDeg: Int?
    let weather: [Weather]?
    
    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case uvi, clouds, visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather
    }
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int?
    let main, weatherDescription, icon: String?
    
    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Daily
struct Daily: Codable {
    let dt, sunrise, sunset: Int?
    let temp: Temp?
    let feelsLike: FeelsLike?
    let pressure, humidity: Int?
    let dewPoint, windSpeed: Double?
    let windDeg: Int?
    let weather: [Weather]?
    let clouds: Int?
    let pop, uvi, rain: Double?
    
    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather, clouds, pop, uvi, rain
    }
}

// MARK: - FeelsLike
struct FeelsLike: Codable {
    let day, night, eve, morn: Double?
}

// MARK: - Temp
struct Temp: Codable {
    let day, min, max, night: Double?
    let eve, morn: Double?
}


let dummyWeatherData = WeatherData(lat: 0, lon: 0, timezone: "", timezoneOffset: 0, current: Current(dt: 0, sunrise: 0, sunset: 0, temp: 0, feelsLike: 0, pressure: 0, humidity: 0, dewPoint: 0, uvi: 0, clouds: 0, visibility: 0, windSpeed: 0, windDeg: 0, weather: [Weather(id: 0, main: "Clouds", weatherDescription: "cloudy", icon: "")]), daily: [Daily(dt: 0, sunrise: 0, sunset: 0, temp: Temp(day: 0, min: 0, max: 0, night: 0, eve: 0, morn: 0), feelsLike: FeelsLike(day: 0, night: 0, eve: 0, morn: 0), pressure: 0, humidity: 0, dewPoint: 0, windSpeed: 0, windDeg: 0, weather: [Weather(id: 0, main: "", weatherDescription: "", icon: "")], clouds: 0, pop: 0, uvi: 0, rain: 0),Daily(dt: 0, sunrise: 0, sunset: 0, temp: Temp(day: 0, min: 0, max: 0, night: 0, eve: 0, morn: 0), feelsLike: FeelsLike(day: 0, night: 0, eve: 0, morn: 0), pressure: 0, humidity: 0, dewPoint: 0, windSpeed: 0, windDeg: 0, weather: [Weather(id: 0, main: "", weatherDescription: "", icon: "")], clouds: 0, pop: 0, uvi: 0, rain: 0)])
