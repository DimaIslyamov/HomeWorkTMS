//
//  UserHistoriSearch.swift
//  homeWorkLesson23(WheatherAndNews)2
//
//  Created by Moobat on 2.10.21.
//

import UIKit
import RealmSwift

class UserHistoriSearch: Object {
    @Persisted var cityName: String = ""
    @Persisted var temperature: Int = 0
    
    
    convenience init(cityName: String, temperature: Int) {
        self.init()
        self.cityName = cityName
        self.temperature = temperature
    }
}
