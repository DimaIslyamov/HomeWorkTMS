//
//  PlayerDB+CoreDataProperties.swift
//  homeWorkLesson10
//
//  Created by Moobat on 29.11.21.
//
//

import Foundation
import CoreData


extension PlayerDB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlayerDB> {
        return NSFetchRequest<PlayerDB>(entityName: "PlayerDB")
    }

    @NSManaged public var colorChecker: String?
    @NSManaged public var playerName: String?
    @NSManaged public var winner: Bool
    @NSManaged public var gameDB: GameDB?
    
    func convert(by player: Player_mDB) {
        self.playerName = player.name
        self.colorChecker = player.checkerColor
        self.winner = player.champion
    }

}

extension PlayerDB : Identifiable {

}
