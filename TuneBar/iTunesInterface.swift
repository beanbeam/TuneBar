//
//  ITunesInterface.swift
//  TuneBar
//
//  Created by Colin Clark on 11/11/16.
//  Copyright © 2016 Colin Clark. All rights reserved.
//

import ScriptingBridge

@objc protocol iTunesApplication {
    @objc optional var soundVolume: Int {get}
    @objc optional var currentTrack: iTunesTrack {get}
}

@objc protocol iTunesTrack : Track {
    @objc optional var name: String {get}
    @objc optional var artist: String {get}
}

extension SBApplication : iTunesApplication {}

class iTunesInterface : PlayerInterface {

    private let iTunes : iTunesApplication

    init() {
        iTunes = SBApplication(bundleIdentifier: "com.apple.iTunes") as! iTunesApplication
    }

    var currentTrack: Track? {
        get {
            return iTunes.currentTrack
        }
    }
}
