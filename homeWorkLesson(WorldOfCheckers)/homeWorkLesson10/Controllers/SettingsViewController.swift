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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "SettingsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SettingsCollectionViewCell")
        
        backButtonCostamization()
    }
    
    private func selectChooseMedia() {
        let picker = UIImagePickerController()
        presentAlertController(with: nil,
                               massage: nil,
                               preferredStyle: .actionSheet,
                               actions: UIAlertAction(title: "Camera",
                                                      style: .default,
                                                      handler: { _ in
                                                        
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
}



// MARK: - Extension

extension SettingsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SettingsCollectionViewCell", for: indexPath) as? SettingsCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
}

extension SettingsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 197, height: 129)
    }
}
