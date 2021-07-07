//
//  ChessBoard.swift
//  homeWorkLesson8(code)
//
//  Created by Moobat on 7.07.21.
//

import UIKit

class ChessBoard: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let chessBoard = CGRect(x: 45, y: 270, width: 300, height: 300)
        let viewChessBoard = UIView(frame: chessBoard)
        viewChessBoard.backgroundColor = .white
        view.addSubview(viewChessBoard)
        
        view.backgroundColor = #colorLiteral(red: 0.1239206932, green: 0.1230404846, blue: 0.2592334169, alpha: 1)
    }
    

    

}
