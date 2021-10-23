//
//  TabBarViewController.swift
//  homeWorkLesson23(WheatherAndNews)2
//
//  Created by Moobat on 25.09.21.
//

import UIKit

class TabBarViewController: UITabBarController {

//    let notificationCentre = UNUserNotificationCenter.current()
//    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarViewController")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let newVC = SettingsManager.shared.pushVC,
              let mapVC = UIViewController.getViewController(from: "MapViewController"),
              let historyVC = UIViewController.getViewController(from: "HistoryTableViewController") else { return }
        switch newVC {
        case "MapViewController":
            navigationController?.setViewControllers([self, mapVC], animated: true)
        case "HistoryTableViewController":
            navigationController?.setViewControllers([self, mapVC, historyVC], animated: true)
        default: break
        }
    }
    

    

}
