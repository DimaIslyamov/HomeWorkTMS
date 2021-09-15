//
//  UIView+CoreKit.swift
//  homeWorkLesson23(WheatherAndNews)
//
//  Created by Moobat on 6.09.21.
//

import UIKit

extension UIView {
    func addBlurView() {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.frame = bounds
        blurredEffectView.tag = 101
        addSubview(blurredEffectView)
    }
    
    func removeBlurView() {
        self.subviews.first(where: {$0.tag == 101})?.removeFromSuperview()
    }
}
