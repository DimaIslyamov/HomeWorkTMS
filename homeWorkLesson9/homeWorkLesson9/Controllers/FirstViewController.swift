//
//  FirstViewController.swift
//  homeWorkLesson9
//
//  Created by Moobat on 8.07.21.
//

import UIKit

// делегат(Протокол) для передачи данных
protocol FirstViewControllerDelegate: AnyObject {
    func changeView(age: Int, gender: String)
}

class FirstViewController: UIViewController, UITextFieldDelegate, FirstViewControllerDelegate {
    
    
    // создание UI элементов
    let textFieldName = UITextField(frame: CGRect(x: 45, y: 250, width: 300, height: 30))
    let button = UIButton(frame: CGRect(x: 120, y: 320, width: 150, height: 40))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTextFieldAndButton()
        textFieldName.delegate = self
    }
    
    
    // реализация метода протокола и обработка данных со второго VC (Не получилось через тернарный) Спросить !!
    func changeView(age: Int, gender: String) {
        textFieldName.text = ""
        if age > 50 && gender == "M" {
            view.backgroundColor = .systemRed
        } else {
            if gender == "F" {
                view.backgroundColor = .systemYellow
            } 
        }
        // Работатет но не так как надо !!!
        //        (age > 50 && gender == "M") || (gender == "F") ? (view.backgroundColor = .systemRed) : (view.backgroundColor = .systemYellow)
    }
    
    
    // скрытие клавиатуры
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldName.resignFirstResponder()
        return true
    }
    
    
    // переход на второй сторибоард и передача данных
    @objc func tappedTheButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Upsss🤬", message: "Plece enter your name", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(ok)
        
        if textFieldName.text == "" {
            present(alert, animated: true, completion: nil)
        } else {
            let storyboard = UIStoryboard(name: "SecondStoryboard", bundle: nil)
            if let secondVC = storyboard.instantiateInitialViewController() as? SecondViewController {
                secondVC.receivingLableText = textFieldName.text ?? "error"
                secondVC.delegate = self
                secondVC.modalPresentationStyle = .fullScreen
                present(secondVC, animated: true, completion: nil)
            }
        }
    }
    
    
    // костамизация UI элементов
    private func createTextFieldAndButton() {
        textFieldName.backgroundColor = .white
        textFieldName.placeholder = " enter your name"
        textFieldName.layer.cornerRadius = 10
        textFieldName.clearButtonMode = .always
        textFieldName.returnKeyType = .done
        
        button.backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        button.setTitle("Push", for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura", size: 20)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(tappedTheButton(_:)),
                         for: UIControl.Event.touchUpInside)
        
        view.addSubview(textFieldName)
        view.addSubview(button)
    }
}

