//
//  VideoPlayerViewController.swift
//  SwiftTutorial20170627
//
//  Created by ParkD on 2017. 7. 18..
//  Copyright © 2017년 ParkD. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoPlayerViewController: UIViewController {

    let avPlayerViewController = AVPlayerViewController()
    var avPlayer:AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let videoURL = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        avPlayer = AVPlayer(url: videoURL!)
        avPlayerViewController.avPlayer = avPlayer
        
        
//        let player = AVPlayer(url: videoURL!)
//        let playerLayer = AVPlayerLayer(player: player)
//        playerLayer.frame = self.view.bounds
//        self.view.layer.addSublayer(playerLayer)
//        player.play()

//        let movieURL = URL(string: "http://techslides.com/demos/sample-videos/small.mp4")
//        if let url = movieURL{
//            avPlayer = AVPlayer(url: url)
//            avPlayerViewController.player = avPlayer
//            
//        }
        
    }


    @IBAction func playVideo(_ sender: Any) {
        
        present(avPlayerViewController, animated: true, completion: {
            self.avPlayer?.play()
        })
        
        
        
//        let videoURL = NSURL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
//        avPlayer = AVPlayer(url: videoURL! as URL)
//        let playerLayer = AVPlayerLayer(player: avPlayer)
//        playerLayer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 3.0 / 4.0)
//        self.view.layer.addSublayer(playerLayer)
//        avPlayer?.play()
        
        
//        let url = URL(string:
//            "http://www.ebookfrenzy.com/ios_book/movie/movie.mov")
//        
//        let player = AVPlayer(url: url!)
//        let playerController = AVPlayerViewController()
//        
//        playerController.avPlayer = player
//        self.addChildViewController(playerController)
//        self.view.addSubview(playerController.view)
//        playerController.view.frame = self.view.frame
//        
//        player.play()
        
        
//        let videoURL = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
//        let player = AVPlayer(url: videoURL!)
//        let playerViewController = AVPlayerViewController()
//        playerViewController.avPlayer = player
//        self.present(playerViewController, animated: true) {
//            playerViewController.avPlayer!.play()
//        }
    }


}
