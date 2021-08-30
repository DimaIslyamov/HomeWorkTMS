//
//  ChessBoardController+CoreKit.swift
//  homeWorkLesson10
//
//  Created by Moobat on 16.08.21.
//

import UIKit

extension ChessBoardController {
    // MARK: - Методы создания новой партии
    
    func createChessboard() {
        chessboardCostamization()
        
        for i in 0..<8 {
            for j in 0..<8 {
                let column = UIView(frame: CGRect(x: 40 * j, y: 40 * i, width: 40, height: 40))
                column.backgroundColor = ((i + j) % 2) == 0 ? .clear : .black
                column.tag = ((i + j) % 2) == 0 ? 0 : tagCell
                if ((i + j) % 2) == 1 {
                    tagCell += 1
                    column.tag = tagCell
                }
                chessboard.addSubview(column)
                
                guard i < 3 || i > 4, column.backgroundColor == .black else { continue }
                
                
                checkerImage = UIImageView(frame: CGRect(x: 5, y: 5, width: 30, height: 30))
                checkerImage.isUserInteractionEnabled = true
                checkerImage.image = UIImage(named: i < 3 ? UserDefaults.standard.string(forKey: Keys.checkerImageBlack.rawValue)! : UserDefaults.standard.string(forKey: Keys.checkerImageWhite.rawValue)!)
                checkerImage.tag = i < 3 ? Chekers.black.rawValue : Chekers.white.rawValue
                column.addSubview(checkerImage)
                
                let tapGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressGesture(_:)))
                let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:)))
                tapGesture.delegate = self
                panGesture.delegate = self
                checkerImage.addGestureRecognizer(tapGesture)
                checkerImage.addGestureRecognizer(panGesture)
            }
        }
        chessboard.image = UIImage(named: "ice7")
        chessboard.isUserInteractionEnabled = true
    }
    
    
    
    
    // MARK: - методы сохраняющие партию
    
    func saveBatch() {
        chessboard.subviews.forEach { cell in
            if !cell.subviews.isEmpty {
                let position: CellCheckers = CellCheckers()
                position.cellTag = cell.tag
                cell.subviews.forEach { checker in
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
        let newArray = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [CellCheckers]
        self.cellCheckers = newArray ?? []
    }
    
    
    func createSaveChessboard() {
        chessboardCostamization()
        
        for i in 0..<8 {
            for j in 0..<8 {
                let column = UIView(frame: CGRect(x: 40 * i, y: 40 * j, width: 40, height: 40))
                column.backgroundColor = ((i + j) % 2) == 0 ? .clear : .black
                column.tag = ((i + j) % 2) == 0 ? 0 : tagCell
                if ((i + j) % 2) == 1 {
                    tagCell += 1
                    column.tag = tagCell
                }
                chessboard.addSubview(column)
                
                for value in cellCheckers {
                    if column.tag == value.cellTag {
                        checkerImage = UIImageView(frame: CGRect(x: 5, y: 5, width: 30, height: 30))
                        checkerImage.isUserInteractionEnabled = true
                        checkerImage.image = UIImage(named: j < 3 ? UserDefaults.standard.string(forKey: Keys.checkerImageBlack.rawValue)! : UserDefaults.standard.string(forKey: Keys.checkerImageWhite.rawValue)!)
                        checkerImage.tag = value.checkerTag == 1 ? Chekers.black.rawValue : Chekers.white.rawValue
                        column.addSubview(checkerImage)
                        
                        let tapGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressGesture(_:)))
                        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:)))
                        tapGesture.delegate = self
                        panGesture.delegate = self
                        checkerImage.addGestureRecognizer(tapGesture)
                        checkerImage.addGestureRecognizer(panGesture)
                    }
                }
            }
        }
        chessboard.image = UIImage(named: "ice7")
        chessboard.isUserInteractionEnabled = true
        view.addSubview(chessboard)
    }
    
    
    
    //MARK: - Vетод вызывающий алер с текст филдом - доработать
    
    func openAlertForPlayersName(){
        let alertController = UIAlertController(title: "Введите имена игроков", message: "", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Игрок 1"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Игрок 2"
        }

        let saveAction = UIAlertAction(title: "Подтвердить", style: .default, handler: { _ in
            let firstTextField = alertController.textFields![0] as UITextField
            let secondTextField = alertController.textFields![1] as UITextField
            guard let myString = firstTextField.text, !myString.isEmpty,
                  let myString2 = secondTextField.text, !myString2.isEmpty else {
                print("empty")
                return }
            self.player1 = myString
            self.player2 = myString2
//            print("\(self.player1) --- \(self.player2)")
//            self.player1 = firstTextField.text ?? ""
//            self.player2 = secondTextField.text ?? ""
        })
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
            self.navigationController?.popViewController(animated: true)
        })

        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        alertController.preferredAction = saveAction

        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    // MARK: - Создание Таймера
    
    func createTimer() {
        timer = Timer(timeInterval: 1.0, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common)
        
        let attrs: [NSAttributedString.Key: Any] = [ .foregroundColor : UIColor.systemYellow,
                                                     .font: UIFont(name: "StyleScript-Regular", size: 35) ?? "" ]

        let timerView = UIView(frame: CGRect(x: view.center.x, y: 130, width: 170, height: 50))
        timerView.center.x = view.center.x
        timerView.backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.337254902, blue: 0.5019607843, alpha: 1)
        timerView.layer.cornerRadius = 15
        timerView.layer.borderWidth = 3
        timerView.layer.borderColor = UIColor.black.cgColor
        
        timerView.layer.shadowColor = UIColor.black.cgColor
        timerView.layer.shadowRadius = 7
        timerView.layer.shadowOpacity = 0.9
        timerView.layer.shadowOffset = CGSize(width: 10, height: 10)
        
        view.addSubview(timerView)

        timerLable = UILabel(frame: CGRect(origin: .zero, size: CGSize(width: 130, height: 50)))
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
    
    
    
    // не понял как можно подключить / в теперешней ситуации
