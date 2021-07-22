//
//  ChessBoardController.swift
//  homeWorkLesson10
//
//  Created by Moobat on 13.07.21.
//

import UIKit

class ChessBoardController: UIViewController {
    
    var chessboard = UIImageView()
    
    var timerCount: Int = 0
    var timer: Timer?
    var timerLable = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(timerLable)
        view.addSubview(chessboard)
        createChessboard()
        createLableAndTimer()
    }
    
    // сделал во время перерыва =)
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        timer?.invalidate()
        timer = nil
    }
    
    
    
    func createChessboard() {
        // констрэйнты для доски
        chessboard.translatesAutoresizingMaskIntoConstraints = false
        chessboard.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        chessboard.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        chessboard.widthAnchor.constraint(equalToConstant: 320).isActive = true
        chessboard.heightAnchor.constraint(equalToConstant: 320).isActive = true
        
        // код мастера(сансэя)
        for i in 0..<8 {
            for j in 0..<8 {
                let column = UIView(frame: CGRect(x: 40 * i, y: 40 * j, width: 40, height: 40))
                column.backgroundColor = ((i + j) % 2) == 0 ? .clear : .black
                chessboard.addSubview(column)
                
                guard j < 3 || j > 4, column.backgroundColor == .black else { continue }
                
                let checker = UIImageView(frame: CGRect(x: 5, y: 5, width: 30, height: 30))
                checker.isUserInteractionEnabled = true
                checker.image = j < 3 ? UIImage(named: "chessBlack") : UIImage(named: "chessWhite")
//                checker.backgroundColor = j < 3 ? .white : .lightGray
//                checker.layer.cornerRadius = checker.bounds.size.width / 2.0
                column.addSubview(checker)
                
                let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:)))
                checker.addGestureRecognizer(panGesture)
            }
        }
        
        chessboard.image = UIImage(named: "chessDesk")
        chessboard.isUserInteractionEnabled = true
    }
    
    
    
    func createLableAndTimer() {
        // констрэйнты для лэйбла
        timerLable.translatesAutoresizingMaskIntoConstraints = false
        timerLable.leftAnchor.constraint(equalTo: chessboard.leftAnchor).isActive = true
        timerLable.rightAnchor.constraint(equalTo: chessboard.rightAnchor).isActive = true
        timerLable.bottomAnchor.constraint(equalTo: chessboard.bottomAnchor, constant: 30).isActive = true
        timerLable.heightAnchor.constraint(equalToConstant: 40).isActive = true
        // настройки для лэйбла
        timerLable.textColor = .white
        timerLable.textAlignment = .center
        timerLable.font = UIFont(name: "Futura", size: 15)
        // создание таймера
        timer = Timer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        
        RunLoop.main.add(timer!, forMode: .common)
    }
    
    
    
    @objc func timerFunc() {
        timerCount += 1
        timerLable.text = "Time in Game: \(timerCount)"
    }
    
    
    
    @objc func panGesture(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: chessboard)
        let translation = sender.translation(in: chessboard)

        switch sender.state {
        case .changed:
            guard let column = sender.view?.superview, let cellOrigin = sender.view?.frame.origin else { return }
            chessboard.bringSubviewToFront(column)
            sender.view?.frame.origin = CGPoint(x: cellOrigin.x + translation.x,
                                                y: cellOrigin.y + translation.y)
            
            sender.setTranslation(.zero, in: chessboard)
        case .ended:
            let currentCell = chessboard.subviews.first(where: {$0.frame.contains(location) && $0.backgroundColor == .black })
            
            sender.view?.frame.origin = CGPoint(x: 5, y: 5)
            guard let newCell = currentCell, newCell.subviews.isEmpty, let cell = sender.view else {
                return
            }
            
            currentCell?.addSubview(cell)
        default: break
        }
    }
    

}
