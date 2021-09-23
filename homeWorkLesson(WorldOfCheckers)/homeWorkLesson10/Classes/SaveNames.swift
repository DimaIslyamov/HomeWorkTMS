//
//  SaveNames.swift
//  homeWorkLesson10
//
//  Created by Moobat on 23.09.21.
//

import UIKit

class SaveNames: NSObject, NSCoding, NSSecureCoding{
     static var supportsSecureCoding: Bool = true
     
     var nameOne: String
     var nameTwo: String
     
     init(nameOne: String, nameTwo: String){
          self.nameOne = nameOne
          self.nameTwo = nameTwo
     }
     
     func encode(with coder: NSCoder) {
          coder.encode(nameOne, forKey: Keys.namePlayerOne.rawValue)
          coder.encode(nameTwo, forKey: Keys.namePlayerTwo.rawValue)
     }
     
     required init?(coder: NSCoder) {
        self.nameOne = coder.decodeObject(forKey: Keys.namePlayerOne.rawValue) as?  String ?? ""
          self.nameTwo = coder.decodeObject(forKey: Keys.namePlayerTwo.rawValue) as? String ?? ""
     }
}
