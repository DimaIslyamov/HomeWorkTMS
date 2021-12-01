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
        
        playerOne.text = "player_one".localaized
        playerTwo.text = "player_two".localaized
        checkerColorPlayerOne.text = "color_of_checkers".localaized
        checkerColorPlayerTwo.text = "color_of_checkers".localaized
    }
    
    
    func setData(with game: Game_mDB) {
        dateFormatter.dateFormat = "MM/dd/yyyy"
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
        
        self.winerPlayerOne.text = players[0].champion == true ? "victory_lable_text".localaized : "defeated_lable_text".localaized
        self.winerPlayerTwo.text = players[1].champion == true ? "victory_lable_text".localaized : "defeated_lable_text".localaized
        
        self.winerPlayerOne.textColor = self.winerPlayerOne.text == "victory_lable_text".localaized ? #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1) : #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        self.winerPlayerTwo.textColor = self.winerPlayerTwo.text == "victory_lable_text".localaized ? #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1) : #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        
        self.colorFirstPlayer.text = colorFirstPlayer.text == "black" ? "checker_color_play_black".localaized : "checer_color_play_white".localaized
        self.colorSecondPlayer.text = colorSecondPlayer.text == "black" ? "checker_color_play_black".localaized : "checer_color_play_white".localaized
    }
}
