//
//  TokenData.swift
//  Day04
//
//  Created by 마석우 on 2022/08/22.
//

import Foundation

struct Token: Codable {
    let accessToken: String
    let tokenType: String
    let expiresIn: Int
    let scope: String
    let createdAt: Int
}

struct Project: Codable {
    let id, occurrence, finalMark: Int?
    let status: String
    let project: ProjectClass
    let user: ProjectUser
}

// MARK: - ProjectClass
struct ProjectClass: Codable {
    let id: Int
    let name, slug: String
//    let parentID: JSONNull?

}

// MARK: - ProjectUser
struct ProjectUser: Codable {
    let id: Int
    let login: String
    let url: String
}

// MARK: - Encode/decode helpers
class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
