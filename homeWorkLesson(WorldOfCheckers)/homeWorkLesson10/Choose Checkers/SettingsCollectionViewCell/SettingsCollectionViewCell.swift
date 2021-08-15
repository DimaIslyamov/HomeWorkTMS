//
//  SettingsCollectionViewCell.swift
//  homeWorkLesson10
//
//  Created by Moobat on 12.08.21.
//

import UIKit

class SettingsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var darkImage: UIImageView!
    @IBOutlet weak var lightImage: UIImageView!
    @IBOutlet weak var chooseChecker: UISwitch!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
//        imageBlackChecker.image = UIImage(named: "ArtasArmi")
//        imageWhiteChecker.image = UIImage(named: "ElidanArmi")
    }

    
}
