//
//  UIViewController+CoreKit.swift
//  homeWorkLesson23(WheatherAndNews)2
//
//  Created by Moobat on 15.09.21.
//

import UIKit

extension UIViewController {
    func getViewController(from id: String) -> UIViewController? {
        let storyboard = UIStoryboard(name: id, bundle: nil)
        guard let currentVC = storyboard.instantiateInitialViewController() else { return nil }
        return currentVC
    }
    
    
    func presentSearchAlertController(withTitle title: String?,
                                      massage: String?,
                                      style: UIAlertController.Style,
                                      completionHandler: @escaping (String) -> Void) {
        self.view.addBlurView()
        let alertController = UIAlertController(title: title, message: massage, preferredStyle: style)
        alertController.addTextField { tf in
            tf.placeholder = "enter city name"
            tf.returnKeyType = .done
        }
        let search = UIAlertAction(title: "Search", style: .default) { _ in
            let textField = alertController.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
                let city = cityName.split(separator: " ").joined(separator: "%20")
                completionHandler(city)
            }
            self.view.removeBlurView()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            self.view.removeBlurView()
        }
        alertController.addAction(search)
        alertController.addAction(cancel)
        present(alertController, animated: true, completion: nil)
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
