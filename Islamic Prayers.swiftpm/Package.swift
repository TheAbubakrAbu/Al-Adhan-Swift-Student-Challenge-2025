// swift-tools-version: 5.9

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "Islamic Prayers",
    platforms: [
        .iOS("18.1")
    ],
    products: [
        .iOSApplication(
            name: "Islamic Prayers",
            targets: ["AppModule"],
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .asset("AppIcon"),
            accentColor: .presetColor(.orange),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ],
            capabilities: [
                .locationAlwaysAndWhenInUse(purposeString: "Your location is needed for accurate prayer times."),
                .locationWhenInUse(purposeString: "Your location is needed for accurate prayer times.")
            ],
            appCategory: .utilities
        )
    ],
    dependencies: [
        .package(url: "https://github.com/batoulapps/adhan-swift", .exact("1.4.0"))
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            dependencies: [
                .product(name: "Adhan", package: "adhan-swift")
            ],
            path: ".",
            swiftSettings: [
                .enableUpcomingFeature("BareSlashRegexLiterals")
            ]
        )
    ]
)