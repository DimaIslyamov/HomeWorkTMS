//
//  HistoryTableViewController+TableViewDelegateDataSource.swift
//  homeWorkLesson23(WheatherAndNews)2
//
//  Created by Moobat on 6.10.21.
//

import UIKit

extension HistoryTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell") as? HistoryTableViewCell else { return UITableViewCell() }
        
        cell.setupUserHistory(by: users[indexPath.row])
        
        return cell
    }
}




extension HistoryTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 62.0
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deketeItem = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            print("Delete")
            tableView.beginUpdates()
            
            // дописать удаление ячеек таблицы
            
            tableView.deleteRows(at: [indexPath], with: .left)
            tableView.beginUpdates()
        }
        let swipeAtion = UISwipeActionsConfiguration(actions: [deketeItem])
        return swipeAtion
    }
}
