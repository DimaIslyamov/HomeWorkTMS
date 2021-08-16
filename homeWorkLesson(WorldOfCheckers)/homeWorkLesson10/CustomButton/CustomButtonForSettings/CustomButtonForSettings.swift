//
//  CustomButtonForSettings.swift
//  homeWorkLesson10
//
//  Created by Moobat on 16.08.21.
//

import UIKit

protocol CustomButtonForSettingsDelegate: AnyObject {
    func buttonDidTap(_ sender: CustomButtonForSettings)
}

class CustomButtonForSettings: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var settingsLable: UILabel!
    
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

    
    weak var delegate: CustomButtonForSettingsDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupCostamizationForButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupCostamizationForButton()
    }
    
    private func setupView() {
        Bundle(for: CustomButtonForSettings.self).loadNibNamed("CustomButtonForSettings", owner: self, options: nil)
        contentView.frame = self.bounds
        self.addSubview(contentView)
    }
    
    private func setupCostamizationForButton() {
        settingsLable.layer.shadowColor = UIColor.black.cgColor
        settingsLable.layer.shadowRadius = 3
        settingsLable.layer.shadowOpacity = 0.9
        settingsLable.layer.shadowOffset = CGSize(width: 5, height: 5)
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        delegate?.buttonDidTap(self)
    }
    
}
