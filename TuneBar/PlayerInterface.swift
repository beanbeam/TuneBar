//
//  PlayerInterface.swift
//  TuneBar
//
//  Created by Colin Clark on 11/11/16.
//  Copyright © 2016 Colin Clark. All rights reserved.
//

import Foundation

protocol PlayerInterface {
    var currentTrack: Track? {get}
}

@objc protocol Track {
    var name: String {get}
    var artist: String {get}
}
