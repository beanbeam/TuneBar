import Cocoa

class TrackStatus {

    static let NAME_FONT = NSFont.systemFont(
        ofSize: 12, weight: NSFontWeightBold)

    static let ARTIST_FONT = NSFont.systemFont(
        ofSize: 12, weight: NSFontWeightThin)

    /// The statusbar button to display track information on
    let statusButton: NSStatusBarButton


    /**
     * Creates a new TrackStatus object for updating the text on the given
     * menu button.
     *
     * - parameter forButton: The statusbar button to display track
     *                        information on
     */
    init(forButton: NSStatusBarButton) {
        statusButton = forButton
    }

    func updateTrack(track: Track) {
        updateTrack(name: track.name, artist: track.artist)
    }

    func updateTrack(name: String, artist: String) {
        statusButton.attributedTitle = buildAttributedString(
            name: name, artist: artist)
    }

    func clearTrack() {
        statusButton.title = ""
    }

    private func buildAttributedString(name: String, artist: String) -> NSAttributedString {
        let spacing = " "
        let baseString = name + spacing + artist

        let nameLength = name.characters.count
        let artistLength = artist.characters.count
        let spacingLength = spacing.characters.count

        let nameStart = 0
        let artistStart = nameStart + nameLength + spacingLength

        let attributedString = NSMutableAttributedString(string: baseString)

        attributedString.addAttribute(
            NSFontAttributeName, value: TrackStatus.NAME_FONT,
            range: NSRange(location: nameStart, length: nameLength))

        attributedString.addAttribute(
            NSFontAttributeName, value: TrackStatus.ARTIST_FONT,
            range: NSRange(location: artistStart, length: artistLength))

        return attributedString
    }
}
