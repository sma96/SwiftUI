//
//  WeatherManager.swift
//  Clima
//
//  Created by 마석우 on 2022/08/18.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weatherManager: WeatherManager, weather: WeatherModel) -> Void
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?&appid=92bbad8d69439cf2edac8ab39292756f&units=metric"

    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) -> String {
        let urlString = "\(weatherURL)&q=\(cityName)"

        performRequest(urlString: urlString)
        
        return urlString
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) -> String {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=92bbad8d69439cf2edac8ab39292756f&units=metric"
        
        performRequest(urlString: urlString)
        
        return urlString
    }

    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {
                print("completionHandler")
                if $2 != nil{
                    self.delegate?.didFailWithError(error: $2!)
                    return
                }
                if let safeData = $0 {
                    if let weather = decodeWeatherData(data: safeData) {
                        self.delegate?.didUpdateWeather(weatherManager: self, weather: weather )
                    }
                }
            }
            task.resume()
        }
        
    }

    

    func decodeWeatherData(data: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let data = try? decoder.decode(WeatherData.self, from: data) else {
            print("decode error")
            return nil
        }
        
        let id = data.weather[0].id
        let name = data.name
        let temp = data.main.temp
        
        let weather = WeatherModel(conditionId: id, cityName: name, temparature: temp)
        
        return weather
    }
    
}
