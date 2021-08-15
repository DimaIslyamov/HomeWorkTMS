//
//  URL+CoreKit.swift
//  homeWorkLesson10
//
//  Created by Moobat on 15.08.21.
//

import UIKit

extension URL {
    static func saveGameURL() -> URL {
        let documentDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentDirectoryURL.appendingPathComponent("savedGame")
    return fileURL
    }
    
    
}
