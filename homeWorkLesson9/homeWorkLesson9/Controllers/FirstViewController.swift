//
//  FirstViewController.swift
//  homeWorkLesson9
//
//  Created by Moobat on 8.07.21.
//

import UIKit

protocol FirstViewControllerDelegate: AnyObject {
    func changeView(age: Int, gender: String)
}

class FirstViewController: UIViewController, FirstViewControllerDelegate {

    let textField = UITextField(frame: CGRect(x: 45, y: 250, width: 300, height: 30))
    let button = UIButton(frame: CGRect(x: 120, y: 320, width: 150, height: 40))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTextFieldAndButton()
    }
    
    func changeView(age: Int, gender: String) {
        
    }

    @objc func tappedTheButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "SecondStoryboard", bundle: nil)
        if let secondVC = storyboard.instantiateInitialViewController() as? SecondViewController {
            secondVC.receivingLableText = textField.text ?? "error"
            secondVC.delegate = self
            secondVC.modalPresentationStyle = .fullScreen
            present(secondVC, animated: true, completion: nil)
        }
    }
    
    
    private func createTextFieldAndButton() {
        textField.backgroundColor = .white
        textField.placeholder = " enter your name"
        textField.layer.cornerRadius = 10

        button.backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        button.setTitle("Push", for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura", size: 20)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(tappedTheButton(_:)), for: UIControl.Event.touchUpInside)

        view.addSubview(textField)
        view.addSubview(button)
    }

}
