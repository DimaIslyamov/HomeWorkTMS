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



// MARK: - Extension

extension SettingsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewA {
            return arrayOfBlackCheckersImage.count
        }
        return arrayOfWhiteCheckersImage.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        if collectionView == collectionViewA {
            guard let cellA = collectionViewA.dequeueReusableCell(withReuseIdentifier: "SettingsCollectionViewCell", for: indexPath) as? SettingsCollectionViewCell else { return UICollectionViewCell()}
            if UserDefaults.standard.string(forKey: Keys.checkerImageBlack.rawValue) == arrayOfBlackCheckersImage[indexPath.row] {
                cellA.checkerSelectedImageView.isHidden = false
            }
            cellA.setupImageForCheckers(checkerImage: UIImage(named: arrayOfBlackCheckersImage[indexPath.row]) ?? UIImage())
            
            return cellA
            
        } else if collectionView == collectionViewB {
            guard let cellB = collectionViewB.dequeueReusableCell(withReuseIdentifier: "WhiteCheckersCollectionViewCell", for: indexPath) as? WhiteCheckersCollectionViewCell else { return UICollectionViewCell()}
            if UserDefaults.standard.string(forKey: Keys.checkerImageWhite.rawValue) == arrayOfWhiteCheckersImage[indexPath.row] {
                cellB.checkerSelectedImageView.isHidden = false
            }
            cellB.setupImageForCheckers(checkerImage: UIImage(named: arrayOfWhiteCheckersImage[indexPath.row]) ?? UIImage())
            
            return cellB
        }
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.collectionViewA {
            
            UserDefaults.standard.setValue(arrayOfBlackCheckersImage[indexPath.row], forKey: Keys.checkerImageBlack.rawValue)
            collectionView.visibleCells.forEach { cell in
                (cell as? SettingsCollectionViewCell)?.checkerSelectedImageView.isHidden = true
            }
            guard let cellA = collectionView.cellForItem(at: indexPath) as? SettingsCollectionViewCell else { return }
            cellA.checkerSelectedImageView.isHidden = false
            
        } else if collectionView == self.collectionViewB {
            
            UserDefaults.standard.setValue(arrayOfWhiteCheckersImage[indexPath.row], forKey: Keys.checkerImageWhite.rawValue)
            collectionView.visibleCells.forEach { cell in
                (cell as? WhiteCheckersCollectionViewCell)?.checkerSelectedImageView.isHidden = true
            }
            guard let cellB = collectionView.cellForItem(at: indexPath) as? WhiteCheckersCollectionViewCell else { return }
            cellB.checkerSelectedImageView.isHidden = false
        }
    }
}


extension SettingsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 132, height: 117)
    }
}


extension SettingsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let documentDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentDirectoryURL.appendingPathComponent("saveBackraound")
        try? FileManager.default.removeItem(at: fileURL)
        
        guard let image = info[.originalImage] else { return }
        
        let data = try? NSKeyedArchiver.archivedData(withRootObject: image, requiringSecureCoding: true)
        try? data?.write(to: fileURL)
        
        picker.dismiss(animated: true, completion: nil)
    }
}
