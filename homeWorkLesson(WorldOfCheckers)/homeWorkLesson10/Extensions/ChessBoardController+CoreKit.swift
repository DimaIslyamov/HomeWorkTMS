//
//  ChessBoardController+CoreKit.swift
//  homeWorkLesson10
//
//  Created by Moobat on 3.08.21.
//

import UIKit

extension UIViewController {
    
    func presentAlertController(with title: String?, massage: String?, preferredStyle: UIAlertController.Style = .alert, actions: UIAlertAction...) -> UIAlertController {
//        self.view.addBlurView()
        let alert = UIAlertController(title: title, message: massage, preferredStyle: preferredStyle)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: {_  in
            UserDefaults.standard.removeObject(forKey: "timerT")
//            self.view.removeBlurView()
            self.navigationController?.popViewController(animated: true)
        })
        
        actions.forEach { alert.addAction($0) }
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
        
        return alert
    }
    
}

