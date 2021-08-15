//
//  RootViewController.swift
//  homeWorkLesson10
//
//  Created by Moobat on 13.07.21.
//

import UIKit

class RootViewController: UIViewController {
    
    let getStartedButton = UIButton()
    let scoreButton = UIButton()
    let settingsButton = UIButton()
    let aboutButton = UIButton()
    
    
    let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    var saveTimerCheckers: CellCheckers = CellCheckers()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(getStartedButton)
        view.addSubview(scoreButton)
        view.addSubview(settingsButton)
        view.addSubview(aboutButton)
        
        buttonCustomization()
        createButtonConstraint()
    }
    
    
    @objc func startTheGameTapped(_ sender: UIButton) {
        guard let vc = getViewController(from: "ChessBoard") as? ChessBoardController  else { return }
        self.navigationController?.pushViewController(vc, animated: true)
        // проверка есть ли файл
//        if FileManager().fileExists(atPath: URL.saveGameURL().path) {
//            presentAlertController(with: nil, massage: "Continue or start a New Game ?",
//                                   actions: UIAlertAction(title: "Continue",
//                                                          style: .default,
//                                                          handler: { _ in
//                                                            
//                                                            self.navigationController?.pushViewController(vc, animated: true)
//                                                          }),
//                                   
//                                   
//                                   UIAlertAction(title: "New Game",
//                                                 style: .default,
//                                                 handler: { _ in
//                                                    
//                                                    self.navigationController?.pushViewController(vc, animated: true)
//                                                 }))
//        }
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
