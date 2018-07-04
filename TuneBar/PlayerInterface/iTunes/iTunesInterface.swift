import ScriptingBridge

class iTunesInterface : PlayerInterface {

    required init?(listener: PlayerListener) {
        self.listener = listener

        DistributedNotificationCenter.default().addObserver(
            self,
            selector: #selector(trackChanged),
            name: NSNotification.Name("com.apple.iTunes.playerInfo"),
            object: nil)

        guard let iTunes = SBApplication.iTunes() else { return nil }

        if let currentTrack = iTunes.currentTrack {
            self.listener.trackStarted(
                title: currentTrack.name!,
                artist: currentTrack.artist!)
        }
    }

    /**
     Parses track data from the notification and updates the listener with the new data. Called when
     the iTunes track changes.
     */
    @objc func trackChanged(notification: NSNotification) {
        if let trackData = notification.userInfo {
            let state = trackData["Player State"] as? String

            if state == "Playing",
                let trackTitle = trackData["Name"] as? String,
                let trackArtist = trackData ["Artist"] as? String {

                self.listener.trackStarted(title: trackTitle, artist: trackArtist)
            } else {
                self.listener.trackStopped()
            }
        }
    }

    private let listener: PlayerListener
}
