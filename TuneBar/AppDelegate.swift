import Cocoa
import ScriptingBridge

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    private static let interfaceTypes: [PlayerInterface.Type] = [
        iTunesInterface.self
    ]

    func applicationDidFinishLaunching(_ notification: Notification) {
        initializePlayerInterfaces()
    }

    func initializePlayerInterfaces() {
        var interfaces: [PlayerInterface] = []
        for interfaceType in AppDelegate.interfaceTypes {
            guard let instance = interfaceType.init(listener: self.statusItem) else {
                print("Failed to load player interface of type '\(interfaceType)'.")
                continue
            }

            interfaces.append(instance)
        }
        self.interfaces = interfaces
    }

    @IBOutlet weak var statusItem: TrackStatusItem!

    private var interfaces: [PlayerInterface] = []
}
