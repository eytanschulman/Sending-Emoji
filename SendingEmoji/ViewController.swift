//
//  ViewController.swift
//  SendingEmoji
//
//  Created by Eytan Schulman on 12/18/15.
//  Copyright © 2015 MultiEducator. All rights reserved.
//

import UIKit
import WatchConnectivity
import AVFoundation

class ViewController: UIViewController, WCSessionDelegate, AVAudioPlayerDelegate {
    
    @IBOutlet weak var emojiLabel: UILabel!
    
    var session: WCSession!
    var player: AVAudioPlayer! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        session = WCSession.defaultSession()
        session.delegate = self
        session.activateSession()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func session(session: WCSession, didReceiveApplicationContext applicationContext: [String : AnyObject]) {
        let emoji = applicationContext["emoji"] as? String
        
        dispatch_async(dispatch_get_main_queue(), {
            var emojiToChange: String!
            
            if emoji == "Whatever" {
                self.playSound("whatever")
                emojiToChange = "💁🏻"
            } else if emoji == "Welp" {
                self.playSound("welp")
                emojiToChange = "☹️"
            } else if emoji == "Contemplating" {
                self.playSound("contemplating")
                emojiToChange = "🤔"
            } else if emoji == "Ghost" {
                self.playSound("ghost")
                emojiToChange = "👻"
            } else if emoji == "Soccer" {
                self.playSound("soccer")
                emojiToChange = "⚽️"
            } else if emoji == "Crying" {
                self.playSound("crying")
                emojiToChange = "😢"
            }
            self.emojiLabel.text = emojiToChange
            
        })
    }
    
    func playSound(fileName: String!) {
        let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "wav")
        
        let fileURL = NSURL(fileURLWithPath: path!)
        do {
            try player = AVAudioPlayer(contentsOfURL: fileURL)
        } catch {
            print("Error Was: \(error)")
        }
        
        player.prepareToPlay()
        player.delegate = self
        player.play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

