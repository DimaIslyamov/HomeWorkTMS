//
//  RootViewController.swift
//  homeWorkLesson10
//
//  Created by Moobat on 13.07.21.
//

import UIKit

class RootViewController: UIViewController {
    
    @IBOutlet weak var newGameButton: CustomButton!
    @IBOutlet weak var scoreButton: CustomButtonForScore!
    @IBOutlet weak var settingButton: CustomButtonForSettings!
    @IBOutlet weak var aboutButton: CustomButtonForAbout!
    
    
    let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    var saveTimerCheckers: CellCheckers = CellCheckers()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newGameButton.delegate = self
        scoreButton.delegate = self
        settingButton.delegate = self
        aboutButton.delegate = self
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.view.removeBlurView()
    }
    
    
}





// MARK: - Extension

extension RootViewController: CustomButtonDelegate {
    func buttonDidTap(_ sender: CustomButton) {
        
        guard let vc = getViewController(from: "ChessBoard") as? ChessBoardController  else { return }
        
        presentAlertController(with: nil, massage: "Начать новую партию или продолжить старую?", actions: UIAlertAction(title: "Продолжить партию", style: .default, handler: { _ in
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
                  
         UIAlertAction(title: "Начать новую партию", style: .default, handler: { _ in
              vc.removeDataFromUserDefaults()
              vc.createTimer()
              vc.createChessboard()
            self.navigationController?.pushViewController(vc, animated: true)
        }))
    }
}


extension RootViewController: CustomButtonForScoreDelegate {
    func buttonDidTap(_ sender: CustomButtonForScore) {
        guard let vc = getViewController(from: "Score") else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


extension RootViewController: CustomButtonForSettingsDelegate {
    func buttonDidTap(_ sender: CustomButtonForSettings) {
        guard let vc = getViewController(from: "Settings") else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


extension RootViewController: CustomButtonForAboutDelegate {
    func buttonDidTap(_ sender: CustomButtonForAbout) {
        guard let vc = getViewController(from: "About") else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
