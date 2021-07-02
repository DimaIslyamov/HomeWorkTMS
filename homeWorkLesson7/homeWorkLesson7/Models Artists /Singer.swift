//
//  Singer.swift
//  homeWorkLesson7
//
//  Created by Moobat on 2.07.21.
//

import Foundation


class Singer: Artist {

    override func performance() -> String {
        let perfor = super.performance()
        return perfor + "and i singing."
    }
    
}
