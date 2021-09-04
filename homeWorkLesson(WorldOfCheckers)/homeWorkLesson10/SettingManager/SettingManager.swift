//
//  SettingManager.swift
//  homeWorkLesson10
//
//  Created by Moobat on 4.09.21.
//

import UIKit

class SettingManager {
    static let shared = SettingManager()
    
    var saveWhiteChecker: String? {
        set { UserDefaults.standard.setValue(newValue, forKey: Keys.checkerImageWhite.rawValue) }
        get { UserDefaults.standard.string(forKey: Keys.checkerImageWhite.rawValue) }
    }
    
    var saveBlackChecker: String? {
        set { UserDefaults.standard.setValue(newValue, forKey: Keys.checkerImageBlack.rawValue) }
        get { UserDefaults.standard.string(forKey: Keys.checkerImageBlack.rawValue) }
    }
    
    var saveTimerSec: Int {
        set { UserDefaults.standard.setValue(newValue, forKey: Keys.timerSec.rawValue) }
        get { UserDefaults.standard.integer(forKey: Keys.timerSec.rawValue) }
    }
    
    var saveTimerMin: Int {
        set { UserDefaults.standard.setValue(newValue, forKey: Keys.timerMin.rawValue) }
        get { UserDefaults.standard.integer(forKey: Keys.timerMin.rawValue) }
        
    }
}
