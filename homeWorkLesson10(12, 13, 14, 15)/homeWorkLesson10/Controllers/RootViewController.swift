//
//  RootViewController.swift
//  homeWorkLesson10
//
//  Created by Moobat on 13.07.21.
//

import UIKit

class RootViewController: UIViewController {
    
    // background ImageView создал в интерфейсБилдере (во всех контроллерах).
    
    let getStartedButton = UIButton()
    let scoreButton = UIButton()
    let settingsButton = UIButton()
    let aboutButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main menu"
        
        view.addSubview(getStartedButton)
        view.addSubview(scoreButton)
        view.addSubview(settingsButton)
        view.addSubview(aboutButton)
        
        buttonCustomization()
        createButtonConstraint()
    }
    
    
    
    @objc func startTheGameTapped(_ sender: UIButton) {
        navigationController?.pushViewController(getChessBoardVC(from: "chessBoardVC"), animated: true)
    }
    
    @objc func scoreTapped(_ sender: UIButton) {
        navigationController?.pushViewController(getScoreViewController(from: "scoreViewController"), animated: true)
    }
    
    @objc func settingsTapped(_ sender: UIButton) {
        navigationController?.pushViewController(getSettingsViewController(from: "settingsViewController"), animated: true)
    }
    
    @objc func aboutTapped(_ sender: UIButton) {
        navigationController?.pushViewController(getAboutViewController(from: "aboutViewController"), animated: true)
    }
}
