//
//  ChessBoardController+UserDef+Costamization.swift
//  homeWorkLesson10
//
//  Created by Moobat on 4.09.21.
//

import UIKit

extension ChessBoardController {
    
    // MARK: - Сохранение UserDefaults для таймера
    
    func saveDataToUserDefaults() {
        SettingManager.shared.saveTimerSec = self.countSec
        SettingManager.shared.saveTimerMin = self.countMin
        SettingManager.shared.savePlayerOne = self.player1
        SettingManager.shared.savePlayerTwo = self.player2
    }
    
    func removeDataFromUserDefaults() {
        userDef.removeObject(forKey: Keys.timerSec.rawValue)
        userDef.removeObject(forKey: Keys.timerMin.rawValue)
        userDef.removeObject(forKey: Keys.player1.rawValue)
        userDef.removeObject(forKey: Keys.player2.rawValue)
    }
    
    func setDataFromUserDefaults() {
        countSec = SettingManager.shared.saveTimerSec
        countMin = SettingManager.shared.saveTimerMin
        player1 = SettingManager.shared.savePlayerOne ?? "Anton"
        player2 = SettingManager.shared.savePlayerTwo ?? "Lera"
//        playersLable?.text = (current == .white) ? "\(player1) move" : "\(player2) move"
    }
    
    
    // MARK: - Методы костамизации доски и кнопки назад
    
    func chessboardCostamization() {
        // тени для доски
        chessboard.layer.shadowColor = UIColor.black.cgColor
        chessboard.layer.shadowRadius = 7
        chessboard.layer.shadowOpacity = 0.9
        chessboard.layer.shadowOffset = CGSize(width: 10, height: 10)
    }
    
    func backButtonFuncCostamize() {
        backButtonOutlet.layer.borderWidth = 2
        backButtonOutlet.layer.borderColor = UIColor.black.cgColor
        backButtonOutlet.layer.cornerRadius = 12
        
        viewOutlet.layer.cornerRadius = 12
        viewOutlet.layer.shadowColor = UIColor.black.cgColor
        viewOutlet.layer.shadowRadius = 4
        viewOutlet.layer.shadowOpacity = 0.9
        viewOutlet.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        lableForBackground.layer.shadowColor = UIColor.black.cgColor
        lableForBackground.layer.shadowRadius = 5
        lableForBackground.layer.shadowOpacity = 0.7
        lableForBackground.layer.shadowOffset = CGSize(width: 5, height: 5)
    }
}
