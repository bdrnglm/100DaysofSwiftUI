//
//  Location.swift
//  BucketList
//
//  Created by Badran on 15/08/2022.
//

import Foundation

struct Location: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double
}
