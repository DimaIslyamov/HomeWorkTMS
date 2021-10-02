//
//  HistoryTableViewController.swift
//  homeWorkLesson23(WheatherAndNews)2
//
//  Created by Moobat on 2.10.21.
//

import UIKit
import UserNotifications
import RealmSwift

class HistoryTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var users: [UserHistoriSearch] = [] {
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setuoTableView()
    }
    
    func setuoTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        
        tableView.register(UINib(nibName: "HistoryTableViewCell",
                                 bundle: nil),
                           forCellReuseIdentifier: "HistoryTableViewCell")
    }
}


extension HistoryTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell") as? HistoryTableViewCell else { return UITableViewCell() }
//        cell.setup(by: persons[indexPath.row])
        return cell
    }
}

extension HistoryTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 62.0
    }
}
