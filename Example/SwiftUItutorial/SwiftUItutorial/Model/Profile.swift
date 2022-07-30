//
//  Profile.swift
//  SwiftUItutorial
//
//  Created by 마석우 on 2022/06/26.
//

import SwiftUI
import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()

    static let `default` = Profile(username: "g_kumar")

    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"

        var id: String { rawValue }
    }
    init(username: String)
    {
        self.username = username
    }
    
    init(_ profile: Profile)
    {
        self.username = profile.username
        self.prefersNotifications = profile.prefersNotifications
        self.seasonalPhoto = profile.seasonalPhoto
        self.goalDate = profile.goalDate
    }
}
