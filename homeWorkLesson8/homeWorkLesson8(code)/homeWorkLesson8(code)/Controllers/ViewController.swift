//
//  ViewController.swift
//  homeWorkLesson8(code)
//
//  Created by Moobat on 7.07.21.
//

import UIKit

class ViewController: UIViewController {
    
 // MARK: - Создание UI элементов
    let lableSumm = UILabel(frame: CGRect(x: 45, y: 90, width: 300, height: 200))
    let textField1 = UITextField(frame: CGRect(x: 45, y: 350, width: 300, height: 35))
    let lablePlus = UILabel(frame: CGRect(x: 45, y: 390, width: 300, height: 35))
    let textField2 = UITextField(frame: CGRect(x: 45, y: 430, width: 300, height: 35))
    let button = UIButton(frame: CGRect(x: 95, y: 480, width: 200, height: 40))
    let buttonForChessBoard = UIButton(frame: CGRect(x: 95, y: 600, width: 200, height: 40))
    
    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        createCustomization()
        addTapGestureToHideKeyboard()
    }
    
    
    
    //MARK: - Метод для перезода по нажатию
    @objc func goToChessBoard() {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let chessBoard = storyboard.instantiateViewController(identifier: "chessBoard") as! ChessBoard
        self.present(chessBoard, animated: true)
    }
    
    
    
    //MARK: - Метод Выводящий сумму или ошибку в Алерт контролере
    @objc func buttonSummTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Ошибка!", message: "ТекстФилд принимает только цифры.", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(ok)
        
        // Оптимизированный
        guard let valueOne = textField1.text, !valueOne.isEmpty,
           let valueTwo = textField2.text, !valueTwo.isEmpty,
           let value1 = Int(valueOne), let value2 = Int(valueTwo) else {
            present(alert, animated: true, completion: nil)
            return }
        lableSumm.text = "\(value1 + value2)"
        
        // Страый код
//        guard let valueOne = textField1.text, !valueOne.isEmpty else { return }
//        guard let valueTwo = textField2.text, !valueTwo.isEmpty else { return }
//        if let value1 = Int(valueOne) {
//            if let value2 = Int(valueTwo) {
//                let summ = value1 + value2
//                lableSumm.text = String(summ)
//            } else {
//                present(alert, animated: true, completion: nil)
//            }
//        } else {
//            present(alert, animated: true, completion: nil)
//        }
    }
    
    
    // MARK: - Костамизация UI элементов
    func createCustomization() {
        view.backgroundColor = #colorLiteral(red: 0.1239206932, green: 0.1230404846, blue: 0.2592334169, alpha: 1)
        
        // лэйбл выводящий сумму
        lableSumm.textAlignment = .center
        lableSumm.textColor = .orange
        lableSumm.font = UIFont(name: "Futura", size: 45)
        view.addSubview(lableSumm)
        
        // перый текстФилд
        textField1.backgroundColor = .white
        textField1.placeholder = "enter value one"
        textField1.layer.cornerRadius = 10
        view.addSubview(textField1)
        
        // просто лэйбл +плюс
        lablePlus.textAlignment = .center
        lablePlus.textColor = .orange
        lablePlus.font = UIFont(name: "Futura", size: 17)
        lablePlus.text = "Plus +"
        view.addSubview(lablePlus)
        
        
        // второй текстФилд
        textField2.backgroundColor = .white
        textField2.placeholder = "enter value two"
        textField2.layer.cornerRadius = 10
        view.addSubview(textField2)
        
        // кнопка
        button.backgroundColor = .orange
        button.setTitle("Get Summ", for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura", size: 17)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(buttonSummTapped(_:)), for: UIControl.Event.touchUpInside)
        view.addSubview(button)
        
        // кнопка для перезода на 2ой view
        buttonForChessBoard.backgroundColor = .orange
        buttonForChessBoard.setTitle("Go to ChessBoard", for: .normal)
        buttonForChessBoard.titleLabel?.font = UIFont(name: "Futura", size: 17)
        buttonForChessBoard.layer.cornerRadius = 12
        buttonForChessBoard.addTarget(self, action: #selector(goToChessBoard), for: UIControl.Event.touchUpInside)
        view.addSubview(buttonForChessBoard)
    }
    
   
    
}
//MARK: - Знаю что есть лучше, что бы не перекрывало элементы
extension ViewController {
    func addTapGestureToHideKeyboard() {
            let tapGesture = UITapGestureRecognizer(target: view, action: #selector(view.endEditing))
            view.addGestureRecognizer(tapGesture)
        }
}

