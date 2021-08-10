//
//  RootVC+CoreKit.swift
//  homeWorkLesson10
//
//  Created by Moobat on 22.07.21.
//

import UIKit


extension RootViewController {
    
    func getViewController(from id: String) -> UIViewController? {
        let storyboard = UIStoryboard(name: id, bundle: nil)
        guard let currentVC = storyboard.instantiateInitialViewController() else { return nil }
        return currentVC
    }
    
    
    // метод костамизирующий UIButtons
    func buttonCustomization() {
        getStartedButton.setTitle("Start the Game", for: .normal)
        getStartedButton.setTitleColor(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1), for: .normal)
        getStartedButton.titleLabel?.font = UIFont(name: "Kefa", size: 17)
        getStartedButton.layer.borderWidth = 2
        getStartedButton.layer.borderColor = UIColor.black.cgColor
        getStartedButton.backgroundColor = #colorLiteral(red: 0.3900135159, green: 0.01423221827, blue: 0.01847057045, alpha: 1)
        getStartedButton.layer.cornerRadius = 12
        getStartedButton.translatesAutoresizingMaskIntoConstraints = false
        
        getStartedButton.layer.shadowColor = UIColor.black.cgColor
        getStartedButton.layer.shadowRadius = 3
        getStartedButton.layer.shadowOpacity = 0.9
        getStartedButton.layer.shadowOffset = CGSize(width: 8, height: 8)
        
        getStartedButton.addTarget(self, action: #selector(startTheGameTapped(_:)), for: .touchUpInside)
        
        scoreButton.backgroundColor = #colorLiteral(red: 0.3900135159, green: 0.01423221827, blue: 0.01847057045, alpha: 1)
        scoreButton.setTitle("Score", for: .normal)
        scoreButton.setTitleColor(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1), for: .normal)
        scoreButton.titleLabel?.font = UIFont(name: "Kefa", size: 17)
        scoreButton.layer.borderWidth = 2
        scoreButton.layer.borderColor = UIColor.black.cgColor
        scoreButton.layer.cornerRadius = 12
        scoreButton.translatesAutoresizingMaskIntoConstraints = false
        
        scoreButton.layer.shadowColor = UIColor.black.cgColor
        scoreButton.layer.shadowRadius = 4
        scoreButton.layer.shadowOpacity = 0.9
        scoreButton.layer.shadowOffset = CGSize(width: 10, height: 10)
        
        scoreButton.addTarget(self, action: #selector(scoreTapped(_:)), for: .touchUpInside)
        
        settingsButton.backgroundColor = #colorLiteral(red: 0.3900135159, green: 0.01423221827, blue: 0.01847057045, alpha: 1)
        settingsButton.setTitle("Settings", for: .normal)
        settingsButton.setTitleColor(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1), for: .normal)
        settingsButton.titleLabel?.font = UIFont(name: "Kefa", size: 17)
        settingsButton.layer.borderWidth = 2
        settingsButton.layer.borderColor = UIColor.black.cgColor
        settingsButton.layer.cornerRadius = 12
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        
        settingsButton.layer.shadowColor = UIColor.black.cgColor
        settingsButton.layer.shadowRadius = 3
        settingsButton.layer.shadowOpacity = 0.9
        settingsButton.layer.shadowOffset = CGSize(width: 10, height: 10)
        
        settingsButton.addTarget(self, action: #selector(settingsTapped(_:)), for: .touchUpInside)
        
        aboutButton.backgroundColor = #colorLiteral(red: 0.3900135159, green: 0.01423221827, blue: 0.01847057045, alpha: 1)
        aboutButton.setTitle("About", for: .normal)
        aboutButton.setTitleColor(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1), for: .normal)
        aboutButton.titleLabel?.font = UIFont(name: "Kefa", size: 17)
        aboutButton.layer.borderWidth = 2
        aboutButton.layer.borderColor = UIColor.black.cgColor
        aboutButton.layer.cornerRadius = 12
        aboutButton.translatesAutoresizingMaskIntoConstraints = false
        
        aboutButton.layer.shadowColor = UIColor.black.cgColor
        aboutButton.layer.shadowRadius = 3
        aboutButton.layer.shadowOpacity = 0.9
        aboutButton.layer.shadowOffset = CGSize(width: 10, height: 10)
        
        aboutButton.addTarget(self, action: #selector(aboutTapped(_:)), for: .touchUpInside)
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
        
        aboutButton.leftAnchor.constraint(equalTo: settingsButton.leftAnchor).isActive = true
        aboutButton.rightAnchor.constraint(equalTo: settingsButton.rightAnchor).isActive = true
        aboutButton.topAnchor.constraint(equalTo: settingsButton.bottomAnchor, constant: 10).isActive = true
        aboutButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
