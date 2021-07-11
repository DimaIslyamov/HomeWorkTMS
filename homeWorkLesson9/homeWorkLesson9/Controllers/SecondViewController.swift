//
//  SecondViewController.swift
//  homeWorkLesson9
//
//  Created by Moobat on 8.07.21.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    // связь делегата контроллеров 
    weak var delegate: FirstViewControllerDelegate?
    
    // создание переменных
    var receivingLableText = ""
    var ageValue: Int = 0
    var genderValue: String = ""
    
    // создание UI elements
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
    
    
    // для переключения и скрытия клавиатуры
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //  - переключает на второй текст филд но не выключает его -
        //        (textField == ageTextField || textField == genderTextField) ? genderTextField.becomeFirstResponder() : textField.resignFirstResponder()
        
        if textField == ageTextField {
            genderTextField.becomeFirstResponder()
        } else {
            if textField == genderTextField {
                textField.resignFirstResponder()
            }
        }
        return true
    }
    
    
    // сделал запрет на Буквы и Цыфры 
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard !string.isEmpty else { return true }
        if textField == ageTextField, (ageTextField.text?.count ?? 0) + string.count <= 2 {
            if Int(string) != nil{
                return true
            } else {
                return false
            }
        }
        
        if textField == genderTextField, (genderTextField.text?.count ?? 0) + string.count <= 1 {
            switch string.uppercased() {
            case "M", "F":
                return true
            default:
                return false
            }
        }
        
        return false
    }
    
    
    // проверка и отправка данных по нажатию
    @objc func doneBottonAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "Upsss🤬", message: "Please fill in all text fields", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(ok)
        
        guard let ageText = ageTextField.text, !ageText.isEmpty,
              let genderText = genderTextField.text, !genderText.isEmpty,
              let valueAge = Int(ageText) else {
            present(alert, animated: true, completion: nil)
            return }
        ageValue = valueAge
        genderValue = genderText
        delegate?.changeView(age: ageValue, gender: genderValue)
        dismiss(animated: true, completion: nil)
    }
    
    
    // костамизация UI elements
    private func createReceivingLableTextFieldAndBackButton() {
        receivingLable.textAlignment = .center
        receivingLable.font = UIFont(name: "Futura", size: 40)
        receivingLable.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        receivingLable.text = "Hi \(receivingLableText)! Enter your details!"
        receivingLable.numberOfLines = 0
        
        enterDetailsLable.font = UIFont(name: "Futura", size: 15)
        enterDetailsLable.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        enterDetailsLable.text = "Age and Gender M/F:"
        
        ageTextField.backgroundColor = .white
        ageTextField.placeholder = " your age"
        ageTextField.returnKeyType = .next
        ageTextField.layer.cornerRadius = 10
        
        genderTextField.backgroundColor = .white
        genderTextField.placeholder = " your gender M/F"
        genderTextField.returnKeyType = .done
        genderTextField.layer.cornerRadius = 10
        
        doneButton.titleLabel?.font = UIFont(name: "Futura", size: 17)
        doneButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        doneButton.layer.cornerRadius = 12
        doneButton.setTitle("Done", for: .normal)
        doneButton.addTarget(self, action: #selector(doneBottonAction(_:)), for: .touchUpInside)
        
        view.addSubview(receivingLable)
        view.addSubview(enterDetailsLable)
        view.addSubview(ageTextField)
        view.addSubview(genderTextField)
        view.addSubview(doneButton)
    }
}
