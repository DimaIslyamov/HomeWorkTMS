//
//  RGBViewController.swift
//  homeWorkLesson16
//
//  Created by Moobat on 8.08.21.
//

import UIKit

class RGBViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var arrayOfColors: [ColorAndName] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for _ in 0..<200 {
            let green = Int.random(in: 0...255)
            let red = Int.random(in: 0...255)
            let blue = Int.random(in: 0...255)
            arrayOfColors.append(ColorAndName(color: UIColor(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: 1), name: "RGB: (\(red), \(green), \(blue))"))
        }
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    
    
    @IBAction func goToTaskTreeButton(_ sender: UIButton) {
        navigationController?.pushViewController(getTaskViewController(from: "StudentViewController"), animated: true)
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

}




// MARK: - Extension


extension RGBViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfColors.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTwoTableViewCell") as? TaskTwoTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setColorAndName(value: arrayOfColors[indexPath.row])
        
        return cell
    }
    
    
}



extension RGBViewController: UITableViewDelegate {
    
}
