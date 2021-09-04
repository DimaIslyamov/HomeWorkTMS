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
        // not working!
//        SettingManager.shared.saveDate = self.dateLable.text
    }
    
    func removeDataFromUserDefaults() {
        userDef.removeObject(forKey: Keys.timerSec.rawValue)
        userDef.removeObject(forKey: Keys.timerMin.rawValue)
        userDef.removeObject(forKey: Keys.player1.rawValue)
        userDef.removeObject(forKey: Keys.player2.rawValue)
        // not working!
//        userDef.removeObject(forKey: Keys.dateFormatter.rawValue)
    }
    
    func setDataFromUserDefaults() {
        self.countSec = SettingManager.shared.saveTimerSec
        self.countMin = SettingManager.shared.saveTimerMin
        self.player1 = SettingManager.shared.savePlayerOne ?? "Anton"
        self.player2 = SettingManager.shared.savePlayerTwo ?? "Lera"
        // not working! Error here
//        dateLable.text = SettingManager.shared.saveDate
    }
    
    
    // MARK: - Методы костамизации доски и кнопки назад
    
    func chessboardCostamization() {
        // констрэйнты для доски
        chessboard.translatesAutoresizingMaskIntoConstraints = false
        chessboard.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        chessboard.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        chessboard.widthAnchor.constraint(equalToConstant: 320).isActive = true
        chessboard.heightAnchor.constraint(equalToConstant: 320).isActive = true
        
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
