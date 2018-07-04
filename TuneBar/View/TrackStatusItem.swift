import Cocoa

class TrackStatusItem : NSObject {

    override init() {
        self.statusItem = NSStatusBar.system.statusItem(
            withLength: NSStatusItem.variableLength)
    }

    func clearTitle() {
        self.statusItem.button!.title = ""
    }

    func setTitle(trackTitle: String, trackArtist: String? = nil) {

        let title = NSMutableAttributedString()

        title.append(NSAttributedString(string: trackTitle, attributes: [
            NSAttributedStringKey.font : Constants.menuBarTrackTitleFont]))

        if let trackArtist = trackArtist {
            title.append(NSAttributedString(string: " "))

            title.append(NSAttributedString(string: trackArtist, attributes: [
                NSAttributedStringKey.font : Constants.menuBarArtistFont]))
        }

        self.statusItem.button!.attributedTitle = title
    }

    private let statusItem: NSStatusItem
}

// Interface Builder Connectors
extension TrackStatusItem {
    @IBOutlet var menu: NSMenu? {
        get {
            return statusItem.menu
        }
        set {
            statusItem.menu = newValue
        }
    }
}
