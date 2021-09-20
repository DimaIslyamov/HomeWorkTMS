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
    
    @IBInspectable var text: String {
        set { self.playerLable.text = newValue }
        get { return self.playerLable.text ?? "" }
    }
    
    private func setupView() {
        Bundle(for: CustomLable.self).loadNibNamed("CustomLable", owner: self, options: nil)
        contentView.frame = self.bounds
        self.addSubview(contentView)
    }
}
