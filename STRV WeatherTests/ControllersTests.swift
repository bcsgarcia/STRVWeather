//
//  WeatherControllerTests.swift
//  STRV WeatherTests
//
//  Created by Bruno Garcia on 08/03/19.
//  Copyright © 2019 Bruno Garcia. All rights reserved.
//

import XCTest
@testable import STRV_Weather

class ControllersTests: XCTestCase {

    let weatherController = WeatherController()
    let forecastController = ForecastController()
    
    let lat = -23.957597985949963
    let lon = -46.39717697209102
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWeatherCallRequestWithZeroLatLon() {
        UserDefaultsManager.setLon(to: 0)
        UserDefaultsManager.setLat(to: 0)
        
        var err = ""
        let expectation = self.expectation(description: "Calling")
        weatherController.callUrlRequest(onComplete: { (weatherResponse) in
        }) { (weatherError) in
            err = "\(weatherError)"
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
        XCTAssertEqual(err, "noData" , "Is expected that have no data to call API")
    }
    
    func testRestCallWeather(){
        let expectation = self.expectation(description: "Calling")
        Rest.sharedInstance.call(urlEnum: .Weather, lat: lat, lon: lon, onComplete: { (data) in
            XCTAssertNotNil(data)
            expectation.fulfill()
        }) { (weatherErr) in
            XCTAssertNil(weatherErr)
        }
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func testRestCallForecast(){
        let expectation = self.expectation(description: "Calling")
        Rest.sharedInstance.call(urlEnum: .Forecast, lat: lat, lon: lon, onComplete: { (data) in
            XCTAssertNotNil(data)
            expectation.fulfill()
        }) { (weatherErr) in
            XCTAssertNil(weatherErr)
        }
        waitForExpectations(timeout: 3, handler: nil)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
