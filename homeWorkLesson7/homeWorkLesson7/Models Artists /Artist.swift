//
//  Artist.swift
//  homeWorkLesson7
//
//  Created by Moobat on 2.07.21.
//

import Foundation


class Artist {
    
    let name: String?
    let surName: String?
    
    init(name: String?, surName: String?) {
        self.name = name
        self.surName = surName
    }
    
    func performance() -> String {
        return "Hello! My name is \(name ?? "") \(surName ?? ""), "
    }
    
}
