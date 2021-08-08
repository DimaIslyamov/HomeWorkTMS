//
//  ViewController.swift
//  homeWorkLesson16
//
//  Created by Moobat on 8.08.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
   
}


// MARK: - Extension


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskOneTableViewCell") as? TaskOneTableViewCell else {
            return UITableViewCell()
        }
        for _ in 0..<200 {
            let green = Int.random(in: 0...255)
            let red = Int.random(in: 0...255)
            let blue = Int.random(in: 0...255)
            cell.lable.textColor = UIColor(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: 1)
            cell.lable.text = "RGB: (\(red), \(green), \(blue))"
        }
        return cell
    }
    
    
    
}

extension ViewController: UITableViewDelegate {
    
    
}

