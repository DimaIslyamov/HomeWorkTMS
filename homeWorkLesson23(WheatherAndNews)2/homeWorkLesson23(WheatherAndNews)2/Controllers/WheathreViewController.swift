//
//  WheathreViewController.swift
//  homeWorkLesson23(WheatherAndNews)2
//
//  Created by Moobat on 15.09.21.
//

import UIKit
import SSBouncyButton
import AVFoundation
import AVKit

class WheathreViewController: UIViewController {
    
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var wheathreIconImage: UIImageView!
    @IBOutlet weak var temperatureLable: UILabel!
    @IBOutlet weak var feelsLike: UILabel!
    @IBOutlet weak var cityNameLable: UILabel!
    @IBOutlet weak var lableFeelsLikeText: UILabel!
    @IBOutlet weak var miniSearchButton: UIView!
    
    var followButton = SSBouncyButton()
    var player: AVPlayer?
    var playerMusic: AVPlayer?
    
    var city = ""
    
    var wheather: [Wheather] = [] {
        didSet {
            DispatchQueue.main.async {
                self.setWheather(self.wheather)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         
        player?.play()
        playerMusic?.play()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        player?.pause()
        playerMusic?.pause()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgraundVideoView()
        setBackgroundMusic()
        settuoForSSButton()
    }
    
    
    
    
    
    @IBAction func switchOffOn(_ sender: UISwitch) {
        if sender.isOn {
            self.playerMusic?.play()
        } else {
            self.playerMusic?.pause()
        }
    }
    
    
    @objc func buttonDidPress(_ sender: UIButton) {
        followButton.isSelected = !followButton.isSelected
    }
    
    
    
    @IBAction func searchButton(_ sender: UIButton) {
        presentSearchAlertController()
    }
    
}
