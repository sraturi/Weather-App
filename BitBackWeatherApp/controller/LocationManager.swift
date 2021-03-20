//
//  LocationManager.swift
//  BitBackWeatherApp
//
//  Created by Sachin Raturi on 2021-03-17.
//

import Foundation
import CoreLocation
import SwiftUI

class LocationManager: NSObject, CLLocationManagerDelegate  {
    let manager = CLLocationManager()
    var latitude:Double = 0;
    var longitude: Double = 0;
    var country = "NA"
    var city = "NA"
    
    var locatonAvailable = false
    var firstTime = true
    /// we dont want to trigger a race condition between updating the UI vs getting location. So whenever we first have location, we can call whatever function needs to be called.
    var firsTimeAction: ()->() = {
        //dummy
    }
    
    override init() {
        super.init()
    }
    
    func startUpdates(firstTimeAction: @escaping ()->()) {
        self.firsTimeAction = firstTimeAction
        self.manager.delegate = self
        self.manager.requestWhenInUseAuthorization()
        self.manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last?.coordinate else {
            locatonAvailable = false
            return }
        
        self.latitude = location.latitude
        self.longitude = location.longitude
        // fetch location as soon as it is available.
        if firstTime {
            firsTimeAction()
            firstTime = false
        }
        locatonAvailable = true
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(locations.last!) { (placemark, error) in
            if error == nil {
                let loc = placemark?[0]
                if loc?.country != nil {
                    self.country = loc!.country!
                } else {
                    self.country = "NA"
                }
                if loc?.locality != nil {
                    self.city = loc!.locality!
                } else {
                    self.city = "NA"
                }
            }
        }
    }
    
    
}
