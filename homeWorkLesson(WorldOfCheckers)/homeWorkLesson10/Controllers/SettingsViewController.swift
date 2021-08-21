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
    @IBOutlet weak var collectionView: UICollectionView!
    
    var arrayOfCheckersImage = ["ArtasArmi", "ElidanArmi", "PaladinArmi"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "SettingsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SettingsCollectionViewCell")
        
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
        return arrayOfCheckersImage.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SettingsCollectionViewCell", for: indexPath) as? SettingsCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.setupImageForCheckers(checkerImage: UIImage(named: arrayOfCheckersImage[indexPath.row]) ?? UIImage())
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        UserDefaults.standard.setValue(arrayOfCheckersImage[indexPath.row], forKey: Keys.checkerImage.rawValue)
    }
    
}


extension SettingsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 137, height: 128)
    }
}


extension SettingsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let story = UIStoryboard(name: "ChessBoard", bundle: nil)
        guard let image = info[.originalImage] as? UIImage,
              let vc = story.instantiateInitialViewController() as? ChessBoardController else { return }
        vc.image = image
        picker.dismiss(animated: true, completion: nil)
    }
}
