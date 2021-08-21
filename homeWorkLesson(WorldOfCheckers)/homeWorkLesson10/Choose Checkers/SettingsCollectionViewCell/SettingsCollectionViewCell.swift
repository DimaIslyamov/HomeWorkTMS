//
//  SettingsCollectionViewCell.swift
//  homeWorkLesson10
//
//  Created by Moobat on 12.08.21.
//

import UIKit

class SettingsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var checkerImageView: UIImageView!
    @IBOutlet weak var checkerSelectedImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        checkerImageView.image = checkerSelectedImageView.image?.withRenderingMode(.alwaysTemplate)
        checkerSelectedImageView.isHidden = true
    }

    func setupImageForCheckers(checkerImage: UIImage) {
        checkerImageView.image = checkerImage
        checkerImageView.contentMode = .scaleAspectFit
    }
}
