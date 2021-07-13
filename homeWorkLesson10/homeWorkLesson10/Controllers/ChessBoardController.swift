//
//  ChessBoardController.swift
//  homeWorkLesson10
//
//  Created by Moobat on 13.07.21.
//

import UIKit

class ChessBoardController: UIViewController {

    let view1 = UIView(frame: CGRect(x: 35, y: 260, width: 320 , height: 320))
    let rows = 8
    let columns = 8
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGreen
        view.addSubview(view1)
        viewControllerBackground()
        cheesBoard()
    }
    

    func cheesBoard() {
        for row in 0...rows - 1 {
            for column in 0...columns - 1 {
                let view = UIView(frame: CGRect(x: row * 40, y: column * 40, width: 40 , height: 40))
                view1.addSubview(view)
                if (row + column) % 2 == 0 {
                    view.backgroundColor = .white
                } else {
                    view.backgroundColor = .black
                }
            }
        }
    }

}

extension ChessBoardController {
    func viewControllerBackground() {
        let rootViewColor = UIColor(displayP3Red: 20/255,
                                    green: 100/255,
                                    blue: 100/255,
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
