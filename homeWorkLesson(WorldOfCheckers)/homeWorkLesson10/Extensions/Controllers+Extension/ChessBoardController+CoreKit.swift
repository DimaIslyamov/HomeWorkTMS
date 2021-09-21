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
                
                 let checkerImage = UIImageView(frame: CGRect(x: 5, y: 5, width: 30, height: 30))
                checkerImage.isUserInteractionEnabled = true
                checkerImage.image = UIImage(named: i < 3 ? (SettingManager.shared.saveBlackChecker) ?? "" : (SettingManager.shared.saveWhiteChecker) ?? "")
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
        SettingManager.shared.saveCellsCheckers = self.cellCheckers
    }
    
    
    func createSaveChessboard() {
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
                
                
                for value in cellCheckers {
                    if column.tag == value.cellTag {
                        let checkerImage = UIImageView(frame: CGRect(x: 5, y: 5, width: 30, height: 30))
                        checkerImage.isUserInteractionEnabled = true
                        checkerImage.image = UIImage(named: value.checkerTag == 1 ? (SettingManager.shared.saveBlackChecker) ?? "" : (SettingManager.shared.saveWhiteChecker) ?? "")
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
    }
    
    
    
    //MARK: - Vетод вызывающий алер с текст филдом - доработать
    
    func openAlertForPlayersName(){
        view.addBlurView()
        self.stopTimer()
        let alertController = UIAlertController(title: "Введите имена игроков", message: "", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Игрок 1"
            textField.returnKeyType = .next
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Игрок 2"
            textField.returnKeyType = .done
        }

        let saveAction = UIAlertAction(title: "Подтвердить", style: .default, handler: { _ in
            guard let fields = alertController.textFields, fields.count == 2 else { return }
            let firstTextField = fields[0]
            let secondTextField = fields[1]
            guard let firstField = firstTextField.text, !firstField.isEmpty,
                  let secondField = secondTextField.text, !secondField.isEmpty else {
                let alertController = UIAlertController(title: "Введите двоих игроков", message: nil, preferredStyle: .alert)
                let ok = UIAlertAction(title: "Ok", style: .cancel) { _ in
                    self.navigationController?.popViewController(animated: true)
                    self.view.removeBlurView()
                }
                alertController.addAction(ok)
                self.present(alertController, animated: true, completion: nil)
                print("Invalid entries")
                return
            }
            self.player1 = "Move: \(firstField)"
            self.player2 = "Move: \(secondField)"
            self.startTimer()
            self.view.removeBlurView()
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
    
    func startTimer() {
        timer = Timer(timeInterval: 1.0, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common)
    }
    
    func stopTimer() {
        timer?.invalidate()
    }
    
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
    
    
    
    // MARK: - Moving метод
    
    func moving(for checker: UIView) {
        let cell = checker.superview
        chessboard.subviews.forEach { cellForMove in
            guard cellForMove.subviews.isEmpty, cellForMove.backgroundColor == .black, let startCell = cell else { return }
            let diff1 = current == .white ? -4 : +4
            let diff2 = current == .white ? -5 : +5
            if cellForMove.tag == startCell.tag + diff1 || cellForMove.tag == startCell.tag + diff2 {
                cellForMove.backgroundColor = #colorLiteral(red: 0.1639071378, green: 0.1639071378, blue: 0.1639071378, alpha: 1)
                cellsMove.append(cellForMove)
            }
        }
    }
}




