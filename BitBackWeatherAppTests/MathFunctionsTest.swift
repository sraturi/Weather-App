//
//  MathFunctionsTest.swift
//  BitBackWeatherAppTests
//
//  Created by Sachin Raturi on 2021-03-18.
//

import XCTest
@testable import BitBackWeatherApp

class MathFunctionsTest: XCTestCase {

    var sut: MathFunctions!
    
    override class func setUp() {
        super.setUp()
        
    }

    func testKelvinToCelsious() throws {
        let cel = 23.0
        let actual =  MathFunctions.kelvinToCels(temp: cel)
        let expected = "-250.15"
        XCTAssertEqual(actual, expected)
    }
    func testKelvinToFehr() throws {
        let cel:Double = 23
        let actual =  MathFunctions.kelvinToFehr(temp: cel)
        let expected = "-418"
        XCTAssertEqual(actual, expected)
    }
    
    func testRoundup() throws {
        let actual = 2.6789
        let expected = 2.6800
        XCTAssertEqual(actual.roundedTo(toPlaces: 2), expected)
    }
    
    func testTrailingZeros() throws {
        let actual = 2.6000
        let expected = "2.6"
        XCTAssertEqual(actual.removeTrailingZero(), expected)
    }
    func testPerformanceJsonParser() throws {
        self.measure {
            // Put the code you want to measure the time of here.
            try? JSONDecoder().decode(Weather.self, from: data)
        }
    }
    
    let data = Data("{lat:49,lon:-122,timezone:America/Los_Angeles,timezone_offset:-25200,current:{dt:1616057946,sunrise:1616076856,sunset:1616120257,temp:277.8,feels_like:274.3,pressure:1011,humidity:77,dew_point:274.12,uvi:0,clouds:2,visibility:10000,wind_speed:2.37,wind_deg:107,wind_gust:2.31,weather:[{id:800,main:Clear,description:clear sky,icon:01n}]},daily:[{dt:1616097600,sunrise:1616076856,sunset:1616120257,temp:{day:280.23,min:275.17,max:281.33,night:275.53,eve:277.6,morn:275.24},feels_like:{day:277.69,night:272.37,eve:274.71,morn:270.84},pressure:1010,humidity:76,dew_point:277.27,wind_speed:1.52,wind_deg:263,weather:[{id:501,main:Rain,description:moderate rain,icon:10d}],clouds:100,pop:1,rain:14.66,uvi:1.37},{dt:1616184000,sunrise:1616163128,sunset:1616206748,temp:{day:277.83,min:272.93,max:278.53,night:274.23,eve:275.14,morn:273.53},feels_like:{day:275.09,night:271.58,eve:272.46,morn:269.84},pressure:1012,humidity:77,dew_point:275.07,wind_speed:1.29,wind_deg:205,weather:[{id:616,main:Snow,description:rain and snow,icon:13d}],clouds:100,pop:1,rain:6.9,snow:2,uvi:2.13},{dt:1616270400,sunrise:1616249401,sunset:1616293238,temp:{day:275.24,min:271.87,max:276.73,night:273.75,eve:273.58,morn:272.82},feels_like:{day:272.22,night:270.31,eve:270.39,morn:270.42},pressure:1018,humidity:93,dew_point:275.17,wind_speed:1.71,wind_deg:253,weather:[{id:616,main:Snow,description:rain and snow,icon:13d}],clouds:100,pop:0.96,rain:3.27,snow:2.32,uvi:1.86},{dt:1616356800,sunrise:1616335673,sunset:1616379729,temp:{day:275.5,min:271.53,max:275.78,night:272.83,eve:273.11,morn:272.19},feels_like:{day:271.77,night:268.86,eve:269.72,morn:268.25},pressure:1021,humidity:87,dew_point:274.46,wind_speed:2.58,wind_deg:212,weather:[{id:616,main:Snow,description:rain and snow,icon:13d}],clouds:100,pop:1,rain:0.69,snow:11.87,uvi:2},{dt:1616443200,sunrise:1616421945,sunset:1616466219,temp:{day:275.4,min:271.13,max:275.61,night:271.13,eve:271.5,morn:271.48},feels_like:{day:271.44,night:267.43,eve:267.65,morn:267.54},pressure:1015,humidity:89,dew_point:274.6,wind_speed:2.96,wind_deg:241,weather:[{id:601,main:Snow,description:snow,icon:13d}],clouds:100,pop:1,snow:15.76,uvi:2},{dt:1616529600,sunrise:1616508217,sunset:1616552709,temp:{day:273.35,min:270.37,max:274.94,night:270.37,eve:271.25,morn:271.98},feels_like:{day:270.77,night:266.56,eve:268.18,morn:269.23},pressure:1023,humidity:99,dew_point:274.07,wind_speed:0.86,wind_deg:270,weather:[{id:601,main:Snow,description:snow,icon:13d}],clouds:100,pop:1,snow:6.89,uvi:2},{dt:1616616000,sunrise:1616594489,sunset:1616639199,temp:{day:274.65,min:270.5,max:274.65,night:272.93,eve:273.69,morn:272.36},feels_like:{day:270.96,night:270.23,eve:269.9,morn:269.17},pressure:1007,humidity:97,dew_point:275.09,wind_speed:2.67,wind_deg:175,weather:[{id:616,main:Snow,description:rain and snow,icon:13d}],clouds:100,pop:1,rain:11.2,snow:4.88,uvi:2},{dt:1616702400,sunrise:1616680761,sunset:1616725689,temp:{day:276.72,min:271.73,max:276.72,night:272.74,eve:273.59,morn:272.68},feels_like:{day:274.13,night:270.04,eve:271.07,morn:270.06},pressure:1012,humidity:86,dew_point:275.43,wind_speed:1.18,wind_deg:296,weather:[{id:616,main:Snow,description:rain and snow,icon:13d}],clouds:88,pop:0.8,rain:1.19,snow:1.94,uvi:2}]}".utf8)

}
