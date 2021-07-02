//
//  Actor.swift
//  homeWorkLesson7
//
//  Created by Moobat on 2.07.21.
//

import Foundation


class Actor: Artist {
    
    override func performance() -> String {
        let perfor = super.performance()
        return perfor + "and i playing a role."
    }
    
}
