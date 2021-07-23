//
//  ScoreViewController.swift
//  homeWorkLesson10
//
//  Created by Moobat on 21.07.21.
//

import UIKit

class ScoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "⭐️ Score ⭐️"
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = false
    }

    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
}
