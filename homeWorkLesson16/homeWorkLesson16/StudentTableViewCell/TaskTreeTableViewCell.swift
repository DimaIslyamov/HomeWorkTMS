//
//  TaskTreeTableViewCell.swift
//  homeWorkLesson16
//
//  Created by Moobat on 8.08.21.
//

import UIKit

class TaskTreeTableViewCell: UITableViewCell {

    @IBOutlet weak var studentNameLable: UILabel!
    @IBOutlet weak var avgMarkLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setLabels(name: String, avgMark: Double) {
        studentNameLable.text = "\(name)"
        avgMarkLable.text = String(format: "%.2f", avgMark)
        studentNameLable.textColor = avgMark < 3.0 ? UIColor.red : UIColor.black
    }
    
}
