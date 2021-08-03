//
//  SettingsViewController.swift
//  homeWorkLesson10
//
//  Created by Moobat on 21.07.21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var buttonViews: UIView!
    @IBOutlet weak var buttonOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        buttonViews.layer.cornerRadius = 12
        buttonViews.layer.shadowColor = UIColor.black.cgColor
        buttonViews.layer.shadowRadius = 4
        buttonViews.layer.shadowOpacity = 0.9
        buttonViews.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        buttonOutlet.layer.borderWidth = 2
        buttonOutlet.layer.borderColor = UIColor.black.cgColor
        buttonOutlet.layer.cornerRadius = 12
        
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
