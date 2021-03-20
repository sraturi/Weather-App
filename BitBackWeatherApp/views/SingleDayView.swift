//
//  SingleDayView.swift
//  BitBackWeatherApp
//
//  Created by Sachin Raturi on 2021-03-19.
//

import SwiftUI


struct SingleDayView: View {
    
    
    @ObservedObject var controller:SingleDayController
    
    init(daily: Daily, isCelsious: Binding<Bool>) {
        controller = SingleDayController(daily: daily, isCelsious: isCelsious)
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack{
                Spacer()
                Text("\(controller.dateString)")
                Spacer()
                Text("\(controller.getTodayMax())")
                
                Image(uiImage: $controller.weatherIcon.wrappedValue ?? UIImage()).resizable().frame(width: 25, height: 25, alignment: .center)
                
                Text(controller.daily.weather?[0].main ?? "").multilineTextAlignment(.center)
                Spacer()
            }.frame(width: geo.size.width, height: geo.size.height, alignment: .top)
            .onTapGesture {
                controller.speakWeather()
            }
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.3)))
        }
    }
}

struct SingleDayView_Previews: PreviewProvider {
    static var previews: some View {
        SingleDayView(daily: Daily(dt: 0, sunrise: 0, sunset: 0, temp: Temp(day: 0, min: 0, max: 0, night: 0, eve: 0, morn: 0), feelsLike: FeelsLike(day: 0, night: 0, eve: 0, morn: 0), pressure: 0, humidity: 0, dewPoint: 0, windSpeed: 0, windDeg: 0, weather: [Weather(id: 0, main: "", weatherDescription: "", icon: "")], clouds: 0, pop: 0, uvi: 0, rain: 0), isCelsious: .constant(true))
    }
}
