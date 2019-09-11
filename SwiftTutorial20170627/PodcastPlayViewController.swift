//
//  PodcastPlayViewController.swift
//  Swift20170717
//
//  Created by imac on 2017. 7. 18..
//  Copyright © 2017년 imac. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import CoreData

class PodcastPlayViewController: UIViewController {
    var data:PodData!
    var player:AVPlayer!
    var timer:Timer!
    var playData:PodcastPlay!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    

    @IBAction func onPlayClick(_ sender: Any) {
        let item = AVPlayerItem(url: URL(string: data.url)!)
        player = AVPlayer(playerItem: item)
        player.play()
        
        if playData != nil{
            player.seek(to: CMTime(seconds: Double(playData.position), preferredTimescale: 1))
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
    }
    @IBAction func onStopClick(_ sender: Any) {
        if player != nil{
            player.pause()
            player = nil
        }
    }
    @IBOutlet var playSlider: UISlider!
    @IBOutlet var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = data.title
        playData = getPlayInfo()
        if playData == nil{
            // save new playData in the core data
            let entity = NSEntityDescription.entity(forEntityName: "PodcastPlay", in: context)
            playData = PodcastPlay(entity: entity!, insertInto: context)
            playData.position = 0.0
            playData.url = data.url
            do{
                try context.save()
            }catch{
                print(error)
            }
        }
        
    }

    func getPlayInfo()->PodcastPlay?{
        let entity = NSEntityDescription.entity(forEntityName: "PodcastPlay", in: context)
        let request:NSFetchRequest<PodcastPlay> = PodcastPlay.fetchRequest()
        request.entity = entity
        request.predicate = NSPredicate(format: "(url = %@)", data.url)
        
        do{
            var results = try context.fetch(request)
            if results.count > 0 {
                return results[0]
            }else{
                print("No match data")
            }
        }catch{
            print(error)
        }
        
        return nil
    }

    @objc func updateSlider(){
        if player != nil {
            if let duration = player.currentItem?.duration {
                let totalSeconds = Float(CMTimeGetSeconds(duration))
                let currentSeconds = Float(player.currentTime().seconds)
                playSlider.value =  currentSeconds / totalSeconds
                
                if playData != nil {
                    playData.position = currentSeconds
                    do {
                        try context.save()
                    }catch{
                        print(error)
                    }
                }
            }
        }
    }

}
