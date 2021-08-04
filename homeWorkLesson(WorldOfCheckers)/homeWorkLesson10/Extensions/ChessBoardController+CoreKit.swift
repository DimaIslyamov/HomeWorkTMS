//
//  ChessBoardController+CoreKit.swift
//  homeWorkLesson10
//
//  Created by Moobat on 3.08.21.
//

import UIKit

extension ChessBoardController {
    
    func alert() {
        let alert = UIAlertController(title: "You really want to leave?", message: "If you exit, the game will be over.", preferredStyle: .alert)
        let yes = UIAlertAction(title: "Yes", style: .default) { _ in
            self.navigationController?.popViewController(animated: true)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(cancel)
        alert.addAction(yes)
        
        present(alert, animated: true, completion: nil)
    }
    
}
