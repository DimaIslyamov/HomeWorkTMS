//
//  RootViewController.swift
//  homeWorkLesson10
//
//  Created by Moobat on 13.07.21.
//

import UIKit

class RootViewController: UIViewController {
    
    @IBOutlet weak var newGameButton: CustomButton!
    @IBOutlet weak var scoreButton: CustomButton!
    @IBOutlet weak var settingButton: CustomButton!
    @IBOutlet weak var aboutButton: CustomButtonForAbout!
    
    
    let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    var saveTimerCheckers: CellCheckers = CellCheckers()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        newGameButton.delegate = self
        scoreButton.delegate = self
        settingButton.delegate = self
        aboutButton.delegate = self
        
        if UserDefaults.standard.value(forKey: Keys.checkerImageBlack.rawValue) == nil {
            UserDefaults.standard.setValue("ArtasArmi", forKey: Keys.checkerImageBlack.rawValue)
        }
        if UserDefaults.standard.value(forKey: Keys.checkerImageWhite.rawValue) == nil {
            UserDefaults.standard.setValue("somthingArmi", forKey: Keys.checkerImageWhite.rawValue)
        }
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        localaized()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.view.removeBlurView()
    }
    
    
    
    func localaized() {
        newGameButton.text = "Start Game_text".localaized
        scoreButton.text = "Score_button_text".localaized
        settingButton.text = "Settings_button_text".localaized
    }
}



// MARK: - Extension

extension RootViewController: CustomButtonDelegate {
    func buttonDidTap(_ sender: CustomButton) {
        switch sender {
        case newGameButton:
            guard let vc = getViewController(from: "ChessBoard") as? ChessBoardController  else { return }
            presentAlertController(with: nil,
                                   massage: "Начать новую партию или продолжить старую?",
                                   preferredStyle: .alert,
                                   actions: UIAlertAction(title: "Продолжить партию",
                                                          style: .default,
                                                          handler: { _ in
                                                            vc.cellCheckers = SettingManager.shared.saveCellsCheckers
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

                                   UIAlertAction(title: "Начать новую партию",
                                                 style: .default,
                                                 handler: { _ in
                                                    vc.removeDataFromUserDefaults()
                                                    vc.createTimer()
                                                    vc.createChessboard()
                                                    self.navigationController?.pushViewController(vc, animated: true)
                                                    vc.openAlertForPlayersName()
                                                 }))
        case scoreButton:
            guard let vc = getViewController(from: "Score") else { return }
            self.navigationController?.pushViewController(vc, animated: true)
            
        case settingButton:
            guard let vc = getViewController(from: "Settings") else { return }
            self.navigationController?.pushViewController(vc, animated: true)
        default : break
        }
    }
}


extension RootViewController: CustomButtonForAboutDelegate {
    func buttonDidTap(_ sender: CustomButtonForAbout) {
        guard let vc = getViewController(from: "About") else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
