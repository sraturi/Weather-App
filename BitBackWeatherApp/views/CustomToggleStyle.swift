//
//  CustomToggleStyle.swift
//  BitBackWeatherApp
//
//  Created by Sachin Raturi on 2021-03-17.
//

import Foundation
import SwiftUI

struct CustomToggleStyle: ToggleStyle {
    
    @Binding var selectedGradient:LinearGradient
    
    func makeBody(configuration: Configuration) -> some View {
        GeometryReader { geo in
            
            
            ZStack{
                RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.3))
                RoundedRectangle(cornerRadius: 10).fill(selectedGradient).opacity(1).blur(radius: 30, opaque: true)
                    .padding(5).frame(width: geo.size.width/2).offset(x: configuration.isOn ? geo.size.width/(-4) : geo.size.width/(4), y: 0)
                HStack{
                    Text("°C").font(.custom("", size: geo.size.width/7)).padding()
                    Spacer()
                    Text("°F").font(.custom("", size: geo.size.width/7)).padding()
                }.padding(5)
                .frame(width: geo.size.width, height: geo.size.height, alignment: .leading)
            }
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        HomeView( )
    }
}
