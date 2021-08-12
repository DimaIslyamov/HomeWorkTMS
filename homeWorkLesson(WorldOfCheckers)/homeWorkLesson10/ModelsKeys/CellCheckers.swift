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
    
    var cellPosition: CGPoint?
    var colorCheckerCell: Int?
    var timerT: Int?
    
     init(cellPosition: CGPoint, colorCheckerCell: Int, timerT: Int) {
        self.cellPosition = cellPosition
        self.colorCheckerCell = colorCheckerCell
        self.timerT = timerT
    }
    
    override init() {
        super.init()
    }

    func encode(with coder: NSCoder) { // кодировка
        coder.encode(cellPosition, forKey: Keys.cellPosition.rawValue)
        coder.encode(colorCheckerCell, forKey: Keys.colorCheckerCell.rawValue)
        coder.encode(timerT, forKey: Keys.timerT.rawValue)
    }
    
    
    required init?(coder: NSCoder) { // декодировка
        self.cellPosition = coder.decodeCGPoint(forKey: Keys.cellPosition.rawValue)
        self.colorCheckerCell = coder.decodeInteger(forKey: Keys.colorCheckerCell.rawValue)
        self.timerT = coder.decodeInteger(forKey: Keys.timerT.rawValue)
    }
}
