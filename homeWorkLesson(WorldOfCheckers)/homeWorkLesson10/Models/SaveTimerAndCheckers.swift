//
//  SaveTimerAndCheckers.swift
//  homeWorkLesson10
//
//  Created by Moobat on 11.08.21.
//

import Foundation
import UIKit

class SaveTimerAndCheckers: NSObject, NSCoding {
    var timer: String? = nil
    var checkerTag: Int? = nil
    
    override init() {
        super.init()
    }

    
    func encode(with coder: NSCoder) {
        coder.encode(timer, forKey: "timer_")
        coder.encode(checkerTag, forKey: "checkersTag_")
    }
    
    
    required init?(coder: NSCoder) {
        self.timer = coder.decodeObject(forKey: "timer_") as? String
        self.checkerTag = coder.decodeObject(forKey: "checkersTag_") as? Int
    }
}
