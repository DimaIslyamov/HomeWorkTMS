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

class FirstViewController: UIViewController, FirstViewControllerDelegate {

    // создание UI элементов
    let textFieldName = UITextField(frame: CGRect(x: 45, y: 250, width: 300, height: 30))
    let button = UIButton(frame: CGRect(x: 120, y: 320, width: 150, height: 40))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTextFieldAndButton()
    }
    
    // реализация метода протокола
    func changeView(age: Int, gender: String) {
        if age > 50 && gender == "M" {
            view.backgroundColor = .systemRed
            button.backgroundColor = .black
        } else {
            if age > 50 && gender == "F" {
                view.backgroundColor = .systemYellow
            } else {
                if age < 50 {
                    view.backgroundColor = .systemGreen
                }
            }
        }
    }

    // переход на второй сторибоард и передача данных
    @objc func tappedTheButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "SecondStoryboard", bundle: nil)
        if let secondVC = storyboard.instantiateInitialViewController() as? SecondViewController {
            secondVC.receivingLableText = textFieldName.text ?? "error"
            secondVC.delegate = self
            secondVC.modalPresentationStyle = .fullScreen
            present(secondVC, animated: true, completion: nil)
        }
    }
    
    // костамизация UI элементов
    private func createTextFieldAndButton() {
        textFieldName.backgroundColor = .white
        textFieldName.placeholder = " enter your name"
        textFieldName.layer.cornerRadius = 10
        textFieldName.clearButtonMode = .always

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

