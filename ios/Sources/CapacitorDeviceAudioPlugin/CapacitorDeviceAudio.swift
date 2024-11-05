import Foundation

@objc public class CapacitorDeviceAudio: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
}
