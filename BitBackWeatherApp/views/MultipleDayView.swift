//
//  DayView.swift
//  BitBackWeatherApp
//
//  Created by Sachin Raturi on 2021-03-17.
//

import SwiftUI

struct MultipleDayView: View {
    
    @Binding var daily:[Daily]?
    @Binding var isCelsious: Bool
    
    var body: some View {
        GeometryReader { geo in
            HStack(alignment: .center){
                // we start at 2 since we already displaying the first two days of the data
                ForEach((2..<daily!.count - 1), id: \.self) { index in
                    Spacer()
                    SingleDayView(daily: daily![index], isCelsious: $isCelsious)
                }
                Spacer()
            }.frame(width: geo.size.width, height: geo.size.height, alignment: .top).onAppear(perform: {
                print("multiple day onappear")
            })
        }
    }
}
struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        MultipleDayView(daily: .constant([Daily(dt: 0, sunrise: 0, sunset: 0, temp: Temp(day: 0, min: 0, max: 0, night: 0, eve: 0, morn: 0), feelsLike: FeelsLike(day: 0, night: 0, eve: 0, morn: 0), pressure: 0, humidity: 0, dewPoint: 0, windSpeed: 0, windDeg: 0, weather: [Weather(id: 0, main: "", weatherDescription: "", icon: "")], clouds: 0, pop: 0, uvi: 0, rain: 0)]), isCelsious: .constant(true))
    }
}

extension Binding where Value: MutableCollection, Value.Index == Int {
    func element(_ idx: Int) -> Binding<Value.Element> {
        return Binding<Value.Element>(
            get: {
                return self.wrappedValue[idx]
            }, set: { (value: Value.Element) -> () in
                self.wrappedValue[idx] = value
            })
    }
}
