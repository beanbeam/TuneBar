//
//  AppDelegate.swift
//  TuneBar
//
//  Created by Colin Clark on 11/11/16.
//  Copyright © 2016 Colin Clark. All rights reserved.
//

import Cocoa
import ScriptingBridge

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var statusMenu: NSMenu!
    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)

    var iTunes = iTunesInterface()
    var currentSong : TrackStatus?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem.menu = statusMenu
        currentSong = TrackStatus(forButton: statusItem.button!)

        currentSong!.updateTrack(track: iTunes.currentTrack!)

        DistributedNotificationCenter.default().addObserver(
            self,
            selector: #selector(trackChanged),
            name: NSNotification.Name("com.apple.iTunes.playerInfo"),
            object: nil)
    }

    /**
     * Parses track data from the notification and updates the menu button with
     * the new data. Called when the iTunes track changes.
     */
    func trackChanged(notification: NSNotification) {
        if let trackData = notification.userInfo {
            if let trackName = trackData["Name"] as? String,
               let trackArtist = trackData ["Artist"] as? String {
                currentSong?.updateTrack(name: trackName, artist: trackArtist)
            } else {
                currentSong?.clearTrack()
            }
        }
    }

    /**
     * Closes the application. Called when the quit menu item is selected.
     */
    @IBAction func quitClicked(_ sender: NSMenuItem) {
        NSApplication.shared().terminate(self)
    }
}

