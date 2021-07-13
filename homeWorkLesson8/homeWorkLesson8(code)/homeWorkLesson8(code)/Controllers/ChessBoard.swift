//
//  ChessBoard.swift
//  homeWorkLesson8(code)
//
//  Created by Moobat on 7.07.21.
//

import UIKit

class ChessBoard: UIViewController {
    
    let view1 = UIView(frame: CGRect(x: 40, y: 250, width: 320 , height: 320))
    var lable = UILabel(frame: CGRect(x: 40, y: 100, width: 320, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.1239206932, green: 0.1230404846, blue: 0.2592334169, alpha: 1)
        view1.backgroundColor = .white
        view.addSubview(view1)
        
        createLable()
        cheesBoard()
    }
    
    let rows = 8
    let columns = 8
    
    //MARK: Метод для создания Шахматной доски, через for in
    func cheesBoard() {
        for row in 0...rows - 1 {
            for column in 0...columns - 1 {
                let view = UIView(frame: CGRect(x: row * 40, y: column * 40, width: 40 , height: 40))
                view1.addSubview(view)
                if (row + column) % 2 == 0 {
                    view.backgroundColor = .black
                }
                // так же могу просто дописать что - } else { view.backgraundColor = .white }
            }
        }
    }
    
    
    func createLable() {
        lable.textAlignment = .center
        lable.textColor = .orange
        lable.font = UIFont(name: "Futura", size: 50)
        lable.text = "Chess Board"
        view.addSubview(lable)
    }
    

}
