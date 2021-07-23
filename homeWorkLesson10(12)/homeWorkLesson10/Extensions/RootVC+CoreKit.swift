//
//  RootVC+CoreKit.swift
//  homeWorkLesson10
//
//  Created by Moobat on 22.07.21.
//

import UIKit


extension RootViewController {
    
    // score и settings находятся в сториборде Main
    func getVC(from id: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let currentVC = storyboard.instantiateViewController(withIdentifier: id)
        currentVC.modalPresentationStyle = .fullScreen
        currentVC.modalTransitionStyle = .crossDissolve
        return currentVC
    }
    
    
    // доска находится в отдельном сториборде
    func getViewController(from id: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "ChessBoard", bundle: nil)
        let currentVC = storyboard.instantiateViewController(withIdentifier: id)
        currentVC.modalPresentationStyle = .fullScreen
        currentVC.modalTransitionStyle = .crossDissolve
        return currentVC
    }
    
    
    // метод костамизирующий UIButtons
    func buttonCustomization() {
        getStartedButton.setTitle("Start the Game", for: .normal)
        getStartedButton.layer.borderWidth = 1
        getStartedButton.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        getStartedButton.backgroundColor = .clear
        getStartedButton.layer.cornerRadius = 12
        getStartedButton.translatesAutoresizingMaskIntoConstraints = false
        
        getStartedButton.layer.shadowColor = UIColor.black.cgColor
        getStartedButton.layer.shadowRadius = 3
        getStartedButton.layer.shadowOpacity = 0.9
        getStartedButton.layer.shadowOffset = CGSize(width: 8, height: 8)
        
        getStartedButton.addTarget(self, action: #selector(startTheGameTapped(_:)), for: .touchUpInside)
        
        scoreButton.backgroundColor = .clear
        scoreButton.setTitle("Score", for: .normal)
        scoreButton.layer.borderWidth = 1
        scoreButton.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        scoreButton.layer.cornerRadius = 12
        scoreButton.translatesAutoresizingMaskIntoConstraints = false
        
        scoreButton.layer.shadowColor = UIColor.black.cgColor
        scoreButton.layer.shadowRadius = 4
        scoreButton.layer.shadowOpacity = 0.9
        scoreButton.layer.shadowOffset = CGSize(width: 10, height: 10)
        
        scoreButton.addTarget(self, action: #selector(scoreTapped(_:)), for: .touchUpInside)
        
        settingsButton.backgroundColor = .clear
        settingsButton.setTitle("Settings", for: .normal)
        settingsButton.layer.borderWidth = 1
        settingsButton.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        settingsButton.layer.cornerRadius = 12
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        
        settingsButton.layer.shadowColor = UIColor.black.cgColor
        settingsButton.layer.shadowRadius = 3
        settingsButton.layer.shadowOpacity = 0.9
        settingsButton.layer.shadowOffset = CGSize(width: 10, height: 10)
        
        settingsButton.addTarget(self, action: #selector(settingsTapped(_:)), for: .touchUpInside)
    }
    
    
    // создание констрейнтов через Anchor для UIButtons
    func createButtonConstraint() {
        getStartedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        getStartedButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        getStartedButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2).isActive = true
        getStartedButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        scoreButton.leftAnchor.constraint(equalTo: getStartedButton.leftAnchor).isActive = true
        scoreButton.rightAnchor.constraint(equalTo: getStartedButton.rightAnchor).isActive = true
        scoreButton.topAnchor.constraint(equalTo: getStartedButton.bottomAnchor, constant: 10).isActive = true
        scoreButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        settingsButton.leftAnchor.constraint(equalTo: scoreButton.leftAnchor).isActive = true
        settingsButton.rightAnchor.constraint(equalTo: scoreButton.rightAnchor).isActive = true
        settingsButton.topAnchor.constraint(equalTo: scoreButton.bottomAnchor, constant: 10).isActive = true
        settingsButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
