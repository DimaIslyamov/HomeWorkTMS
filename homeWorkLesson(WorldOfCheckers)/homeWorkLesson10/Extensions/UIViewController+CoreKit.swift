//
//  ChessBoardController+CoreKit.swift
//  homeWorkLesson10
//
//  Created by Moobat on 3.08.21.
//

import UIKit

extension UIViewController {
    func getViewController(from id: String) -> UIViewController? {
        let storyboard = UIStoryboard(name: id, bundle: nil)
        guard let currentVC = storyboard.instantiateInitialViewController() else { return nil }
        return currentVC
    }
    
    func presentAlertController(with title: String?, massage: String?, preferredStyle: UIAlertController.Style = .alert, actions: UIAlertAction...) -> UIAlertController {
        self.view.addBlurView()
        let alert = UIAlertController(title: title, message: massage, preferredStyle: preferredStyle)
        let cancel = UIAlertAction(title: "Cancel_".localaized, style: .cancel) { _ in
            self.view.removeBlurView()
        }
        actions.forEach { alert.addAction($0) }
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
        return alert
    }
    
    
    func setBackground(with name: String) -> UIView {
        let imageView = UIImageView(image: UIImage(named: name))
        let ImageViewSize = CGSize(width: view.bounds.size.width, height: view.bounds.size.height)
        
        imageView.frame = CGRect(origin: .zero, size: ImageViewSize)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.zPosition = -1
        
        return imageView
    }
}

