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
        presentAlertController(with: nil, massage: "Continue or start a New Game ?",
                  actions: UIAlertAction(title: "Continue", style: .default, handler: { _ in
              vc.getLastBatch()
              vc.setDataFromUserDefaults()
              vc.createTimer()
              vc.createSaveChessboard()
                 do {
         let fileURL = self.documentDirectory.appendingPathComponent(Keys.cellAndChecker.rawValue)
          try FileManager.default.removeItem(at: fileURL)
                 } catch {
                     print("error")
                  vc.cellCheckers.removeAll()
                 }
           self.navigationController?.pushViewController(vc, animated: true)
        }),
                  
         UIAlertAction(title: "New Game", style: .default, handler: { _ in
              vc.removeDataFromUserDefaults()
              vc.createTimer()
              vc.createChessboard()
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
