//
//  URL+CoreKit.swift
//  homeWorkLesson10
//
//  Created by Moobat on 23.08.21.
//

import Foundation
import UIKit

extension URL {
    static func getBackgroundURL() -> URL {
        let documentDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentDirectoryURL.appendingPathComponent("saveBackraound")
        return fileURL
    }
    
    static func saveCellsCheckerURL() -> URL {
        let documentDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentDirectoryURL.appendingPathComponent("saveCheckers")
        return fileURL
    }
    
    static func saveNameURL() -> URL {
        let documentDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentDirectoryURL.appendingPathComponent("saveName")
        return fileURL
    }
}
