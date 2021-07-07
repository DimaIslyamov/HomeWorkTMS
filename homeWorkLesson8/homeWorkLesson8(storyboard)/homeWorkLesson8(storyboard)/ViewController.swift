//
//  ViewController.swift
//  homeWorkLesson8(storyboard)
//
//  Created by Moobat on 6.07.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldValue1: UITextField!
    @IBOutlet weak var textFieldValue2: UITextField!
    @IBOutlet weak var plusLabel: UILabel!
    @IBOutlet weak var sumButton: UIButton!
    @IBOutlet weak var labelForOutputValue: UILabel!
    @IBOutlet weak var chessBoard: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sumButton.layer.cornerRadius = 10
        chessBoard.layer.cornerRadius = 10
        addTapGestureToHideKeyboard()
    }
    
    
    @IBAction func showChessBoard(_ sender: UIButton) {
    }
    
    @IBAction func sumButtonTapped(_ sender: Any) {
        // проверка
        guard let value1 = textFieldValue1.text, !value1.isEmpty else { return }
        guard let value2 = textFieldValue2.text, !value2.isEmpty else { return }
        // алертКонтроллер
        let alert = UIAlertController(title: "Ошибка!",
                                      message: "ТекстФилд принимает только цифры.",
                                      preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(ok)
        // вычесление и вывод
        if let value1 = Int(value1) {
            if let value2 = Int(value2) {
                let summ = value1 + value2
                labelForOutputValue.text = String(summ)
            } else {
                present(alert, animated: true, completion: nil)
            }
        } else {
            present(alert, animated: true, completion: nil)
        }
        
        
        
        // когда есть буквы бросает Еррор
        // если цифры, он их просто клеит друг к другу и не считает
        
//        let summ = textFieldValue1.text! + textFieldValue2.text!
//        guard Int(summ) != nil else {
//            labelForOutputValue.text = "Error"
//            return
//        }
//        labelForOutputValue.text = summ
        }
    }
    
extension ViewController {
    func addTapGestureToHideKeyboard() {
            let tapGesture = UITapGestureRecognizer(target: view, action: #selector(view.endEditing))
            view.addGestureRecognizer(tapGesture)
        }
}