//    func timeFormatter(_ tottalSecond: Int) -> String {
//        let second: Int = tottalSecond % 60
//        let minutes: Int = (tottalSecond / 60) % 60
//        return String(format: "%02d:%02d", minutes, second)
//    }
    
    
    
    
    // MARK: - Сохранение FileManager.default для Background контроллера с доской
    
    func getBackground() {
        // доделать: _сделать функию и выбор по default!!
        guard let data = FileManager.default.contents(atPath: URL.getBackgroundURL().absoluteString.replacingOccurrences(of: "file://", with: "")),
              let object = try? NSKeyedUnarchiver.unarchivedObject(ofClass: UIImage.self, from: data) else { return }
        
        let image = object
        backgraoundImage.image = image
        backgraoundImage.contentMode = .scaleAspectFill
        
    }
    
    
    
    // MARK: - Сохранение UserDefaults для таймера
    
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
    
    
    
    
    // MARK: - Moving метод
    
    func moving(for checker: UIView) {
        let cell = checker.superview
        chessboard.subviews.forEach { cellMove in
            guard cellMove.subviews.isEmpty, let startCell = cell else { return }
            let diff1 = current == .white ? -4 : +4
            let diff2 = current == .white ? -5 : +5
            if cellMove.tag == startCell.tag + diff1 || cellMove.tag == startCell.tag + diff2 {
                cellMove.backgroundColor = #colorLiteral(red: 0.1639071378, green: 0.1639071378, blue: 0.1639071378, alpha: 1)
                cellsMove.append(cellMove)
            }
        }
    }
    
    
    
    
    // MARK: - Методы костамизации доски и кнопки назад
    
    func chessboardCostamization() {
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
        
        lableForBackground.layer.shadowColor = UIColor.black.cgColor
        lableForBackground.layer.shadowRadius = 5
        lableForBackground.layer.shadowOpacity = 0.7
        lableForBackground.layer.shadowOffset = CGSize(width: 5, height: 5)
    }
}




