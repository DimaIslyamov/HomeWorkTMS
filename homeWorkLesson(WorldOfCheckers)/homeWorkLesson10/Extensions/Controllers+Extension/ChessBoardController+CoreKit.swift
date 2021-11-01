//
//  ChessBoardController+CoreKit.swift
//  homeWorkLesson10
//
//  Created by Moobat on 16.08.21.
//

import UIKit

extension ChessBoardController {
    // MARK: - Локалицазация
    
    func localaized() {
        backButtonOutlet.setTitle("End Game_button_text".localaized, for: .normal)
        lableForBackground.text = "Original / Task 19_text".localaized
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
            
            self.getNames = [SaveNames(nameOne: firstField, nameTwo: secondField)]
            self.saveNames()
            self.getSetAndRandomNames()
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
    
    
    // MARK: - получение и сохраненние миени игроков
    
    func getSetAndRandomNames() {
        self.names = SettingManager.shared.saveNamePlayers
        
        self.names.forEach { value in
            self.randomName.append(value.nameOne)
            self.randomName.append(value.nameTwo)
        }
        
        if !FileManager.default.fileExists(atPath: documentDirectory.appendingPathComponent(Keys.cellAndChecker.rawValue).path) {
            player1 = randomName.randomElement() ?? ""
            player2 = (player1 == randomName[0]) ?self.randomName[1] : randomName[0]
            playersLable.text = (current == .white) ? "\(player1) move" : "\(player2) move"
            
            guard let name = nameOnePlayers, name != "" else {return}
            playersLable.text = name
        }
    }
    
    
    func saveNames() {
        let data = try? NSKeyedArchiver.archivedData(withRootObject: getNames, requiringSecureCoding: true)
         let _ = documentDirectory.appendingPathComponent(Keys.namePlayers.rawValue)
        try? data?.write(to: URL.saveNameSSURL())
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
    
    
    
    // MARK: - Moving метод
    
    func moving(for checker: UIView) {
        let cell = checker.superview
        chessboard.subviews.forEach { cellForMove in
            guard cellForMove.subviews.isEmpty, cellForMove.backgroundColor == .black, let startCell = cell else { return }
            let diff1 = current == .white ? -4 : +4
            let diff2 = current == .white ? -5 : +5
            if cellForMove.tag == startCell.tag + diff1 || cellForMove.tag == startCell.tag + diff2 {
//                cellForMove.backgroundColor = #colorLiteral(red: 0.1639071378, green: 0.1639071378, blue: 0.1639071378, alpha: 1)
                cellForMove.layer.borderColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
                cellForMove.layer.borderWidth = 3
                cellsMove.append(cellForMove)
            }
        }
    }
}




