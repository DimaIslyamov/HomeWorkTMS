//
//  KeysUserDefaults.swift
//  homeWorkLesson10
//
//  Created by Moobat on 11.08.21.
//

import Foundation

enum Keys: String {
    case cellAndChecker = "cellAndChecker_"
    case currentChecker = "currentChecker_"
//    для тагов
    case cellTag = "cellTag_"
    case checkerTag = "checkerTag_"
//    для images шашек и backgrounda
    case checkerImageBlack = "checkerImageBlack_"
    case checkerImageWhite = "checkerImageWhite_"
    case backgraundImage = "backgraundImage_"
//    для таймера и даты
    case timerSec = "timerSec_"
    case timerMin = "timerMin_"
    case dateFormatter = "dateFormatter_"
//    кейс для игроков
    case player1 = "player_1"
    case player2 = "player_2"
    case namePlayerOne = "namePlayerOne_"
    case namePlayerTwo = "namePlayerTwo_"
    case namePlayers = "namePlayers_"
//    кейс для локализации
    case currentLanguageCode = "currentLanguageCode_"
}
