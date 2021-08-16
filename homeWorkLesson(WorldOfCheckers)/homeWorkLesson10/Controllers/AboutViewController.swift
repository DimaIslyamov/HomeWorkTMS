//
//  AboutViewController.swift
//  homeWorkLesson10
//
//  Created by Moobat on 3.08.21.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var backButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backButtonCostamization()
    }
    
    
    func backButtonCostamization() {
        buttonView.layer.cornerRadius = 12
        
        backButtonOutlet.layer.borderWidth = 2
        backButtonOutlet.layer.borderColor = UIColor.black.cgColor
        backButtonOutlet.layer.cornerRadius = 12
        
        buttonView.layer.shadowColor = UIColor.black.cgColor
        buttonView.layer.shadowRadius = 4
        buttonView.layer.shadowOpacity = 0.9
        buttonView.layer.shadowOffset = CGSize(width: 5, height: 5)
    }
    
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    
}
