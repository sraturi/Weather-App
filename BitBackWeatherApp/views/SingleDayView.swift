//
//  SingleDayView.swift
//  BitBackWeatherApp
//
//  Created by Sachin Raturi on 2021-03-19.
//

import SwiftUI


struct SingleDayView: View {
   var daily: Daily
   
   @State var hasWeatherIcon: Bool = false
   @State private var weatherIcon: UIImage?
   @Binding var isCelsious: Bool
   
   
   let dayTimePeriodFormatter = DateFormatter()
   let dateString: String
   
   init(daily: Daily, isCelsious: Binding<Bool>) {
       self._isCelsious = isCelsious
       self.daily = daily
       dayTimePeriodFormatter.dateFormat = "EEE"
       let nsDate = NSDate(timeIntervalSince1970: Double(daily.sunrise!))
       dateString = dayTimePeriodFormatter.string(from: nsDate as Date)
   }
    
    
   func getWeatherIcon() {
       NetWorkManager.getImage(icon: daily.weather![0].icon!) { (iconStr,result)  in
           if(iconStr == daily.weather![0].icon){
           weatherIcon = result
           hasWeatherIcon = true
           }
       }
   }
   
   var body: some View {
       GeometryReader { geo in
           VStack{
               Spacer()
               Text("\(dateString)")
               Spacer()
               Text("\(isCelsious ? MathFunctions.kelvinToCels(temp: daily.temp?.max ?? 0) : MathFunctions.kelvinToFehr(temp: daily.feelsLike?.day ?? 0))").onAppear(perform: {
                   getWeatherIcon()
               })
               if hasWeatherIcon {
                   Image(uiImage: weatherIcon!).resizable().frame(width: 25, height: 25, alignment: .center)
               }
               Text(daily.weather?[0].main ?? "").multilineTextAlignment(.center)
               Spacer()
           }.frame(width: geo.size.width, height: geo.size.height, alignment: .top)
           .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.3)))
       }
   }
}

struct SingleDayView_Previews: PreviewProvider {
    static var previews: some View {
        SingleDayView(daily: Daily(dt: 0, sunrise: 0, sunset: 0, temp: Temp(day: 0, min: 0, max: 0, night: 0, eve: 0, morn: 0), feelsLike: FeelsLike(day: 0, night: 0, eve: 0, morn: 0), pressure: 0, humidity: 0, dewPoint: 0, windSpeed: 0, windDeg: 0, weather: [Weather(id: 0, main: "", weatherDescription: "", icon: "")], clouds: 0, pop: 0, uvi: 0, rain: 0), isCelsious: .constant(true))
    }
}
