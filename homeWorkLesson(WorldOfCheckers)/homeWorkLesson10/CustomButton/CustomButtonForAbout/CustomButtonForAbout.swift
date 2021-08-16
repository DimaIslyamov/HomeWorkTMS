//
//  CustomButtonForAbout.swift
//  homeWorkLesson10
//
//  Created by Moobat on 16.08.21.
//

import UIKit

protocol CustomButtonForAboutDelegate: AnyObject {
    func buttonDidTap(_ sender: CustomButtonForAbout)
}

class CustomButtonForAbout: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var aboutImageView: UIImageView!
    
    @IBInspectable var cornerRadius: CGFloat {
        set { self.layer.cornerRadius = newValue }
        get { return self.layer.cornerRadius }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        set { self.layer.borderWidth = newValue }
        get { return self.layer.borderWidth }
    }
    
    @IBInspectable var borderColor: UIColor {
        set { self.layer.borderColor = newValue.cgColor }
        get {
            if let cgColor = self.layer.borderColor {
                return UIColor(cgColor: cgColor)
            }
            return .clear
        }
    }
   
    weak var delegate: CustomButtonForAboutDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        Bundle(for: CustomButtonForAbout.self).loadNibNamed("CustomButtonForAbout", owner: self, options: nil)
        contentView.frame = self.bounds
        self.addSubview(contentView)
    }
    
    
    @IBAction func buttonAction(_ sender: UIButton) {
        delegate?.buttonDidTap(self)
    }

}
