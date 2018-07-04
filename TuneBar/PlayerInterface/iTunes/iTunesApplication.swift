import Foundation
import ScriptingBridge

@objc protocol iTunesApplication {
    @objc optional var soundVolume: Int { get set }
    @objc optional var playerState: String { get }
    @objc optional var currentTrack: iTunesTrack { get }
}

extension SBApplication : iTunesApplication {
    class func iTunes() -> iTunesApplication? {
        if let iTunes = SBApplication(bundleIdentifier: "com.apple.iTunes") {
            return iTunes
        }

        return nil
    }
}
