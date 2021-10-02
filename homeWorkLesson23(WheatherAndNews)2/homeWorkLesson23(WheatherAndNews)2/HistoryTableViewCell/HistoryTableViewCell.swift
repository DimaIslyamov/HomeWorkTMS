//
//  HistoryTableViewCell.swift
//  homeWorkLesson23(WheatherAndNews)2
//
//  Created by Moobat on 2.10.21.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var cityNameLable: UILable!
    @IBOutlet weak var temperatureLable: UILable!
    
    func setupUserHistory(by user: UserHistoriSearch) {
        cityNameLable.text = user.cityName
        temperatureLable.text = String(user.temperature)
    }
    
}
