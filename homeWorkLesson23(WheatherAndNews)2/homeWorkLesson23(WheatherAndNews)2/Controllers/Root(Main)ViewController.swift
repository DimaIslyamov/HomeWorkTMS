//
//  Root(Main)ViewController.swift
//  homeWorkLesson23(WheatherAndNews)2
//
//  Created by Moobat on 15.09.21.
//

import UIKit

class Root_Main_ViewController: UIViewController {

    @IBOutlet weak var searchTheWheatherTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func sendTheCityName(_ sender: UIButton) {
        guard let vc = getViewController(from: "Wheather") as? WheathreViewController,
              let text = searchTheWheatherTextField.text, !text.isEmpty else { return }
        vc.city = text
        searchTheWheatherTextField.text = ""
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
