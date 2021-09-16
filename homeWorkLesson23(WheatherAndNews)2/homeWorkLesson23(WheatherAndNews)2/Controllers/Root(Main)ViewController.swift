//
//  Root(Main)ViewController.swift
//  homeWorkLesson23(WheatherAndNews)2
//
//  Created by Moobat on 15.09.21.
//

import UIKit
import SSBouncyButton

class WheathreViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var wheathreIconImage: UIImageView!
    @IBOutlet weak var temperatureLable: UILabel!
    @IBOutlet weak var feelsLike: UILabel!
    @IBOutlet weak var cityNameLable: UILabel!
    @IBOutlet weak var lableFeelsLikeText: UILabel!
    @IBOutlet weak var mainSearchButton: UIView!
    @IBOutlet weak var miniSearchButton: UIView!
    
    var followButton = SSBouncyButton()
    
    
    var city = ""
    
    var wheather: [Wheather] = [] {
        didSet {
            DispatchQueue.main.async {
                self.setWheather(self.wheather)
                print()
            }
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        wheathreIconImage.isHidden = true
        temperatureLable.isHidden = true
        feelsLike.isHidden = true
        cityNameLable.isHidden = true
        lableFeelsLikeText.isHidden = true
        miniSearchButton.isHidden = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settuoForSSButton()
        view.addSubview(setBackground(with: "WheathreBackground"))
    }
    
    
    
    @objc func buttonDidPress(_ sender: UIButton) {
        followButton.isSelected = !followButton.isSelected
    }
    
    
    
    @IBAction func searchButton(_ sender: UIButton) {
        presentSearchAlertController()
    }
    
}
