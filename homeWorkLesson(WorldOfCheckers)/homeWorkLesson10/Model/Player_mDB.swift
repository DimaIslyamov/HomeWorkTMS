//
//  Player_mDB.swift
//  homeWorkLesson10
//
//  Created by Moobat on 29.11.21.
//

import UIKit

class Player_mDB {
    var name: String?
    var checkerColor: String?
    var champion: Bool = false
    var gameDB: GameDB?
    
    init(name: String?, checkerColor: String?, champion: Bool) {
        self.name = name
        self.checkerColor = checkerColor
        self.champion = champion
    }
}
