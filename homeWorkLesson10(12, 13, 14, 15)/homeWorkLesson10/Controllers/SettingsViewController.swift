//
//  SettingsViewController.swift
//  homeWorkLesson10
//
//  Created by Moobat on 21.07.21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet  var buttonViews: [UIView]!
    @IBOutlet  var buttonOutlet: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        buttonViews.forEach { can in
            can.layer.cornerRadius = 12
            can.layer.shadowColor = UIColor.black.cgColor
            can.layer.shadowRadius = 4
            can.layer.shadowOpacity = 0.9
            can.layer.shadowOffset = CGSize(width: 5, height: 5)
        }
        
        buttonOutlet.forEach { can in
            can.layer.borderWidth = 2
            can.layer.borderColor = UIColor.black.cgColor
            can.layer.cornerRadius = 12
        }
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func aboutButtonTapped(_ sender: UIButton) {
        
    }
}
