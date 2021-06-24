//
//  ViewController.swift
//  homeWorkLesson5
//
//  Created by Moobat on 24.06.21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getRowIndexTask1()
    }

    // MARK: - TASK 1
    
    let englishAlphabet = "abcdefghijklmnopqrstuvwxyz"
    let oneCharacter = "m"
    
    func getRowIndexTask1()  {
        for (index, value) in englishAlphabet.enumerated() {
            if String(value) == oneCharacter {
                print("Индекс в строке: \(index)")
            }
        }
    }
    
    
}

