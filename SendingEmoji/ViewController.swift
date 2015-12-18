//
//  ViewController.swift
//  SendingEmoji
//
//  Created by Eytan Schulman on 12/18/15.
//  Copyright © 2015 MultiEducator. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {
    
    @IBOutlet weak var emojiLabel: UILabel!
    
    var session: WCSession!

    override func viewDidLoad() {
        super.viewDidLoad()
        session = WCSession.defaultSession()
        session.delegate = self
        session.activateSession()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func session(session: WCSession, didReceiveApplicationContext applicationContext: [String : AnyObject]) {
        let emoji = applicationContext["emoji"] as? Emoji
        
        dispatch_async(dispatch_get_main_queue(), {
            self.emojiLabel.text = "Last Emoji: \(emoji?.emoji)"
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

