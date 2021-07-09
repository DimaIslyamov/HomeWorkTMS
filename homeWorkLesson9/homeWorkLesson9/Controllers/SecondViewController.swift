//
//  SecondViewController.swift
//  homeWorkLesson9
//
//  Created by Moobat on 8.07.21.
//

import UIKit

class SecondViewController: UIViewController {
    
    var delegate: FirstViewControllerDelegate?
    var receivingLableText = ""

    let receivingLable = UILabel(frame: CGRect(x: 45, y: 100, width: 300, height: 200))
    let enterDetailsLable = UILabel(frame: CGRect(x: 45, y: 355, width: 300, height: 20))
    let ageTextField = UITextField(frame: CGRect(x: 45, y: 380, width: 300, height: 30))
    let genderTextField = UITextField(frame: CGRect(x: 45, y: 420, width: 300, height: 30))
    let doneButton = UIButton(frame: CGRect(x: 120, y: 460, width: 150, height: 40))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createReceivingLableTextFieldAndBackButton()
        
        
    }
    

    func createReceivingLableTextFieldAndBackButton() {
        receivingLable.textAlignment = .center
        receivingLable.font = UIFont(name: "Futura", size: 40)
        receivingLable.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        receivingLable.text = "Привет \(receivingLableText)! Введи свои данные!"
        receivingLable.numberOfLines = 0
        
        enterDetailsLable.font = UIFont(name: "Futura", size: 15)
        enterDetailsLable.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        enterDetailsLable.text = "Возраст и пол:"
        
        ageTextField.backgroundColor = .white
        ageTextField.placeholder = " возраст"
        ageTextField.layer.cornerRadius = 10
        
        genderTextField.backgroundColor = .white
        genderTextField.placeholder = " пол М / Ж"
        genderTextField.layer.cornerRadius = 10
        
        doneButton.titleLabel?.font = UIFont(name: "Futura", size: 17)
        doneButton.layer.cornerRadius = 12
        doneButton.setTitle("Done", for: .normal)
        doneButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        view.addSubview(receivingLable)
        view.addSubview(enterDetailsLable)
        view.addSubview(ageTextField)
        view.addSubview(genderTextField)
        view.addSubview(doneButton)
    }

}
