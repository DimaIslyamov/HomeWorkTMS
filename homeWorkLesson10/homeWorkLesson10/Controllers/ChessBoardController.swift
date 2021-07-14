//
//  ChessBoardController.swift
//  homeWorkLesson10
//
//  Created by Moobat on 13.07.21.
//

import UIKit

class ChessBoardController: UIViewController {

    let mainView = UIView(frame: CGRect(x: 35, y: 260, width: 320 , height: 320))
    let checers = CGRect(x: 10, y: 10, width: 20, height: 20)
    
    var currentView: UIView? = nil
    var defualtOrigin: CGPoint = .zero
    var array = [UIView]()
    
    let rows = 8
    let columns = 8
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(mainView)
        viewControllerBackground()
        cheesBoard()
//        createDesk()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:)))
        mainView.addGestureRecognizer(panGesture)
    }
    

//    func createDesk() {
//        let viewDesk = UIView(frame: CGRect(x: 0, y: (view.frame.midY) - (view.frame.width) / 2, width: view.frame.width, height: view.frame.width))
//
//        viewDesk.backgroundColor = .white
//        viewDesk.autoresizingMask = .flexibleLeftMargin
//        viewDesk.autoresizingMask = .flexibleRightMargin
//        viewDesk.autoresizingMask = .flexibleTopMargin
//        viewDesk.autoresizingMask = .flexibleBottomMargin
//        view.addSubview(viewDesk)
//
//    }
    
    func cheesBoard() {
        for row in 0...rows - 1 {
            for column in 0...columns - 1 {
                let view = UIView(frame: CGRect(x: row * 40, y: column * 40, width: 40 , height: 40))
                mainView.addSubview(view)
                
                if (row + column) % 2 == 0 {
                    view.backgroundColor = .white
                    
                } else {
                    view.backgroundColor = .black
                    
                    let view4 = UIView(frame: checers)
                    array.append(view4)
                    panGestureAdd(checer: view4)
                    
                    if (column < 3) {
                        view4.backgroundColor = .brown
                        view.addSubview(view4)
                        
                    } else if (column > 4) {
                        view4.backgroundColor = .systemGray
                        view.addSubview(view4)
                    }
                    
                }
            }
        }
        
    }

    
    
    func panGestureAdd(checer: UIView) {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:)))
        checer.addGestureRecognizer(panGesture)
    }
    
    @objc func panGesture(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: view)
        let translation = sender.translation(in: view)
    }

}



// MARK: - Extension

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
