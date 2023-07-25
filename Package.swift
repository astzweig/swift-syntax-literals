// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "swift-syntax-literals",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13)],
    products: [
        .library(
            name: "LiteralsMapper",
            targets: ["LiteralsMapper"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", from: "509.0.0-swift-5.9-DEVELOPMENT-SNAPSHOT-2023-04-25-b")
    ],
    targets: [
        .target(
            name: "LiteralsMapper",
            dependencies: [
                .product(name: "SwiftSyntax", package: "swift-syntax"),
                .product(name: "SwiftSyntaxBuilder", package: "swift-syntax")
            ]
        ),
        .testTarget(
            name: "LiteralsMapperTests",
            dependencies: ["LiteralsMapper"])
    ]
)
