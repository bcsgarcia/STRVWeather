//
//  STRV_WeatherTests.swift
//  STRV WeatherTests
//
//  Created by Bruno Garcia on 05/03/19.
//  Copyright © 2019 Bruno Garcia. All rights reserved.
//

import XCTest
@testable import STRV_Weather

class STRV_WeatherTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWeatherScreen(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        XCTAssertNotNil(storyboard)
        guard let vc = storyboard.instantiateViewController(withIdentifier: String(describing: WeatherViewController.self)) as? WeatherViewController else {
            XCTAssert(false)
            return
        }
        XCTAssertNotNil(vc)
        let _ = vc.view
        XCTAssertNotEqual(vc.lblWeatherDescription.text!, "-- | --", "Weather is not loading on screen")
        print(vc.lblWeatherDescription.text!)
    }
    
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
