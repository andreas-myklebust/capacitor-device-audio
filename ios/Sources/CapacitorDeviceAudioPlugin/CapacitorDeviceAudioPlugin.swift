import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(CapacitorDeviceAudioPlugin)
public class CapacitorDeviceAudioPlugin: CAPPlugin, CAPBridgedPlugin {
  public let identifier = "CapacitorDeviceAudioPlugin"
  public let jsName = "CapacitorDeviceAudio"
  public let pluginMethods: [CAPPluginMethod] = [
    CAPPluginMethod(name: "playVoiceCallAudio", returnType: CAPPluginReturnPromise),
    CAPPluginMethod(name: "playRingAudio", returnType: CAPPluginReturnPromise)
  ]
  private let implementation = CapacitorDeviceAudio()

  @objc func playVoiceCallAudio(_ call: CAPPluginCall) {
    let src = call.getString("src") ?? ""
    call.resolve([
      "src": implementation.playVoiceCallAudio(src)
    ])
  }

  @objc func playRingAudio(_ call: CAPPluginCall) {
    let src = call.getString("src") ?? ""
    call.resolve([
      "src": implementation.playRingAudio(src)
    ])
  }
}
