//
//  WhiteCheckersCollectionViewCell.swift
//  homeWorkLesson10
//
//  Created by Moobat on 21.08.21.
//

import UIKit

class WhiteCheckersCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var checkerImageView: UIImageView!
    @IBOutlet weak var checkerSelectedImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        checkerImageView.image = checkerSelectedImageView.image?.withRenderingMode(.alwaysTemplate)
        checkerSelectedImageView.isHidden = true
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        checkerSelectedImageView.isHidden = true
    }

    
    func setupImageForCheckers(checkerImage: UIImage) {
        checkerImageView.image = checkerImage
        checkerImageView.contentMode = .scaleAspectFit
    }

}
