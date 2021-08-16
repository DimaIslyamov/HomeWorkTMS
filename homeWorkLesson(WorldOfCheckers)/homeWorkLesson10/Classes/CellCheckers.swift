//
//  SaveTimerAndCheckers.swift
//  homeWorkLesson10
//
//  Created by Moobat on 11.08.21.
//

import Foundation
import UIKit

class CellCheckers: NSObject, NSCoding, NSSecureCoding {
    static var supportsSecureCoding: Bool = true
    
//    var cellAndChecker: Int?
    var checkerTag: Int?
    var cellTag: Int?
    
    
    override init() {
        super.init()
    }

    func encode(with coder: NSCoder) { // кодировка
        coder.encode(cellTag, forKey: Keys.cellTag.rawValue)
        coder.encode(checkerTag, forKey: Keys.checkerTag.rawValue)
    }
    
    
    required init?(coder: NSCoder) { // декодировка
        self.cellTag = coder.decodeObject(forKey: Keys.cellTag.rawValue) as? Int
        self.checkerTag = coder.decodeObject(forKey: Keys.checkerTag.rawValue) as? Int
    }
}
