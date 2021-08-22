//
//  CustomButton.swift
//  homeWorkLesson10
//
//  Created by Moobat on 15.08.21.
//

import UIKit

protocol CustomButtonDelegate: AnyObject {
    func buttonDidTap(_ sender: CustomButton)
}

@IBDesignable
class CustomButton: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var buttonOutlet: UILabel!

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
    
    @IBInspectable var isAnimated: Bool = false
    
    @IBInspectable var text: String {
        set { self.buttonOutlet.text = newValue }
        get { return self.buttonOutlet.text ?? "" }
    }
    
    weak var delegate: CustomButtonDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        creatAnimationIfNeeded()
    }
    
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
        Bundle(for: CustomButton.self).loadNibNamed("CustomButton", owner: self, options: nil)
        contentView.frame = self.bounds
        self.addSubview(contentView)
    }
    
    private func setupCostamizationForButton() {
        buttonOutlet.layer.shadowColor = UIColor.black.cgColor
        buttonOutlet.layer.shadowRadius = 3
        buttonOutlet.layer.shadowOpacity = 0.9
        buttonOutlet.layer.shadowOffset = CGSize(width: 5, height: 5)
    }
    
    private func creatAnimationIfNeeded() {
        guard isAnimated else { return }
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.repeat, .autoreverse]) {
            self.contentView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }
    }
    
    @IBAction func bottonAction(_ sender: UIButton) {
        delegate?.buttonDidTap(self)
    }
}
