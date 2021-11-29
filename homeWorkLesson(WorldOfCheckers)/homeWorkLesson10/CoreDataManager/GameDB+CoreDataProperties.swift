//
//  GameDB+CoreDataProperties.swift
//  homeWorkLesson10
//
//  Created by Moobat on 29.11.21.
//
//

import Foundation
import CoreData


extension GameDB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GameDB> {
        return NSFetchRequest<GameDB>(entityName: "GameDB")
    }

    @NSManaged public var gameDate: Date?
    @NSManaged public var playerDB: NSSet?

}

// MARK: Generated accessors for playerDB
extension GameDB {

    @objc(addPlayerDBObject:)
    @NSManaged public func addToPlayerDB(_ value: PlayerDB)

    @objc(removePlayerDBObject:)
    @NSManaged public func removeFromPlayerDB(_ value: PlayerDB)

    @objc(addPlayerDB:)
    @NSManaged public func addToPlayerDB(_ values: NSSet)

    @objc(removePlayerDB:)
    @NSManaged public func removeFromPlayerDB(_ values: NSSet)

}

extension GameDB : Identifiable {

}
