//
//  ViewController.swift
//  homeWorkLesson11
//
//  Created by Moobat on 15.07.21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var collections: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collections.forEach { buttons in
            buttons.layer.cornerRadius = 40
        }
    }
    
    
    
}
