//
//  WeatherModel.swift
//  Clima
//
//  Created by 마석우 on 2022/08/20.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    
    struct Main: Codable {
        let temp: Double
        let pressure: Int
        let humidity: Int
        let tempMin: Double
        let tempMax: Double
    }
    
    struct Weather: Codable {
        let id: Int
        let description: String
    }
    
    let name: String
    let main: Main
    let weather: [Weather]
}
