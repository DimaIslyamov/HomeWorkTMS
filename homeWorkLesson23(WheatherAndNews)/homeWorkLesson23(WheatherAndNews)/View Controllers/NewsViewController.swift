//
//  NewsViewController.swift
//  homeWorkLesson23(WheatherAndNews)
//
//  Created by Moobat on 6.09.21.
//

import UIKit
import SSBouncyButton

class NewsViewController: UIViewController {
    let bunceButton = SSBouncyButton()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settuoForSSButton()
    }
    
    
    
    func settuoForSSButton() {
        bunceButton.frame = CGRect(x: 50, y: 80, width: 300, height: 30)
        bunceButton.setTitle("Follow", for: .normal)
        bunceButton.setTitle("Following", for: .selected)
        bunceButton.addTarget(self, action: #selector(buttonDidPress(_:)), for: .touchUpInside)
        
        self.view.addSubview(bunceButton)
    }
    
    
    
    @objc func buttonDidPress(_ sender: UIButton) {
        bunceButton.isSelected = !bunceButton.isSelected
    }
}
