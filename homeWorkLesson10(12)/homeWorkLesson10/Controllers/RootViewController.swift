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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main menu"
        
        view.addSubview(getStartedButton)
        view.addSubview(scoreButton)
        view.addSubview(settingsButton)
        
        buttonCustomization()
        createButtonConstraint()
    }
    
    
      // метод костамизирующий UIButtons
    func buttonCustomization() {
        getStartedButton.setTitle("Start the Game", for: .normal)
        getStartedButton.layer.borderWidth = 1
        getStartedButton.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        getStartedButton.backgroundColor = .clear
        getStartedButton.layer.cornerRadius = 12
        getStartedButton.translatesAutoresizingMaskIntoConstraints = false
        getStartedButton.addTarget(self, action: #selector(startTheGameTapped(_:)), for: .touchUpInside)
        
        scoreButton.backgroundColor = .clear
        scoreButton.setTitle("⭐️ Score ⭐️", for: .normal)
        scoreButton.layer.borderWidth = 1
        scoreButton.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        scoreButton.layer.cornerRadius = 12
        scoreButton.translatesAutoresizingMaskIntoConstraints = false
        scoreButton.addTarget(self, action: #selector(scoreTapped(_:)), for: .touchUpInside)
        
        settingsButton.backgroundColor = .clear
        settingsButton.setTitle("⚙️ Settings ⚙️", for: .normal)
        settingsButton.layer.borderWidth = 1
        settingsButton.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        settingsButton.layer.cornerRadius = 12
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
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
    
  
    
    @objc func startTheGameTapped(_ sender: UIButton) {
        navigationController?.pushViewController(getViewController(from: "chessBoardVC"), animated: true)
    }
    
    @objc func scoreTapped(_ sender: UIButton) {
        navigationController?.pushViewController(getVC(from: "scoreViewController"), animated: true)
    }
    
    @objc func settingsTapped(_ sender: UIButton) {
        navigationController?.pushViewController(getVC(from: "settingsViewController"), animated: true)
    }
}
