//
//  ChessBoardController.swift
//  homeWorkLesson10
//
//  Created by Moobat on 13.07.21.
//

import UIKit


enum Chekers: Int {
    case white = 0
    case black = 1
}


class ChessBoardController: UIViewController {
    
    // MARK: - @OUTLETS
    
    @IBOutlet weak var viewOutlet: UIView!
    @IBOutlet weak var backButtonOutlet: UIButton!
    @IBOutlet weak var backgraoundImage: UIImageView!
    @IBOutlet weak var lableForBackground: UILabel!
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var playersLable: UILabel!
    
    
    // MARK: - Переменные и Константы
    
    var chessboard = UIImageView()
    
    var countSec: Int = 0
    var countMin: Int = 0
    var timer: Timer?
    var timerLable: UILabel!
    
    var tagCell: Int = 0
    var tagChecker: Int = 0
    
    let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let userDef = UserDefaults.standard
    
    var cellCheckers: [CellCheckers] = []
    var cellsMove: [UIView] = []
    var current: Chekers = .black
    var mass: [(checker: Int, cell: Int, checkerBeaten: Int)] = []
    var canFight: Bool = false
    
    var player1 = ""
    var player2 = ""
    var getNames: [SaveNames] = [SaveNames(nameOne: "", nameTwo: "")]
    var names: [SaveNames] = []
    var randomName: [String] = []
    var nameOnePlayers: String?
    
    
    // MARK: - Жизненный цикл
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(setBackground(with: "GameArtas"))
        backgraoundImage.contentMode = .scaleAspectFill
        backButtonFuncCostamize()
        dateLable.text = Date().getCurrentDate()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        localaized()
        playersLable.isHidden = false
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.view.removeBlurView()
        timer?.invalidate()
        timer = nil
    }
    
    
    
    // MARK: - Objc Методы и Жесты
    
     @objc func timerFunc() {
        var sec: String
        var min: String
        countSec += 1
        if countSec == 60 {
            countSec = 0
            countMin += 1
        }
        sec = countSec < 10 ? ": 0\(countSec)" : ": \(countSec)"
        min = countMin < 10 ? "0\(countMin) " : "\(countMin) "
        timerLable.text = min + sec
        timerLable.textAlignment = .center
    }
    
    
    
    @objc func longPressGesture(_ sender: UILongPressGestureRecognizer) {
        guard let checker = sender.view,
              (current == .white && checker.tag < 12) || (current == .black && checker.tag >= 12) else { return }
//        guard let checker = sender.view, checker.tag == current.rawValue else { return }
        switch sender.state {
        case .began:
            if canFight == false {
                cellsMove.removeAll()
                forMovingCheckers(for: checker)
            }
            UIView.animate(withDuration: 0.3) {
                checker.transform = checker.transform.scaledBy(x: 2.7, y: 2.7)
            }
//            cellsMove.removeAll()
//            forMovingCheckers(for: checker)
            
        case .ended:
            UIView.animate(withDuration: 0.3) {
                checker.transform = .identity
            }
            if canFight == false {
                chessboard.subviews.forEach { value in
                    value.layer.borderWidth = 0
                }
            }
            
        default : break
        }
        
    }
    
    
    
    @objc func panGesture(_ sender: UIPanGestureRecognizer) {
//        guard sender.view?.tag == current.rawValue else { return }
        guard let checker = sender.view,
              (current == .white && checker.tag < 12) || (current == .black && checker.tag >= 12) else { return }
        
        let location = sender.location(in: chessboard)
        let translation = sender.translation(in: chessboard)
        
        switch sender.state {
        case .changed:
            guard let column = sender.view?.superview, let cellOrigin = sender.view?.frame.origin else { return }
            chessboard.bringSubviewToFront(column)
            sender.view?.frame.origin = CGPoint(x: cellOrigin.x + translation.x,
                                                y: cellOrigin.y + translation.y)
            sender.setTranslation(.zero, in: chessboard)
            
            // MARK: - ENDED
        case .ended:
            var currentCells: UIView? = nil
            var currentHittingChecker: Int? = nil
            
            cellsMove.forEach { (cell) in
                if canFight == true {
                    mass.forEach { (tagtuple) in
                        if checker.tag == tagtuple.checker,
                           cell.tag == tagtuple.cell,
                           cell.frame.contains(location) {
                            currentCells = cell
                            currentHittingChecker = tagtuple.checkerBeaten
                        }
                    }
                } else {
                    if cell.frame.contains(location) {
                        currentCells = cell
                    }
                }
            }
            
//            cellsMove.forEach { value in
//                if value.frame.contains(location) {
//                    currentCells = value
//                    cellsMove.removeAll()
//                }
//            }
            
            sender.view?.frame.origin = CGPoint(x: 5, y: 5)
            guard let newCell = currentCells, let checker = sender.view else { return }
            newCell.addSubview(checker)
            
            chessboard.subviews.forEach { (value) in
                value.subviews.first(where: {$0.tag == currentHittingChecker})?.removeFromSuperview()
            }
            if canFight == true {
                canFight = false
                cellsMove.removeAll()
                mass.removeAll()
                forHittingCheckers()
                chessboard.subviews.forEach { (value) in
                    value.layer.borderWidth = 0
                }
            }
            if canFight == true {
                mass.removeAll(where: {$0.checker != checker.tag})
                chessboard.subviews.forEach { (value) in
                    value.layer.borderWidth = 0
                }
                if mass.isEmpty {
                    canFight = false
                }
            }
            if canFight == false {
                current = current == .white ? .black : .white
                playersLable.text = (current == .white) ? "\(player1) move" : "\(player2) move"
                forHittingCheckers()
            }
            
            // функция для победы
            
//            cellsMove.removeAll()
            
//            current = current == .white ? .black : .white
//            playersLable.text = (current == .white) ? "\(player1) move" : "\(player2) move"
            
//            cellsMove.removeAll()
        
        default: break
        }
    }
    
    
    
    
    // MARK: - @IBACTION
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        presentAlertController(with: nil,
                               massage: "Вы действительно хотите выйти из игры?",
                               preferredStyle: .alert,
                               actions: UIAlertAction(title: "Выйти и сохранить партию",
                                                      style: .default,
                                                      handler: { _ in
                                                        self.saveDataToUserDefaults()
                                                        self.saveBatch()
                                                        self.navigationController?.popViewController(animated: true)
                                                        
                                }), UIAlertAction(title: "Выйти и не сохранять партию",
                                                  style: .default,
                                                  handler: { _ in
                                                    self.removeDataFromUserDefaults()
                                                    self.navigationController?.popViewController(animated: true)
                                                  }))
        }
    
    
    @IBAction func chooseBackground(_ sender: UISwitch) {
        guard let image = SettingManager.shared.saveBackgroundForCheckerViewController as? UIImage else { return }
        if sender.isOn {
            backgraoundImage.image = image
        } else {
            backgraoundImage.image = UIImage(named: "GameArtas")
        }
    }
    
}



// MARK: - Расширение UIGestureRecognizer


extension ChessBoardController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
