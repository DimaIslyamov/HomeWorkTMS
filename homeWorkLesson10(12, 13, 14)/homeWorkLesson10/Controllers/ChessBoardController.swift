//
//  ChessBoardController.swift
//  homeWorkLesson10
//
//  Created by Moobat on 13.07.21.
//

import UIKit

class ChessBoardController: UIViewController {
    
    // MARK: - Переменные
    
    var chessboard = UIImageView()
    var timerCount: Int = 1
    var timer: Timer?
    var timerLable = UILabel()
    var isLong = false
    
    
    // MARK: - Жизненный цикл
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        timerLable.text = "Time in Game: 0"
        view.addSubview(timerLable)
        view.addSubview(chessboard)
        createChessboard()
        createLableAndTimer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBar.isHidden = true
        
        timer?.invalidate()
        timer = nil
    }
    
    
    // MARK: - Методы
    
    func createChessboard() {
        
        // констрэйнты для доски
        chessboard.translatesAutoresizingMaskIntoConstraints = false
        chessboard.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        chessboard.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        chessboard.widthAnchor.constraint(equalToConstant: 320).isActive = true
        chessboard.heightAnchor.constraint(equalToConstant: 320).isActive = true
        
        // тени для доски
        chessboard.layer.shadowColor = UIColor.black.cgColor
        chessboard.layer.shadowRadius = 7
        chessboard.layer.shadowOpacity = 0.9
        chessboard.layer.shadowOffset = CGSize(width: 10, height: 10)
        
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
                column.addSubview(checker)
                
                let tapGesture = UILongPressGestureRecognizer(target: self, action: #selector(tapGesture(_:)))
                let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:)))
                tapGesture.delegate = self
                panGesture.delegate = self
                checker.addGestureRecognizer(tapGesture)
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
        timerLable.bottomAnchor.constraint(equalTo: chessboard.bottomAnchor, constant: 90).isActive = true
        timerLable.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        timerLable.textAlignment = .center
        
        // создание таймера
        //        timer = Timer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common)
    }
    
    
    
    func timeFormatter(_ tottalSecond: Int) -> String {
        let second: Int = tottalSecond % 60
        let minutes: Int = (tottalSecond / 60) % 60
        return String(format: "%02d:%02d", minutes, second)
    }
    
    
    
    
    // MARK: - Objc Методы
    
    
    @objc func timerFunc() {
        timerLable.attributedText = NSAttributedString(string: "Time in Game \(timeFormatter(timerCount))", attributes: [.foregroundColor : UIColor.black,
            .font : UIFont(name: "StyleScript-Regular", size: 35) ?? UIFont.systemFont(ofSize: 35)])
        
        if timerCount != 0 {
            timerCount += 1
        }
    }
    
    
    
    @objc func tapGesture(_ sender: UILongPressGestureRecognizer) {
        guard !isLong else { return }
        isLong = true
        
        UIView.animate(withDuration: 0.3) {
            sender.view?.transform = self.view.transform.scaledBy(x: 2.3, y: 2.3)
        }
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
            UIView.animate(withDuration: 0.3) {
                sender.view?.transform = .identity
            }
            isLong = false
            
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



// MARK: - Расширение UIGestureRecognizer


extension ChessBoardController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}