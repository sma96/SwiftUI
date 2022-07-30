//
//  ModelData.swift
//  SwiftUItutorial
//
//  Created by 마석우 on 2022/06/22.
//

import Foundation
import Combine
import SwiftUI

final class ModelData: ObservableObject {
    @Published var landMarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    @Published var profile = Profile.default
    
    var features: [Landmark] {
           landMarks.filter { $0.isFeatured }
       }
    
    var categories: [String: [Landmark]] {
         Dictionary(
             grouping: landMarks,
             by: { $0.category.rawValue }
         )
     }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
