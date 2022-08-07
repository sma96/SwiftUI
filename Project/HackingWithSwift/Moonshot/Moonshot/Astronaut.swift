//
//  Astronaut.swift
//  Moonshot
//
//  Created by 마석우 on 2022/08/06.
//

import SwiftUI

struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
}


struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        var name: String
        var role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var imageName: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
