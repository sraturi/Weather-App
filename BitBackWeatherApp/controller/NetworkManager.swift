//
//  NetworkManager.swift
//  BitBackWeatherApp
//
//  Created by Sachin Raturi on 2021-03-17.
//

import Foundation
import SwiftUI

struct NetWorkManager {
    
    static let API_KEY = "f63157eb4dabb812ff57f3cc2fd98172"
    
    static func getImage(icon:String, completion: (@escaping (String, UIImage?) -> Void)) {
        let data = MyFileManager.readImage(name: icon)
        if data != nil {
            completion(icon,UIImage(data: data!))
        } else {
            
            downloadImage(iconName: icon) { (url, image) in
                completion(icon,image)
            }
        }
    }
    
    private static func downloadImage(iconName: String,completion: (@escaping (String, UIImage?) -> Void)) {
        print("downloading the image")
        let url = URL(string: "https://openweathermap.org/img/wn/\(iconName)@2x.png")!
        let task = URLSession.shared.dataTask(with: url){
            (data, response,error) in
            
            guard let data = data else {
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data){
                    MyFileManager.saveImage(imageName: iconName, image: image)
                    completion(iconName,image)
                }
            }
        }
        task.resume()
    }
    
    static func fetchTodaysWeatherFromNetwork(lat:Double,long:Double,completion: @escaping (WeatherData?) ->Void) {
        let urlString = "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(long)&exclude=hourly,minutely&appid=\(API_KEY)"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url);
        URLSession.shared.dataTask(with: request){ data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(WeatherData.self, from: data) {
                    DispatchQueue.main.async {
                        completion(decodedResponse)
                    }
                    return
                } else {
                    completion(nil)
                    print("There was an error! with decode \(data)")
                }
                
                
            }
        }.resume()
        
    }
}

