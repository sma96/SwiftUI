//
//  CoinData.swift
//  ByteCoin
//
//  Created by 마석우 on 2022/08/21.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Codable {
//    let time: Date
    let assetIdBase: String
    let assetIdQuote: String
    let rate: Double
}
