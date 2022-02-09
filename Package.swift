// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "AMap3DMapKit",
  platforms: [.iOS(.v13)],
  products: [
    .library(
      name: "AMap3DMapKit",
      targets: ["AMap3DMapKit"]
    ),
  ],
  dependencies: [
    .package(
      name: "AMapFoundationKitNoIDFA",
      url: "https://github.com/akolov/AMapFoundationKitNoIDFA.git",
      .upToNextMajor(from: "1.6.0")
    ),
    .package(
      name: "InterposeKit",
      url: "https://github.com/steipete/InterposeKit.git",
      .upToNextMajor(from: "0.0.2")
    )
  ],
  targets: [
    .binaryTarget(
      name: "MAMapKit",
      path: "Vendor/MAMapKit.xcframework"
    ),
    .target(
      name: "AMap3DMapKit",
      dependencies: [
        .product(name: "AMapFoundationKit", package: "AMapFoundationKitNoIDFA"),
        "MAMapKit"
      ],
      resources: [.process("AMap.bundle")],
      linkerSettings: [
        .linkedFramework("CoreTelephony"),
        .linkedFramework("GLKit"),
        .linkedFramework("SystemConfiguration"),
        .linkedLibrary("c++"),
        .linkedLibrary("z")
      ]
    ),
    .testTarget(
      name: "AMap3DMapKitTests",
      dependencies: ["AMap3DMapKit", "InterposeKit"]
    )
  ]
)
