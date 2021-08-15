//
//  CustomButton.swift
//  homeWorkLesson10
//
//  Created by Moobat on 15.08.21.
//

import UIKit

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
    
    private var isAnimated_: Bool = false
    
    @IBInspectable var isAnimated: Bool {
        get {
            isAnimated_ = newValue
        } set {
            return isAnimated_
        }
    }
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        Bundle(for: CustomButton.self).loadNibNamed("CustomButton", owner: self, options: nil)
        contentView.frame = self.bounds
        self.addSubview(contentView)
    }
    // func setAttributes(_ attrs: [NSAttributedString.Key : Any]?, range: NSRange)
    private func setupCostamizationForButton() {
        
    }
    
    private func creatAnimation() {
        guard isAnimated else { return }
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.repeat, .autoreverse]) {
            self.contentView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }
    }
    
    @IBAction func bottonAction(_ sender: UIButton) {
        
    }
}
