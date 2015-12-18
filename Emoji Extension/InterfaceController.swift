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
    
    func sendEmoji(emoji: String) {
        let applicationDict = ["emoji":emoji]
        do {
            try session.updateApplicationContext(applicationDict)
        } catch {
            print("Error")
        }
    }
    
    @IBAction func whateverPressed() {
        self.sendEmoji("Whatever")
    }
    
    @IBAction func welpPressed() {
        self.sendEmoji("Welp")
    }
    
    @IBAction func ghostPressed() {
        self.sendEmoji("Ghost")
    }
    
    @IBAction func criesPressed() {
        self.sendEmoji("Crying")
    }
    
    @IBAction func contemplatingPressed() {
        self.sendEmoji("Contemplating")
    }
    
    @IBAction func soccerPressed() {
        self.sendEmoji("Soccer")
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
