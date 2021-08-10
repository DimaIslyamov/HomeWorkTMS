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
        guard let vc = getViewController(from: "ChessBoard") else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func scoreTapped(_ sender: UIButton) {
        guard let vc = getViewController(from: "Score") else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func settingsTapped(_ sender: UIButton) {
        guard let vc = getViewController(from: "Settings") else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func aboutTapped(_ sender: UIButton) {
        guard let vc = getViewController(from: "About") else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
