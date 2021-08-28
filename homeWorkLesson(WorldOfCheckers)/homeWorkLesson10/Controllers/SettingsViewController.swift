//
//  SettingsViewController.swift
//  homeWorkLesson10
//
//  Created by Moobat on 21.07.21.
//

import UIKit

class SettingsViewController: UIViewController  {
    
    @IBOutlet weak var buttonViews: UIView!
    @IBOutlet weak var buttonOutlet: UIButton!
    @IBOutlet weak var collectionViewA: UICollectionView!
    @IBOutlet weak var collectionViewB: UICollectionView!
    
    var arrayOfBlackCheckersImage = ["ArtasArmi", "ElidanArmi", "PaladinArmi", "nerzulArmi", "ordaArmi", "ximikArmi"]
    var arrayOfWhiteCheckersImage = ["elfeArmi", "gnomArmi", "pandaArmi", "darkElfeArmi", "somthingArmi", "warrorsArmi"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewA.dataSource = self
        collectionViewA.delegate = self
        collectionViewA.register(UINib(nibName: "SettingsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SettingsCollectionViewCell")
        
        collectionViewB.dataSource = self
        collectionViewB.delegate = self
        collectionViewB.register(UINib(nibName: "WhiteCheckersCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "WhiteCheckersCollectionViewCell")
        
        backButtonCostamization()
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
    
    
    private func backButtonCostamization() {
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
}
