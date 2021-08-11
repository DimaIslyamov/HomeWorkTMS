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
    var saveTimerCheckers: SaveTimerAndCheckers = SaveTimerAndCheckers()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getTimerAndCheckers()
        
        view.addSubview(getStartedButton)
        view.addSubview(scoreButton)
        view.addSubview(settingsButton)
        view.addSubview(aboutButton)
        
        buttonCustomization()
        createButtonConstraint()
    }
    
    
    func getTimerAndCheckers() {
        let fileURL = documentDirectory.appendingPathComponent("timer_chekers")
        guard let data = FileManager.default.contents(atPath: fileURL.absoluteString.replacingOccurrences(of: "file://", with: "")) else { return }
        
        do {
            guard let object = try NSKeyedUnarchiver.unarchivedObject(ofClass: SaveTimerAndCheckers.self, from: data) else { return }
            self.saveTimerCheckers = object
        } catch(let a) {
            print(a)
        }
    }
    
    
    @objc func startTheGameTapped(_ sender: UIButton) {
        guard let vc = getViewController(from: "ChessBoard") else { return }
        presentAlertController(with: nil,
                               massage: "Start a nawe Game, or continue?",
                               actions: UIAlertAction(title: "Continue",
                                                      style: .default,
                                                      handler: { _ in
                                                        self.getTimerAndCheckers()
                                                        self.navigationController?.pushViewController(vc, animated: true)
                                                      }),
                               
                               UIAlertAction(title: "New Game",
                                             style: .default,
                                             handler: { _ in
                                                UserDefaults.standard.removeObject(forKey: KeysUserDefaults.timerT.rawValue)
                                                self.navigationController?.pushViewController(vc, animated: true)
                                             }))
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
