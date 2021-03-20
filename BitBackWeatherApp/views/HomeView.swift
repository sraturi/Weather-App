//
//  ContentView.swift
//  BitBackWeatherApp
//
//  Created by Sachin Raturi on 2021-03-16.
//

import SwiftUI

struct HomeView: View {
   
    @GestureState private var dragTranslation: CGFloat = 0
    
    @ObservedObject var controller = HomeController()

    // this is the main body
    var body: some View {
        GeometryReader { geo in
            
            ZStack {
                if !controller.isClearSky {
                    Image("background").resizable().opacity(controller.isFetchingInfo ? 0 : 0.2).edgesIgnoringSafeArea(.leading)
                }
                VStack {
                    getTodaysWeather(size: geo.size)
                    Spacer()
                    Spacer()
                    getTommrowsWeather(size: geo.size)
                    Spacer()
                    Spacer()
                    if(controller.locationAvailable){
                        MultipleDayView(daily: $controller.weatherData.daily, isCelsious: $controller.isCelcious).frame(width: geo.size.width, height: geo.size.height/5, alignment: .center)
                    }
                    Spacer()
                }
                .blur(radius: controller.isFetchingInfo ? 30 : 0)
                
                if controller.isFetchingInfo {
                    ProgressView("Fetching weather information").multilineTextAlignment(.center)
                        .progressViewStyle(CircularProgressViewStyle()).frame(width: geo.size.width/2 , height: geo.size.width/2, alignment: .center)
                }
            }
            .foregroundColor(.white)
            .frame(width: geo.size.width, height: geo.size.height, alignment: .top)
            
            .offset(y: max(self.dragTranslation, 0))
            .animation(.interactiveSpring())
            .gesture(
                DragGesture().updating(self.$dragTranslation) { value, state, _ in
                    state = value.translation.height
                }
                .onEnded { value in
                    if(value.translation.height > 250){
                        controller.userPulledDown()
                    }
                }
            ).background(controller.background.ignoresSafeArea())
        }
    }
    
    func getTodaysWeather(size: CGSize) -> some View {
        Group {
            Spacer()
            Text("\(controller.city), \(controller.country) ").font(.custom("", size: size.width/16)).tracking(3)
            Spacer()
            Text("Today").font(.custom("", size: size.width/20)).fontWeight(.semibold)
            Spacer()
            HStack(alignment: .center) {
                Spacer()
                Text("\(controller.isCelcious ? MathFunctions.kelvinToCels(temp: controller.weatherData.current?.temp ?? 0) :MathFunctions.kelvinToFehr(temp: controller.weatherData.current?.temp ?? 0) ) ").font(.custom("", size: size.width/10))
                    + Text("°\(controller.isCelcious ? "C" : "F")").font(.custom("", size: size.width/20)).baselineOffset(size.width/(size.width/10)).tracking(2)
                Spacer()
            }
            
            Spacer()
            Toggle(isOn: $controller.isCelcious, label: {
            }).onTapGesture {
                controller.isCelcious.toggle()
            }
            .toggleStyle(CustomToggleStyle(selectedGradient: $controller.background))
            .labelsHidden()
            .frame(width: size.width/2.5, height: size.height/12)
            Spacer()
            Text(controller.getTodaysForcast()).font(.body).multilineTextAlignment(.center).padding(.horizontal)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
    
    func getTommrowsWeather(size: CGSize) -> some View {
        
        Group {
            Text("Tomrrow").font(.custom("", size: size.width/20)).fontWeight(.semibold)
            Spacer()
            HStack {
                Text("\(controller.isCelcious ? MathFunctions.kelvinToCels(temp: controller.weatherData.daily?[1].temp?.max ?? 0) :MathFunctions.kelvinToFehr(temp: controller.weatherData.daily?[1].temp?.max ?? 0)) ").font(.custom("", size: size.width/10))
                    + Text("°\(controller.isCelcious ? "C" : "F")").font(.custom("", size: size.width/20)).baselineOffset(size.width/(size.width/10)).tracking(2)
            }
            Spacer()
            Text(controller.getTommrowForcast()).font(.body).multilineTextAlignment(.center).fixedSize(horizontal: false, vertical: true).padding(.horizontal)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView( )
    }
}
