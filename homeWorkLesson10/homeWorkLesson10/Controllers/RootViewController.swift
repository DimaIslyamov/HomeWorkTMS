//
//  RootViewController.swift
//  homeWorkLesson10
//
//  Created by Moobat on 13.07.21.
//

import UIKit

class RootViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chess Board"
        viewControllerBackground()
        createButton()
    }
    
    
    
    func getViewController(from id: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "ChessBoard", bundle: nil)
        let currentVC = storyboard.instantiateViewController(withIdentifier: id)
        currentVC.modalPresentationStyle = .fullScreen
        currentVC.modalTransitionStyle = .crossDissolve
        return currentVC
    }

    
    @objc func buttonTapped(_ sender: UIButton) {
        navigationController?.pushViewController(getViewController(from: "chessBoardVC"), animated: true)
    }
}



// MARK: - Extension

extension RootViewController {
    func createButton() {
        let buttonToCheasBorad = UIButton(frame: CGRect(x: 100,
                                                        y: 400,
                                                        width: 190,
                                                        height: 40))
        
        buttonToCheasBorad.setTitle("Get Started", for: .normal)
        buttonToCheasBorad.layer.borderWidth = 1
        buttonToCheasBorad.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        buttonToCheasBorad.backgroundColor = .clear
        buttonToCheasBorad.layer.cornerRadius = 12
        buttonToCheasBorad.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        view.addSubview(buttonToCheasBorad)
        
        
    }
    
    
    func viewControllerBackground() {
        let rootViewColor = UIColor(displayP3Red: 110/255,
                                    green: 80/255,
                                    blue: 180/255,
                                    alpha: 1).cgColor
        let rootViwColorTwo = UIColor(displayP3Red: 20/255,
                                      green: 160/255,
                                      blue: 160/255,
                                      alpha: 1).cgColor
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [rootViewColor, rootViwColorTwo]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1.0)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
