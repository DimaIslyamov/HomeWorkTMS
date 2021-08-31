//
//  CustomLable.swift
//  homeWorkLesson10
//
//  Created by Moobat on 30.08.21.
//

import UIKit

class CustomLable: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var playerLable: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        Bundle(for: CustomLable.self).loadNibNamed("CustomLable", owner: self, options: nil)
        contentView.frame = self.bounds
        self.addSubview(contentView)
    }
}
