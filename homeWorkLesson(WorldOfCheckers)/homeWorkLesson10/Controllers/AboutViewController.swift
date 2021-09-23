//
//  AboutViewController.swift
//  homeWorkLesson10
//
//  Created by Moobat on 3.08.21.
//

import UIKit

class AboutViewController: UIViewController {
    // MARK: - @OUTLETS
    
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var backButtonOutlet: UIButton!
    
    
    // MARK: - Жизненный цикл
    
    override func viewDidLoad() {
        super.viewDidLoad()

        localaized()
        backButtonCostamization()
    }
    
    // MARK: - Методы
    
    func localaized() {
        backButtonOutlet.setTitle("Back_button_about".localaized, for: .normal)
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
    
    
    // MARK: - @IBAction
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    
}
