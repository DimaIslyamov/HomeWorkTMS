//
//  TaskTwoTableViewCell.swift
//  homeWorkLesson16
//
//  Created by Moobat on 8.08.21.
//

import UIKit

class TaskTwoTableViewCell: UITableViewCell {

    @IBOutlet weak var lable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func setColorAndName(value: ColorAndName) {
        lable.attributedText = NSAttributedString(string: value.name, attributes: [.foregroundColor: value.color])
    }

}
