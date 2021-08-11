//
//  ChessBoardController.swift
//  homeWorkLesson10
//
//  Created by Moobat on 13.07.21.
//

import UIKit


enum Chekers: Int {
    case black = 0
    case white = 1
}


class ChessBoardController: UIViewController {
    
    // MARK: - @OUTLETS
    
    @IBOutlet weak var viewOutlet: UIView!
    @IBOutlet weak var backButtonOutlet: UIButton!
    
    
    // MARK: - Переменные
    
    //    let userDefaults = KeysUserDefaults(rawValue: KeysUserDefaults.timerT.rawValue)
    var saveCheckerss: [Any] = []
    
    let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    var saveTimerCheckers: SaveTimerAndCheckers = SaveTimerAndCheckers()
    
    var chessboard = UIImageView()
    var timerCount: Int = 0
    var timer: Timer?
    var timerLable = UILabel()
    
    var current: Chekers = .black
    
    
    // MARK: - Жизненный цикл
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let timerT = UserDefaults.standard.integer(forKey: KeysUserDefaults.timerT.rawValue)
//        timerCount = timerT
        
//        getTimerAndCheckers()
        
        //        timerCount = saveTimerCheckers.timer
        
        view.addSubview(timerLable)
        view.addSubview(chessboard)
        createChessboard()
        createLableAndTimer()
        backButtonFuncCostamize()
        
        getTimerAndCheckers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
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
                
                let manager = FileManager.default
                if manager.fileExists(atPath: documentDirectory.appendingPathComponent("timer_chekers").path) {
                    saveChecerss()
                }
                
                
                guard j < 3 || j > 4, column.backgroundColor == .black else { continue }
                
                let checker = UIImageView(frame: CGRect(x: 5, y: 5, width: 30, height: 30))
                checker.isUserInteractionEnabled = true
                checker.tag = j < 3 ? 0 : 1
                checker.image = j < 3 ? UIImage(named: "ArtasArmi") : UIImage(named: "ElidanArmi")
                column.addSubview(checker)
                
                let tapGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressGesture(_:)))
                let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:)))
                tapGesture.delegate = self
                panGesture.delegate = self
                checker.addGestureRecognizer(tapGesture)
                checker.addGestureRecognizer(panGesture)
            }
        }
        
        chessboard.image = UIImage(named: "ice7")
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
        timer = Timer(timeInterval: 1.0, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        
        //  создавал таймер который отсчитывт определенное время
        //        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        
        RunLoop.main.add(timer!, forMode: .common)
    }
    
    
    
    func timeFormatter(_ tottalSecond: Int) -> String {
        let second: Int = tottalSecond % 60
        let minutes: Int = (tottalSecond / 60) % 60
        return String(format: "%02d:%02d", minutes, second)
    }
    
    
    func backButtonFuncCostamize() {
        backButtonOutlet.layer.borderWidth = 2
        backButtonOutlet.layer.borderColor = UIColor.black.cgColor
        backButtonOutlet.layer.cornerRadius = 12
        
        viewOutlet.layer.cornerRadius = 12
        viewOutlet.layer.shadowColor = UIColor.black.cgColor
        viewOutlet.layer.shadowRadius = 4
        viewOutlet.layer.shadowOpacity = 0.9
        viewOutlet.layer.shadowOffset = CGSize(width: 5, height: 5)
    }
    
    
    
    
    
    // MARK: - Доделать
    
    func saveChecerss() {
        chessboard.subviews.forEach { cell in
            if !cell.subviews.isEmpty {
                let saveChecers = SaveTimerAndCheckers()
                saveChecers.checkerTag = cell.tag
                cell.subviews.forEach { cher in
                    print("\(String(describing: saveChecers.checkerTag))")
                    saveCheckerss.append(saveChecers)
                }
            }
        }
    }
    
    
    func saveTimerAndCheckers() {
        let data = try? NSKeyedArchiver.archivedData(withRootObject: saveTimerCheckers, requiringSecureCoding: true)
        let fileURL = documentDirectory.appendingPathComponent("timer_chekers")
        try? data?.write(to: fileURL)
    }
    
    func getTimerAndCheckers() {
        let fileURL = documentDirectory.appendingPathComponent("timer_chekers")
        guard let data = FileManager.default.contents(atPath: fileURL.absoluteString.replacingOccurrences(of: "file://", with: "")) else { return }
        
        do {
            guard let object = try NSKeyedUnarchiver.unarchivedObject(ofClass: SaveTimerAndCheckers.self, from: data) else { return }
            self.saveTimerCheckers = object
        } catch(let a) {
            print(a)
        }
    }
    
    func saveDataToUserDefaults() {
        
        
    }
    
    
    func applyDataFromUserDefaults() {
        
        
    }
    
    
    // MARK: - Objc Методы
    
    
    @objc func timerFunc() {
        timerLable.attributedText = NSAttributedString(string: "Time in Game \(timeFormatter(timerCount))", attributes: [.foregroundColor : UIColor.white, .font : UIFont(name: "StyleScript-Regular", size: 35) ?? UIFont.systemFont(ofSize: 35)])
        
        timerCount += 1
        //        if timerCount != 0 {
        //            timerCount -= 1
        //        }
    }
    
    
    
    @objc func longPressGesture(_ sender: UILongPressGestureRecognizer) {
        guard let checker = sender.view else { return }
        
        switch sender.state {
        case .began:
            UIView.animate(withDuration: 0.3) {
                checker.transform = checker.transform.scaledBy(x: 2.7, y: 2.7)
            }
            
        case .ended:
            UIView.animate(withDuration: 0.3) {
                checker.transform = .identity
            }
            
        default : break
        }
        
    }
    
    
    @objc func panGesture(_ sender: UIPanGestureRecognizer) {
        guard sender.view?.tag == current.rawValue else { return }
        
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
            if current == .black {
                current = .white
            } else {
                current = .black
            }
            
            let currentCell = chessboard.subviews.first(where: {$0.frame.contains(location) && $0.backgroundColor == .black })
            
            sender.view?.frame.origin = CGPoint(x: 5, y: 5)
            guard let newCell = currentCell, newCell.subviews.isEmpty, let cell = sender.view else {
                return
            }
            
            currentCell?.addSubview(cell)
            
        default: break
        }
    }
    
    
    /*
     let data = try? NSKeyedArchiver.archivedData(withRootObject: self.saveTimerCheckers.timer ?? "", requiringSecureCoding: true)
     if let data = data {
     UserDefaults.standard.setValue(data, forKey: self.saveTimerCheckers.timer ?? "")
     }
     */
    
    
    // MARK: - @IBACTION
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        presentAlertController(with: nil,
                               massage: "Save the Game?",
                               actions: UIAlertAction(title: "Yes",
                                                      style: .default,
                                                      handler: { _ in
                                                        self.saveTimerAndCheckers()
//                                                        UserDefaults.standard.setValue(self.timerCount,
//                                                                                       forKey: KeysUserDefaults.timerT.rawValue)
                                                        self.navigationController?.popViewController(animated: true)
                                                        
                                                        
                                                      }), UIAlertAction(title: "No",
                                                                        style: .default,
                                                                        handler: { _ in
//                                                        UserDefaults.standard.removeObject(forKey: KeysUserDefaults.timerT.rawValue)
                                                        self.navigationController?.popViewController(animated: true)
                                                                        }))
    }
    
    
}



// MARK: - Расширение UIGestureRecognizer


extension ChessBoardController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
