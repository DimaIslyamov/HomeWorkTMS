//
//  HttpManager.swift
//  homeWorkLesson23(WheatherAndNews)2
//
//  Created by Moobat on 15.09.21.
//

import UIKit
import Alamofire

class HttpManager {
    
    static let shared = HttpManager()
    
    func getWeather(_ url: String, _ onCompletion: @escaping ([Wheather]) -> Void) {
        AF.request(url, method: .get).response(queue: DispatchQueue.global(qos: .userInteractive)) { response in
            guard let data = response.data else { return }
            onCompletion(ParseManager.shared.pareseWeather(data))
        }
    }
    
}
