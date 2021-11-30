//
//  ScoreViewController.swift
//  homeWorkLesson10
//
//  Created by Moobat on 21.07.21.
//

import UIKit

class ScoreViewController: UIViewController {
    // MARK: - @OUTLETS
    
    @IBOutlet var buttonViewCollection: [UIView]!
    @IBOutlet var buttonOutletCollection: [UIButton]!
    @IBOutlet weak var backButtonOutlet: UIButton!
    @IBOutlet weak var clearButtonOutlet: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    
    var dataSource: [Game_mDB] = []
    var players: [Player_mDB] = []
    
    
    // MARK: - Жизненный цикл

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let game = CoreDataManager.shatred.getGame()
        dataSource = game
        
        setupTableView()
        localaized()
        backButtonCostamization()
    }
    
    
    // MARK: - Методы
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ScoreTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "ScoreTableViewCell")
        tableView.tableFooterView = UIView()
    }
    
    
    func localaized() {
        backButtonOutlet.setTitle("Back_button_score".localaized, for: .normal)
        clearButtonOutlet.setTitle("clear_button_score".localaized, for: .normal)
    }
    
    
    func backButtonCostamization() {
        buttonOutletCollection.forEach { (button) in
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.cornerRadius = 12
        }
        
        buttonViewCollection.forEach { (view) in
            view.layer.cornerRadius = 12
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowRadius = 4
            view.layer.shadowOpacity = 0.9
            view.layer.shadowOffset = CGSize(width: 5, height: 5)
        }
    }
    
    
    
    // MARK: - @IBAction

    @IBAction func backButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func clearHistoryBattle(_ sender: UIButton) {
        CoreDataManager.shatred.deletAllData()
        dataSource = []
        tableView.reloadData()
    }
}
