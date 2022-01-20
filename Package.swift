// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "AMap3DMapKitNoIDFA",
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
    )
  ],
  targets: [
    .target(
      name: "AMap3DMapKit",
      dependencies: [
        .product(name: "AMapFoundationKit", package: "AMapFoundationKitNoIDFA")
      ],
      path: "Sources/AMap3DMapKit"
    ),
    .binaryTarget(name: "MAMapKit", path: "Vendor/MAMapKit.xcframework")
  ]
)
