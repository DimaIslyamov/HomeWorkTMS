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
    var isNewGame = true
    
    
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
    
    
//    func getTimerAndCheckers() {
//        let fileURL = documentDirectory.appendingPathComponent("timer_chekers")
//        guard let data = FileManager.default.contents(atPath: fileURL.absoluteString.replacingOccurrences(of: "file://", with: "")) else { return }
//
//        do {
//            guard let object = try NSKeyedUnarchiver.unarchivedObject(ofClass: CellCheckers.self, from: data) else { return }
//            self.saveTimerCheckers = object
//        } catch(let a) {
//            print(a)
//        }
//    }
    
    
    @objc func startTheGameTapped(_ sender: UIButton) {
        guard let vc = getViewController(from: "ChessBoard") as? ChessBoardController  else { return }
        
        // это надо будет вынести в extension
        let documentDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentDirectoryURL.appendingPathComponent("savedGame")
        
        // проверка есть ли файл
        if FileManager().fileExists(atPath: fileURL.path) {
            presentAlertController(with: nil, massage: "Continue or start a New Game ?",
                                   actions: UIAlertAction(title: "Continue",
                                                          style: .default,
                                                          handler: { _ in
                                                            vc.isNewGame = false
                                                            self.navigationController?.pushViewController(vc, animated: true)
                                                          }),
                                   
                                   
                                   UIAlertAction(title: "New Game",
                                                 style: .default,
                                                 handler: { _ in
                                                    vc.isNewGame = true
                                                    self.navigationController?.pushViewController(vc, animated: true)
                                                 }))
        } else {
            vc.isNewGame = true
            self.navigationController?.pushViewController(vc, animated: true)
        }
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
