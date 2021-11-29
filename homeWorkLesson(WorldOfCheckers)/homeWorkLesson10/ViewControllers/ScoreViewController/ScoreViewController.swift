//
//  ScoreViewController.swift
//  homeWorkLesson10
//
//  Created by Moobat on 21.07.21.
//

import UIKit

class ScoreViewController: UIViewController {
    // MARK: - @OUTLETS
    
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var backButtonOutlet: UIButton!
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
    }
    
    
    func backButtonCostamization() {
        buttonView.layer.cornerRadius = 12
        
        backButtonOutlet.layer.borderWidth = 2
        backButtonOutlet.layer.borderColor = UIColor.black.cgColor
        backButtonOutlet.layer.cornerRadius = 12
        
        buttonView.layer.shadowColor = UIColor.black.cgColor
        buttonView.layer.shadowRadius = 4
        buttonView.layer.shadowOpacity = 0.9
        buttonView.layer.shadowOffset = CGSize(width: 5, height: 5)
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
        return 180
    }
}
