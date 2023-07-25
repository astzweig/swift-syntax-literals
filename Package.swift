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
    targets: [
        .target(name: "LiteralsMapper")
    ]
)
