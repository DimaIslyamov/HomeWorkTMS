//
//  SettingsViewController.swift
//  homeWorkLesson10
//
//  Created by Moobat on 21.07.21.
//

import UIKit


enum Language: Int {
    case english = 0
    case russian = 1
    case polish = 2
}


class SettingsViewController: UIViewController  {
    
    @IBOutlet weak var buttonViews: UIView!
    @IBOutlet weak var buttonOutlet: UIButton!
    @IBOutlet weak var collectionViewA: UICollectionView!
    @IBOutlet weak var collectionViewB: UICollectionView!
    @IBOutlet weak var languageControl: UISegmentedControl!
    @IBOutlet weak var soundLable: UILabel!
    @IBOutlet weak var backgroundReplacementLable: UILabel!
    @IBOutlet weak var chooseBlackCheckersLable: UILabel!
    @IBOutlet weak var chooseWhiteCheckersLable: UILabel!
    
    
    var arrayOfBlackCheckersImage = ["ArtasArmi", "ElidanArmi", "PaladinArmi", "nerzulArmi", "ordaArmi", "ximikArmi"]
    var arrayOfWhiteCheckersImage = ["elfeArmi", "gnomArmi", "pandaArmi", "darkElfeArmi", "somthingArmi", "warrorsArmi"]
    
    var lCodes: [String] = ["en", "ru", "pl"]
    
    var currentLanguage: Language = .english {
        didSet {
            switch self.currentLanguage {
            case .english: SettingManager.shared.currentLanguageCode = "en"
            case .russian: SettingManager.shared.currentLanguageCode = "ru"
            case .polish: SettingManager.shared.currentLanguageCode = "pl"
            }
            
            localaized()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewA.dataSource = self
        collectionViewA.delegate = self
        collectionViewA.register(UINib(nibName: "SettingsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SettingsCollectionViewCell")
        
        collectionViewB.dataSource = self
        collectionViewB.delegate = self
        collectionViewB.register(UINib(nibName: "WhiteCheckersCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "WhiteCheckersCollectionViewCell")
        
        if let indexCode = lCodes.firstIndex(of: SettingManager.shared.currentLanguageCode) {
            languageControl.selectedSegmentIndex = indexCode
            currentLanguage = Language(rawValue: indexCode) ?? .english
        }
        
        backButtonCostamization()
    }
    
    
    
    func localaized() {
        buttonOutlet.setTitle("Back_buuton_text".localaized, for: .normal)
        soundLable.text = "Sound_off/on_text".localaized
        backgroundReplacementLable.text = "Background replacement_text".localaized
        chooseBlackCheckersLable.text = "Choose Black Checkers_text".localaized
        chooseWhiteCheckersLable.text = "Choose White Checkers_text".localaized
    }
    
    
    
    private func selectChooseMedia() {
        let picker = UIImagePickerController()
        picker.delegate = self
        presentAlertController(with: nil,
                               massage: nil,
                               preferredStyle: .actionSheet,
                               actions: UIAlertAction(title: "Camera",
                                                      style: .default,
                                                      handler: { _ in
                                                        /*
                                                        #if targetEnvironment(simulator)
                                                        print("Error, no camera!")
                                                        #else
                                                        picker.sourceType = .camera
                                                        self.present(picker, animated: true, completion: nil)
                                                        */
                                                        self.view.removeBlurView()
                                                      }),
                               UIAlertAction(title: "Media",
                                             style: .default,
                                             handler: { _ in
                                                picker.sourceType = .photoLibrary
                                                self.present(picker, animated: true, completion: nil)
                                                self.view.removeBlurView()
                                             }))
        
    }
    
    
     func backButtonCostamization() {
        buttonViews.layer.cornerRadius = 12
        buttonViews.layer.shadowColor = UIColor.black.cgColor
        buttonViews.layer.shadowRadius = 4
        buttonViews.layer.shadowOpacity = 0.9
        buttonViews.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        buttonOutlet.layer.borderWidth = 2
        buttonOutlet.layer.borderColor = UIColor.black.cgColor
        buttonOutlet.layer.cornerRadius = 12
    }
    
    @IBAction func backgraoundReplasmentAction(_ sender: UIButton) {
        selectChooseMedia()
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func chengeLocalaiz(_ sender: UISegmentedControl) {
        guard let selectedLanguage = Language(rawValue: sender.selectedSegmentIndex),
              selectedLanguage != currentLanguage  else { return }
        currentLanguage = selectedLanguage
    }
}
