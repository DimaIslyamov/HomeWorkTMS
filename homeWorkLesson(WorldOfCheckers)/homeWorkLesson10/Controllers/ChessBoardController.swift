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
    @IBOutlet weak var playersLable: CustomLable!
    
    
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
    
    var player1 = ""
    var player2 = ""
    
    
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
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.view.removeBlurView()
        timer?.invalidate()
        timer = nil
    }
    
    
    func localaized() {
        backButtonOutlet.setTitle("End Game_button_text".localaized, for: .normal)
        lableForBackground.text = "Original / Task 19_text".localaized
        
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
        guard let checker = sender.view, checker.tag == current.rawValue else { return }
        switch sender.state {
        case .began:
            cellsMove.removeAll()
            UIView.animate(withDuration: 0.3) {
                checker.transform = checker.transform.scaledBy(x: 2.7, y: 2.7)
            }
            moving(for: checker)
            
            // выводит имя игрока в лэйбл
            if current == .black {
                playersLable.playerLable.text = player1
            } else if current == .white {
                playersLable.playerLable.text = player2
            }
            
        case .ended:
            UIView.animate(withDuration: 0.3) {
                checker.transform = .identity
            }
            chessboard.subviews.forEach { value in
                if value.backgroundColor == #colorLiteral(red: 0.1639071378, green: 0.1639071378, blue: 0.1639071378, alpha: 1) {
                    value.backgroundColor = .black
                }
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
            var currentCells: UIView? = nil
            cellsMove.forEach { value in
                if value.frame.contains(location) {
                    currentCells = value
                }
            }
            sender.view?.frame.origin = CGPoint(x: 5, y: 5)
            
            guard let newCell = currentCells, let cell = sender.view else { return }
            newCell.addSubview(cell)
            
            current = current == .white ? .black : .white
            cellsMove.removeAll()
            
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
