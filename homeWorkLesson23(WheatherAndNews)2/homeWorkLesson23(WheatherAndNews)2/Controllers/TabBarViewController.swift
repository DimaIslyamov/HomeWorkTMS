//
//  TabBarViewController.swift
//  homeWorkLesson23(WheatherAndNews)2
//
//  Created by Moobat on 25.09.21.
//

import UIKit

class TabBarViewController: UITabBarController {

    let notificationCentre = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        notificationCentreRequestAuthorization()
    }
    

    func notificationCentreRequestAuthorization() {
        notificationCentre.getPendingNotificationRequests { request in
            guard let _ = request.first(where: {$0.identifier == "5days_notificationRequest"}) else { return }
            self.notificationCentre.removePendingNotificationRequests(withIdentifiers: ["5days_notificationRequest"])
            print()
        }
        
        notificationCentre.requestAuthorization(options: [.alert, .badge, .sound]) { result, error in
            guard result else { return}
            
            let content = UNMutableNotificationContent()
            content.title = "Хэй ты бессмертный? Любишь мокнуть под дождем?"
            content.sound = UNNotificationSound.default
            content.badge = 1
            content.body = "Узнай погоду на сегодня 🏖"
            
            // for test
//            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 20.0,
//                                                            repeats: false)
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 432000.0,
                                                            repeats: true)
            let request = UNNotificationRequest(identifier: "5days_notificationRequest",
                                                content: content,
                                                trigger: trigger)
            self.notificationCentre.add(request) { error_ in
                print(error_?.localizedDescription ?? "")
            }
            print("nnotificationCentreRequest added ")
        }
    }

}
