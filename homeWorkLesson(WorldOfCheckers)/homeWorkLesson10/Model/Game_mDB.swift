//
//  Game_mDB.swift
//  homeWorkLesson10
//
//  Created by Moobat on 29.11.21.
//

import UIKit

class Game_mDB {
    var gameDate: Date?
    var players: [Player_mDB]?
    
    init(from game: GameDB) {
        self.gameDate = game.gameDate
        self.players = game.playerDB?.allObjects.compactMap({ player -> Player_mDB in
            let player = player as! PlayerDB
            let playerW = Player_mDB(name: player.playerName, checkerColor: player.colorChecker, champion: player.winner)
            return playerW
        })
    }
    
    init(gameDate: Date, players: [Player_mDB]) {
        self.gameDate = gameDate
        self.players = players
    }
}
