//
//  SettingViewController+Extension.swift
//  homeWorkLesson10
//
//  Created by Moobat on 28.08.21.
//

import UIKit

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
            if SettingManager.shared.saveBlackChecker == arrayOfBlackCheckersImage[indexPath.row] {
                cellA.checkerSelectedImageView.isHidden = false
            }
            cellA.setupImageForCheckers(checkerImage: UIImage(named: arrayOfBlackCheckersImage[indexPath.row]) ?? UIImage())
            
            return cellA
            
        } else if collectionView == collectionViewB {
            guard let cellB = collectionViewB.dequeueReusableCell(withReuseIdentifier: "WhiteCheckersCollectionViewCell", for: indexPath) as? WhiteCheckersCollectionViewCell else { return UICollectionViewCell()}
            if SettingManager.shared.saveWhiteChecker == arrayOfWhiteCheckersImage[indexPath.row] {
                cellB.checkerSelectedImageView.isHidden = false
            }
            cellB.setupImageForCheckers(checkerImage: UIImage(named: arrayOfWhiteCheckersImage[indexPath.row]) ?? UIImage())
            
            return cellB
        }
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.collectionViewA {
            // ??? settingManager
            UserDefaults.standard.setValue(arrayOfBlackCheckersImage[indexPath.row], forKey: Keys.checkerImageBlack.rawValue)
            collectionView.visibleCells.forEach { cell in
                (cell as? SettingsCollectionViewCell)?.checkerSelectedImageView.isHidden = true
            }
            guard let cellA = collectionView.cellForItem(at: indexPath) as? SettingsCollectionViewCell else { return }
            cellA.checkerSelectedImageView.isHidden = false
            
        } else if collectionView == self.collectionViewB {
            // ??? settingManager
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
        
        guard let image = info[.originalImage] else { return }
        SettingManager.shared.saveBackgroundForCheckerViewController = image
        
        picker.dismiss(animated: true, completion: nil)
    }
    
}
