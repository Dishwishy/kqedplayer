//
//  AppDelegate.swift
//  KQEDRADIO
//
//  Created by Kyle Champlin on 8/24/18.
//  Copyright © 2018 Kyle Champlin. All rights reserved.
//

import Cocoa
import AVKit
import AVFoundation

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)
    var player: AVPlayer?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        if let button = statusItem.button {
            button.image = NSImage(named:NSImage.Name("HeartButton"))
            button.action = #selector(startStream(_:))
        }
        constructMenu()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    

    
    @objc func startStream(_ sender: Any?) {
        let url = URL(string: "https://streams.kqed.org/kqedradio?onsite=true")
        player = AVPlayer(url: url!)
        player?.play()

    }
    
    @objc func stopStream(_ sender: Any?) {
        player?.pause()
        
    }
    
    func constructMenu() {
        let menu = NSMenu()
        
        menu.addItem(NSMenuItem(title: "Start Radio", action: #selector(AppDelegate.startStream(_:)), keyEquivalent: "P"))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Stop Radio", action: #selector(AppDelegate.stopStream(_:)), keyEquivalent: "b"))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit Radio", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
        
        statusItem.menu = menu
    }




}

