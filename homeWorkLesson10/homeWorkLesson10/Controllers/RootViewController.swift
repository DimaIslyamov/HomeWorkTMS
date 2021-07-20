//
//  RootViewController.swift
//  homeWorkLesson10
//
//  Created by Moobat on 13.07.21.
//

import UIKit

// 1: Констрэйнты - чтобы на всех экранах было нормально все!
// 2: Дизайн Придумать !!
// 3: сделать LaunchScreen.storyboard (скачать шашку и фон какой нибудь) || (на всю имедж сделать)

class RootViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chess Board"
        viewControllerBackground()
        createButton()
    }
    
    
    
    func getViewController(from id: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "ChessBoard", bundle: nil)
        let currentVC = storyboard.instantiateViewController(withIdentifier: id)
        currentVC.modalPresentationStyle = .fullScreen
        currentVC.modalTransitionStyle = .crossDissolve
        return currentVC
    }

    
    @objc func buttonTapped(_ sender: UIButton) {
        navigationController?.pushViewController(getViewController(from: "chessBoardVC"), animated: true)
    }
}




// MARK: - Extension

extension RootViewController {
    func createButton() {
        let getStartedButton = UIButton(frame: CGRect(x: 100,
                                                      y: 350,
                                                      width: 190,
                                                      height: 40))
        
        let scoreButton = UIButton(frame: CGRect(x: 100,
                                                 y: 400,
                                                 width: 190,
                                                 height: 40))
        
        let settingsButton = UIButton(frame: CGRect(x: 100,
                                                    y: 450,
                                                    width: 190,
                                                    height: 40))
        
        getStartedButton.setTitle("Start the Game", for: .normal)
        getStartedButton.layer.borderWidth = 1
        getStartedButton.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        getStartedButton.backgroundColor = .clear
        getStartedButton.layer.cornerRadius = 12
        getStartedButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        scoreButton.backgroundColor = .clear
        scoreButton.setTitle("⭐️ Score ⭐️", for: .normal)
        scoreButton.layer.borderWidth = 1
        scoreButton.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        scoreButton.layer.cornerRadius = 12
        
        settingsButton.backgroundColor = .clear
        settingsButton.setTitle("⚙️ Settings ⚙️", for: .normal)
        settingsButton.layer.borderWidth = 1
        settingsButton.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        settingsButton.layer.cornerRadius = 12
        
        view.addSubview(getStartedButton)
        view.addSubview(scoreButton)
        view.addSubview(settingsButton)
        
    }
    
    
    func viewControllerBackground() {
        let rootViewColor = UIColor(displayP3Red: 110/255,
                                    green: 80/255,
                                    blue: 180/255,
                                    alpha: 1).cgColor
        let rootViwColorTwo = UIColor(displayP3Red: 20/255,
                                      green: 160/255,
                                      blue: 160/255,
                                      alpha: 1).cgColor
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [rootViewColor, rootViwColorTwo]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1.0)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
