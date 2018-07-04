extension TrackStatusItem : PlayerListener {

    func trackStarted(title: String, artist: String) {
        self.setTitle(trackTitle: title, trackArtist: artist)
    }

    func trackStopped() {
        self.clearTitle()
    }
}
