//
//  CachedFriend+CoreDataProperties.swift
//  Friendface
//
//  Created by Badran on 11/08/2022.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var user: CachedUser?

    public var wrappedId: UUID {
        id ?? UUID()
    }
    
    public var wrappedName: String {
        name ?? "No Friend's Name"
    }
}

extension CachedFriend : Identifiable {

}
