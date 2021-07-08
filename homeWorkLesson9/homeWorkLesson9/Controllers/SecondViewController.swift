//
//  SecondViewController.swift
//  homeWorkLesson9
//
//  Created by Moobat on 8.07.21.
//

import UIKit

class SecondViewController: UIViewController {

    let receivingLable = UILabel(frame: CGRect(x: 45, y: 100, width: 300, height: 200))
    let enterDetailsLable = UILabel(frame: CGRect(x: 45, y: 355, width: 300, height: 20))
    let ageTextField = UITextField(frame: CGRect(x: 45, y: 380, width: 300, height: 30))
    let genderTextField = UITextField(frame: CGRect(x: 45, y: 420, width: 300, height: 30))
    let doneButton = UIButton(frame: CGRect(x: 120, y: 460, width: 150, height: 40))
    
    var receivingLableText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createReceivingLableTextFieldAndBackButton()
    }
    

    func createReceivingLableTextFieldAndBackButton() {
        receivingLable.backgroundColor = .white
        view.addSubview(receivingLable)
        
        enterDetailsLable.backgroundColor = .red
        view.addSubview(enterDetailsLable)
        
        ageTextField.backgroundColor = .orange
        view.addSubview(ageTextField)
        
        genderTextField.backgroundColor = .blue
        view.addSubview(genderTextField)
        
        doneButton.backgroundColor = .black
        view.addSubview(doneButton)
    }

}
