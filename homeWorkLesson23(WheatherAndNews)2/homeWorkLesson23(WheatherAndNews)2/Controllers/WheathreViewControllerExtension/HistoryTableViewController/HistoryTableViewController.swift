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
    
    var notificationToken: NotificationToken?
    var tableViewCell: HistoryTableViewCell?
    
    var users: [UserHistoriSearch] = [] {
        didSet{
            tableView.reloadData()
        }
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        notificationTokenObserver()
    }
    
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        notificationToken?.invalidate()
        notificationToken = nil
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setuoTableView()
    }
    
    
    
    func notificationTokenObserver() {
        notificationToken = RealmManager.shared.getCityAndTemp().observe(on: .main, { change in
            switch change {
            
            case .initial(let collection):
                self.users = collection.shuffled()
                
            case .update(let collection, let deletions, let insertions, let modifications):
                self.users = collection.shuffled()
                print("deletions \(deletions)")
                print("insertions \(insertions)")
                print("modifications \(modifications)")
                break
                
            case .error(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    
    
    func setuoTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        
        tableView.register(UINib(nibName: "HistoryTableViewCell",
                                 bundle: nil),
                           forCellReuseIdentifier: "HistoryTableViewCell")
    }
    
    
    @IBAction func backButton(_ sender: UIButton) {
        
    }
}
