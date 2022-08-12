//
//  User.swift
//  Friendface
//
//  Created by Badran on 09/08/2022.
//

import Foundation

struct User: Codable {
    let id: UUID
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
}
