//
//  InterfaceController.swift
//  Emoji Extension
//
//  Created by Eytan Schulman on 12/18/15.
//  Copyright © 2015 MultiEducator. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController, WCSessionDelegate {
    
    var session : WCSession!
    
    override init() {
        super.init()
        if WCSession.isSupported() {
            session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }
    
    func sendEmoji(emoji: Emoji) {
        let applicationDict = ["emoji":emoji]
        do {
            try session.updateApplicationContext(applicationDict)
        } catch {
            print("Error")
        }
    }
    
    @IBAction func whateverPressed() {
        self.sendEmoji(Emoji(e: EmojiEnum.Whatever))
    }
    
    @IBAction func welpPressed() {
        self.sendEmoji(Emoji(e: EmojiEnum.Welp))
    }
    
    @IBAction func ghostPressed() {
        self.sendEmoji(Emoji(e: EmojiEnum.Ghost))
    }
    
    @IBAction func criesPressed() {
        self.sendEmoji(Emoji(e: EmojiEnum.Crying))
    }
    
    @IBAction func contemplatingPressed() {
        self.sendEmoji(Emoji(e: EmojiEnum.Contemplating))
    }
    
    @IBAction func soccerPressed() {
        self.sendEmoji(Emoji(e: EmojiEnum.Soccer))
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}
