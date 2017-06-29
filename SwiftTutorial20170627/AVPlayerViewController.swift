//
//  AVPlayerViewController.swift
//  SwiftTutorial20170627
//
//  Created by ParkD on 2017. 6. 29..
//  Copyright © 2017년 ParkD. All rights reserved.
//

import UIKit
import AVFoundation

class AVPlayerViewController: UIViewController {

    var audioPlayer:AVAudioPlayer!
    
    @IBAction func onStopClick(_ sender: Any) {
        if audioPlayer != nil {
            audioPlayer.stop()
        }
    }
    @IBAction func onPlayClick(_ sender: Any) {
        if audioPlayer != nil {
            audioPlayer.play()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        print("music")
        print(Bundle.main.path(forResource: "music", ofType: "mp3")!)
        
        let url = URL.init(fileURLWithPath: Bundle.main.path(forResource: "music", ofType: "mp3")!)
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.prepareToPlay()
        }catch{
           print(error)
        }
    }

}











