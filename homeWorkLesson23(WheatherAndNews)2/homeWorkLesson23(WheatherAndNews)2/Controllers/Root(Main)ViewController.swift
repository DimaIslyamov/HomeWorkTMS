//
//  Root(Main)ViewController.swift
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
    @IBOutlet weak var mainSearchButton: UIView!
    @IBOutlet weak var miniSearchButton: UIView!
    
    var followButton = SSBouncyButton()
    var player: AVPlayer?
    var playerMusic: AVPlayer?
    
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
        setBackgraundVideoView()
        setBackgroundMusic()
    }
    
    
    func setBackgroundMusic() {
        guard let pathMusic = Bundle.main.path(forResource: "zvuki-prirody", ofType: "mp3") else { return }
        
        let urlMusic = URL(fileURLWithPath: pathMusic)
        let asset = AVAsset(url: urlMusic)
        let playerItem = AVPlayerItem(asset: asset)
        let player = AVPlayer(playerItem: playerItem)
        
        self.playerMusic = player
        player.play()
    }
    
    
    func setBackgraundVideoView() {
        guard let pathVideo = Bundle.main.path(forResource: "Rain - 20885", ofType: "mp4") else { return }
        
        NotificationCenter.default.removeObserver(self)
        
        let urlVideo = URL(fileURLWithPath: pathVideo)
        let asset = AVAsset(url: urlVideo)
        let playerItem = AVPlayerItem(asset: asset)
        let player = AVPlayer(playerItem: playerItem)
        
        self.player = player
        
        let videoLayer = AVPlayerLayer(player: player)
        videoLayer.frame = CGRect(origin: .zero, size: videoView.frame.size)
        videoLayer.videoGravity = .resizeAspectFill
        videoView.layer.addSublayer(videoLayer)
        self.player?.play()
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: playerItem, queue: .main) { _ in
            print("AVPlayer Item Did Play To End Time")
            self.player?.seek(to: .zero)
            self.player?.play()
        }
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
