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
//    @IBOutlet weak var timerLable: UILabel!
    
    
    // MARK: - Переменные
    
//    var checker = UIImageView()
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
    
    var current: Chekers = .black
    
    
    // MARK: - Жизненный цикл
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startOrContinue()
        backButtonFuncCostamize()
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
                // присвоение тэга column
                column.tag = ((i + j) % 2) == 0 ? 0 : tagCell
                if ((i + j) % 2) == 1 {
                    tagCell += 1
                    column.tag = tagCell
                }
                chessboard.addSubview(column)
                
                guard j < 3 || j > 4, column.backgroundColor == .black else { continue }
                
                let checker = UIImageView(frame: CGRect(x: 5, y: 5, width: 30, height: 30))
                checker.isUserInteractionEnabled = true
                checker.image = j < 3 ? UIImage(named: "ArtasArmi") : UIImage(named: "ElidanArmi")
                checker.tag = j < 3 ? Chekers.white.rawValue : Chekers.black.rawValue
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
    
    
   
    
    func createTimer() {
        // создание таймера
        timer = Timer(timeInterval: 1.0, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common)
        
        let attrs: [NSAttributedString.Key: Any] = [ .foregroundColor : UIColor.yellow,
                                                     .font: UIFont(name: "StyleScript-Regular", size: 35) ?? "" ]

        let timerView = UIView(frame: CGRect(x: view.center.x, y: 130, width: 170, height: 60))
        timerView.center.x = view.center.x
        timerView.backgroundColor = #colorLiteral(red: 0.3900135159, green: 0.01423221827, blue: 0.01847057045, alpha: 1)
        timerView.layer.cornerRadius = 15
        timerView.layer.borderWidth = 5
        timerView.layer.borderColor = UIColor.black.cgColor
        view.addSubview(timerView)

        timerLable = UILabel(frame: CGRect(origin: .zero, size: CGSize(width: 130, height: 60)))
        timerLable.frame.origin.x += 20

        if countMin > 0 || countSec > 0 {
            var sec: String
            var min: String
            sec = countSec < 10 ? ": 0\(countSec)" : ": \(countSec)"
            min = countMin < 10 ? "0\(countMin) " : "\(countMin) "
            timerLable.attributedText = NSAttributedString(string: min + sec, attributes: attrs)
        } else {
            timerLable.attributedText = NSAttributedString(string: "0\(countMin) : 0\(countSec)", attributes: attrs)
        }

        timerLable.textAlignment = .center
        timerView.addSubview(timerLable)
        view.addSubview(chessboard)
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
    
    func saveBatch() {
        chessboard.subviews.forEach { cell in
            if !cell.subviews.isEmpty {
                let position: CellCheckers = CellCheckers()
                position.cellTag = cell.tag
                cell.subviews.forEach { checker in
//                    let savCheck: CellCheckers = CellCheckers()
//                    savCheck.cellTag = cell.tag
//                    savCheck.checkerTag = checker.tag
//                    cellCheckers.append(savCheck)
                    position.checkerTag = checker.tag
                }
                cellCheckers.append(position)
            }
        }
        let data = try? NSKeyedArchiver.archivedData(withRootObject: cellCheckers, requiringSecureCoding: true)
        let fileURL = documentDirectory.appendingPathComponent(Keys.cellAndChecker.rawValue)
        try? data?.write(to: fileURL)
    }
    
    
    func getLastBatch() {
        let fileURL = documentDirectory.appendingPathComponent(Keys.cellAndChecker.rawValue)
        guard let data = FileManager.default.contents(atPath: fileURL.absoluteString.replacingOccurrences(of: "file://", with: "")) else { return }
        let object = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [CellCheckers]
        self.cellCheckers = object ?? []
    }
    
    func createSaveChessboard() {
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
                // присвоение тэга column
                column.tag = ((i + j) % 2) == 0 ? 0 : tagCell
                if ((i + j) % 2) == 1 {
                    tagCell += 1
                    column.tag = tagCell
                }
                chessboard.addSubview(column)
                
                guard j < 3 || j > 4, column.backgroundColor == .black else { continue }
                
                for value in cellCheckers {
                    if column.tag == value.cellTag {
                        let checker = UIImageView(frame: CGRect(x: 5, y: 5, width: 30, height: 30))
                        checker.isUserInteractionEnabled = true
                        checker.image = value.checkerTag == 1 ? UIImage(named: "ArtasArmi") : UIImage(named: "ElidanArmi")
                        checker.tag = value.checkerTag == 1 ? Chekers.white.rawValue : Chekers.black.rawValue
                        column.addSubview(checker)
                        
                        let tapGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressGesture(_:)))
                        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:)))
                        tapGesture.delegate = self
                        panGesture.delegate = self
                        checker.addGestureRecognizer(tapGesture)
                        checker.addGestureRecognizer(panGesture)
                    }
                }
            }
        }
        chessboard.image = UIImage(named: "ice7")
        chessboard.isUserInteractionEnabled = true
        view.addSubview(chessboard)
    }
    
    func startOrContinue() {
        presentAlertController(with: nil, massage: "Continue or start a New Game ?", actions: UIAlertAction(title: "Continue", style: .default, handler: { _ in
                                        self.getLastBatch()
                                        self.setDataFromUserDefaults()
                                        self.createTimer()
                                        self.createSaveChessboard()
                                          do {
                                            let fileURL = self.documentDirectory.appendingPathComponent(Keys.cellAndChecker.rawValue)
                                            try FileManager.default.removeItem(at: fileURL)
                                         }
                                        catch {
                                              print(error.localizedDescription)
                                         }
//                                         self.cellCheckers.removeAll()
                                   }),
         UIAlertAction(title: "New Game", style: .default, handler: { _ in
                                                            self.removeDataFromUserDefaults()
                                                            self.createTimer()
                                                            self.createChessboard()
                                                         }))
    }
    
    func saveDataToUserDefaults() {
        userDef.setValue(countSec, forKey: Keys.timerSec.rawValue)
        userDef.setValue(countMin, forKey: Keys.timerMin.rawValue)
    }
    
    func removeDataFromUserDefaults() {
        userDef.removeObject(forKey: Keys.timerSec.rawValue)
        userDef.removeObject(forKey: Keys.timerMin.rawValue)
    }
    
    func setDataFromUserDefaults() {
        self.countSec = userDef.integer(forKey: Keys.timerSec.rawValue)
        self.countMin = userDef.integer(forKey: Keys.timerMin.rawValue)
    }
    
    
    // не понял как можно подключить / в теперешней ситуации
//    func timeFormatter(_ tottalSecond: Int) -> String {
//        let second: Int = tottalSecond % 60
//        let minutes: Int = (tottalSecond / 60) % 60
//        return String(format: "%02d:%02d", minutes, second)
//    }
    
    
    
    // MARK: - Objc Методы
    
    
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
    
    
    
    
    // MARK: - @IBACTION
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        presentAlertController(with: nil,
                               massage: "Save the Game?",
                               actions: UIAlertAction(title: "Yes",
                                                      style: .default,
                                                      handler: { _ in
                                                                    self.saveDataToUserDefaults()
                                                                    self.saveBatch()
                                                                    self.navigationController?.popViewController(animated: true)
                                                        
                                }), UIAlertAction(title: "No",
                                                  style: .default,
                                                  handler: { _ in
                                                                self.removeDataFromUserDefaults()
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
