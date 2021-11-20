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
        let alertController = UIAlertController(title: "Enter_players_names".localaized, message: "", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "player_one".localaized
            textField.returnKeyType = .next
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "player_two".localaized
            textField.returnKeyType = .done
        }
        
        let saveAction = UIAlertAction(title: "Confirm_".localaized, style: .default, handler: { _ in
            guard let fields = alertController.textFields, fields.count == 2 else { return }
            
            let firstTextField = fields[0]
            let secondTextField = fields[1]
            
            guard let firstField = firstTextField.text, !firstField.isEmpty,
                  let secondField = secondTextField.text, !secondField.isEmpty else {
                
                let alertController = UIAlertController(title: "Enter_names_of_two_players".localaized, message: nil, preferredStyle: .alert)
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
        
        let cancelAction = UIAlertAction(title: "Cancel_".localaized, style: .default, handler: {
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
    }
}
