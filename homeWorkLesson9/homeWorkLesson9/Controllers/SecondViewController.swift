//
//  SecondViewController.swift
//  homeWorkLesson9
//
//  Created by Moobat on 8.07.21.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    weak var delegate: FirstViewControllerDelegate?
    var receivingLableText = ""
//    let ageValue: Int
//    let genderValue: String

    let receivingLable = UILabel(frame: CGRect(x: 45, y: 100, width: 300, height: 200))
    let enterDetailsLable = UILabel(frame: CGRect(x: 45, y: 355, width: 300, height: 20))
    let ageTextField = UITextField(frame: CGRect(x: 45, y: 380, width: 300, height: 30))
    let genderTextField = UITextField(frame: CGRect(x: 45, y: 420, width: 300, height: 30))
    let doneButton = UIButton(frame: CGRect(x: 120, y: 460, width: 150, height: 40))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createReceivingLableTextFieldAndBackButton()
        ageTextField.delegate = self
        genderTextField.delegate = self
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == ageTextField {
            
            genderTextField.becomeFirstResponder()
        } else {
            if textField == genderTextField {
                genderTextField.resignFirstResponder()
            }
        }
        return true
    }
    
    // Пока что не понятно ))
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldAge = ageTextField.text, !string.isEmpty  else { return true }
        if textFieldAge.count + string.count <= 2 {
            return true
        }
//        if stringGender == "M" || stringGender == "F" {
//            return true
//        }
        return false
    }
    
    
    
    @objc func doneBottonAction(_ sender: UIButton) {
        // code ???
        dismiss(animated: true, completion: nil)
    }
    

    private func createReceivingLableTextFieldAndBackButton() {
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
     //   ageTextField.returnKeyType = .next
        ageTextField.layer.cornerRadius = 10
        ageTextField.keyboardType = .numberPad
        
        genderTextField.backgroundColor = .white
        genderTextField.placeholder = " пол М / F"
        genderTextField.returnKeyType = .done
        genderTextField.layer.cornerRadius = 10
        
        doneButton.titleLabel?.font = UIFont(name: "Futura", size: 17)
        doneButton.layer.cornerRadius = 12
        doneButton.setTitle("Done", for: .normal)
        doneButton.addTarget(self, action: #selector(doneBottonAction(_:)), for: .touchUpInside)
        doneButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        view.addSubview(receivingLable)
        view.addSubview(enterDetailsLable)
        view.addSubview(ageTextField)
        view.addSubview(genderTextField)
        view.addSubview(doneButton)
    }

}
