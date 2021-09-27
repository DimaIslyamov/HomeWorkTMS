//
//  WheathreViewController+Media.swift
//  homeWorkLesson23(WheatherAndNews)2
//
//  Created by Moobat on 25.09.21.
//

import UIKit
import AVFoundation
import AVKit

extension WheathreViewController {
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
}
