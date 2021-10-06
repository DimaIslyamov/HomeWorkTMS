//
//  RealmManager.swift
//  homeWorkLesson23(WheatherAndNews)2
//
//  Created by Moobat on 2.10.21.
//

import UIKit
import RealmSwift

class RealmManager {
    static let shared = RealmManager()
    
    let localRealm = try! Realm()
    
    func createCityNameAndTemperature(cityName: String, temperature: Int) {
        let userHistory = UserHistoriSearch(cityName: cityName, temperature: temperature)
        
        do {
            try localRealm.write {
//                localRealm.deleteAll()
                localRealm.add(userHistory)
                print("Added - do block")
            }
        }
        catch(let e) {
            print("what e ?? \(e)")
        }
    }
    
    func getCityAndTemp() -> Results<UserHistoriSearch>{
        let user = localRealm.objects(UserHistoriSearch.self)
        return user
    }
}
