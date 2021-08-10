//
//  ChessBoardController+CoreKit.swift
//  homeWorkLesson10
//
//  Created by Moobat on 3.08.21.
//

import UIKit

extension UIViewController {
    
    func presentAlertController(with title: String, massage: String, preferredStyle: UIAlertController.Style = .alert) -> UIAlertController {
        self.view.addBlurView()
        let alert = UIAlertController(title: title, message: massage, preferredStyle: preferredStyle)
        let yes = UIAlertAction(title: "Yes", style: .default) { _ in
            self.navigationController?.popViewController(animated: true)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: {_  in
            self.view.removeBlurView()
        })
        
        alert.addAction(cancel)
        alert.addAction(yes)
        
        present(alert, animated: true, completion: nil)
        
        return alert
    }
    
}

