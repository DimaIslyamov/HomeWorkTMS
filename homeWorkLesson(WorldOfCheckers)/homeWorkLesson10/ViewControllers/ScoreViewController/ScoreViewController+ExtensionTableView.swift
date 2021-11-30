//
//  ScoreViewController+ExtensionTableView.swift
//  homeWorkLesson10
//
//  Created by Moobat on 30.11.21.
//

import UIKit

extension ScoreViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreTableViewCell") as? ScoreTableViewCell else { return UITableViewCell() }
        
        cell.setData(with: dataSource[indexPath.row])
        
        return cell
    }
    
    
}

extension ScoreViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 163.0
    }
}
