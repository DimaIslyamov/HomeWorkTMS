//
//  HistoryTableViewCell.swift
//  homeWorkLesson23(WheatherAndNews)2
//
//  Created by Moobat on 2.10.21.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameCityLable: UILabel!
    @IBOutlet weak var tempLable: UILabel!
    
    
    func setupUserHistory(by user: UserHistoriSearch) {
        nameCityLable.text = user.cityName
        tempLable.text = String(user.temperature)
    }
}
