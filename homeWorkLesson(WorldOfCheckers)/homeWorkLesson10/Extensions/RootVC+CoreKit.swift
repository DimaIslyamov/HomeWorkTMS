//
//  RootVC+CoreKit.swift
//  homeWorkLesson10
//
//  Created by Moobat on 22.07.21.
//

import UIKit


extension RootViewController {
    func getViewController(from id: String) -> UIViewController? {
        let storyboard = UIStoryboard(name: id, bundle: nil)
        guard let currentVC = storyboard.instantiateInitialViewController() else { return nil }
        return currentVC
    }
    
    
}
