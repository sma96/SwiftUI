//
//  Model.swift
//  Todoey
//
//  Created by 마석우 on 2022/09/02.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct CellData: Codable {
    var name: String
    var isChecked: Bool = false
}
