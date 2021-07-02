//
//  Painter.swift
//  homeWorkLesson7
//
//  Created by Moobat on 2.07.21.
//

import Foundation


class Painter: Artist {
    let painterArtisticName: String
    
    init(painterArtisticName: String, name: String?, surName: String?) {
        self.painterArtisticName = painterArtisticName
        super.init(name: name, surName: surName)
    }
    
    override func performance() -> String {
        let _ = super.performance()
        return "Call me \(painterArtisticName)!"
    }
    
}
