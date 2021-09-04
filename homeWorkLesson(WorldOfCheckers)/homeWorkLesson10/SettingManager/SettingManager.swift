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
    
    var savePlayerOne: String? {
        set { UserDefaults.standard.setValue(newValue, forKey: Keys.player1.rawValue) }
        get { UserDefaults.standard.string(forKey: Keys.player1.rawValue)}
    }
    
    var savePlayerTwo: String? {
        set { UserDefaults.standard.setValue(newValue, forKey: Keys.player2.rawValue) }
        get { UserDefaults.standard.string(forKey: Keys.player2.rawValue)}
    }
    
    // не работает !!
    var saveDate: String? {
        set { UserDefaults.standard.setValue(newValue, forKey: Keys.dateFormatter.rawValue) }
        get { UserDefaults.standard.string(forKey: Keys.dateFormatter.rawValue) }
    }
    
    var saveBackgroundForCheckerViewController: Any {
        set {
            try? FileManager.default.removeItem(at: URL.getBackgroundURL())
            let data = try? NSKeyedArchiver.archivedData(withRootObject: newValue, requiringSecureCoding: true)
            try? data?.write(to: URL.getBackgroundURL())
        }
        get {
            guard let data = FileManager.default.contents(
                    atPath: URL.getBackgroundURL().absoluteString.replacingOccurrences(of: "file://",
                                                                                       with: "")),
                  let object = try? NSKeyedUnarchiver.unarchivedObject(ofClass: UIImage.self, from: data) else {
                return UIImage()
            }
            return object
        }
    }
    
    var saveCellsCheckers: [CellCheckers] {
        set {
            let data = try? NSKeyedArchiver.archivedData(withRootObject: newValue, requiringSecureCoding: true)
            try? data?.write(to: URL.saveCellsCheckerURL())
        }
        get {
            guard let data = FileManager.default.contents(
                    atPath: URL.saveCellsCheckerURL().absoluteString.replacingOccurrences(of: "file://",
                                                                                      with: "")),
                  let object = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [CellCheckers] else {
                return []
            }
            return object
        }
    }
}
