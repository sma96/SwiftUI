//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation


protocol CoinManagerDelegate {
    func didFailWithError(coinManager: CoinManager, error: Error)
    func didUpdateCoinPrice(coinManager: CoinManager, coinData: CoinData)
}
struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate"
    let apiKey = "21E83ADA-2099-44EF-B6D1-7B235D16D556"
    
    let currencyArray = [ ["BTC", "ETH", "XRP", "EOS", "DOT"],
                        ["AUD","BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]]

    func getCoinPrice(for currency: String, symbol: String) {
        let urlString = "\(baseURL)/\(symbol)/\(currency)?apikey=\(apiKey)"
        print(urlString)
        fetchCoinPrice(url: urlString)
    }
    
    func fetchCoinPrice(url: String) {
        if let url = URL(string: url)  {// url 생성 -> url 세션 생성 -> task 생성 순이다.
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("task error")
                    self.delegate?.didFailWithError(coinManager: self, error: error!)
                    return
                }
                
                if let safeData = data {
                    if let coinData = parseJson(data: safeData) {
                        self.delegate?.didUpdateCoinPrice(coinManager: self, coinData: coinData)
                    }
                }
            }
            task.resume()
        } else {
            print("url error")
        }
    }
    
    func parseJson(data: Data) -> CoinData? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let decode = try? decoder.decode(CoinData.self, from: data) else {
            print("decode error")
            return nil
        }
        
        return decode
    }
}
