//
//  String+Localaized.swift
//  homeWorkLesson10
//
//  Created by Moobat on 19.09.21.
//

import UIKit

extension String {
    var localaized: String {
        guard let languagePath = Bundle.main.path(forResource: SettingManager.shared.currentLanguageCode, ofType: "lproj"),
              let languageBundle = Bundle(path: languagePath) else { return self }
        
        return NSLocalizedString(self, bundle: languageBundle, value: "", comment: "")
    }
}
