//
//  ScoreTableViewCell.swift
//  homeWorkLesson10
//
//  Created by Moobat on 29.11.21.
//

import UIKit

class ScoreTableViewCell: UITableViewCell {

    @IBOutlet weak var dateGame: UILabel!
    @IBOutlet weak var playerOne: UILabel!
    @IBOutlet weak var playerTwo: UILabel!
    @IBOutlet weak var playerOneName: UILabel!
    @IBOutlet weak var playerTwoName: UILabel!
    @IBOutlet weak var checkerColorPlayerOne: UILabel!
    @IBOutlet weak var checkerColorPlayerTwo: UILabel!
    @IBOutlet weak var colorFirstPlayer: UILabel!
    @IBOutlet weak var colorSecondPlayer: UILabel!
    @IBOutlet weak var winerPlayerOne: UILabel!
    @IBOutlet weak var winerPlayerTwo: UILabel!
    
    
    let dateFormatter = DateFormatter()
    let date = Date()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        playerOne.text = "Player one: "
        playerTwo.text = "Player two: "
        checkerColorPlayerOne.text = "Color of checker: "
        checkerColorPlayerTwo.text = "Color of checker: "
    }
    
    
    func setData(with game: Game_mDB) {
        dateFormatter.dateFormat = "MMM d, yyyy"
        let date = game.gameDate
        if let date = date {
            self.dateGame.text = dateFormatter.string(from: date)
        }
        let players = game.players ?? []
        guard !players.isEmpty else { return }
        
        self.playerOneName.text = players[0].name
        self.colorFirstPlayer.text = players[0].checkerColor
        self.playerTwoName.text = players[1].name
        self.colorSecondPlayer.text = players[1].checkerColor
        
        self.winerPlayerOne.text = players[0].champion == true ? "Victory" : "Defeted"
        self.winerPlayerTwo.text = players[1].champion == true ? "Victory" : "Defeted"
        
        self.colorFirstPlayer.text = colorFirstPlayer.text == "black" ? "black" : "white"
        self.colorSecondPlayer.text = colorSecondPlayer.text == "black" ? "black" : "white"
    }

    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        dateGame.text = ""
        playerTwoName.text = ""
        playerTwoName.text = ""
        colorFirstPlayer.text = ""
        colorSecondPlayer.text = ""
        winerPlayerOne.text = ""
        winerPlayerTwo.text = ""
    }
    
}
