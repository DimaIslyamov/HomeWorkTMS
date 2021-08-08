//
//  ViewController+CoreKit.swift
//  homeWorkLesson16
//
//  Created by Moobat on 8.08.21.
//

import UIKit

extension ViewController {
    
    func getTaskTwoViewController(from id: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: id)
        return vc
    }
    
}
