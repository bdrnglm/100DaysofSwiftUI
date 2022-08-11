//
//  Friend.swift
//  Friendface
//
//  Created by Badran on 09/08/2022.
//

import Foundation

struct Friend: Codable, Identifiable {
    let id: UUID
    let name: String
}
