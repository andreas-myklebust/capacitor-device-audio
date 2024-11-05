// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CapacitorDeviceAudio",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "CapacitorDeviceAudio",
            targets: ["CapacitorDeviceAudioPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", branch: "main")
    ],
    targets: [
        .target(
            name: "CapacitorDeviceAudioPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/CapacitorDeviceAudioPlugin"),
        .testTarget(
            name: "CapacitorDeviceAudioPluginTests",
            dependencies: ["CapacitorDeviceAudioPlugin"],
            path: "ios/Tests/CapacitorDeviceAudioPluginTests")
    ]
)