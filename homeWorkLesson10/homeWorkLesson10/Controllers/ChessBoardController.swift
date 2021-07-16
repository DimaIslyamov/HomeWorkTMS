//
//  ChessBoardController.swift
//  homeWorkLesson10
//
//  Created by Moobat on 13.07.21.
//

import UIKit

class ChessBoardController: UIViewController {
    
    let viewDesk = UIView(frame: CGRect(x: 0, y: 249, width: 414, height: 400))
    let checers = CGRect(x: 10, y: 10, width: 20, height: 20)
    
    let rows = 8
    let columns = 8
    
    var currentView: UIView? = nil
    var defualtOrigin: CGPoint = .zero
    
    var array = [UIView]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllerBackground()
        createDesk()
        
        view.addSubview(viewDesk)
    }
    

    func createDesk() {
        for row in 0...rows - 1 {
            for column in 0...columns - 1 {
                let deask = UIView(frame: CGRect(x: row * 50,
                                                 y: column * 50,
                                                 width: 50 ,
                                                 height: 50))
                viewDesk.addSubview(deask)
                
                if (row + column) % 2 == 0 {
                    deask.backgroundColor = .white
                } else {
                    deask.backgroundColor = .black
                    
                    let view4 = UIView(frame: checers)
                    array.append(view4)
                    panGestureAdd(checer: view4)
                    
                    if (column < 3) {
                        view4.backgroundColor = .brown
                        deask.addSubview(view4)
                        
                    } else if (column > 4) {
                        view4.backgroundColor = .systemGray
                        deask.addSubview(view4)
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
        let location = sender.location(in: viewDesk)
        let translation = sender.translation(in: viewDesk)

        
            switch sender.state {
            case .began:
                array.forEach { checer in
                    if checer.convert(checer.frame,
                                      to: viewDesk).contains(location) {
                    currentView = checer
                    defualtOrigin = checer.frame.origin
                    }
                }
                print("Began")
                
            case .changed:
                guard currentView != nil else { return }
                currentView?.frame.origin = CGPoint(x: defualtOrigin.x + translation.x,
                                                    y: defualtOrigin.y + translation.y)
                print("Changed")
                
            case .ended:
                currentView = nil
                print("Ended")
                
            default:
                break
            }
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










