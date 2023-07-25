# SwiftSyntax Literals
Extends [`SwiftSyntax`][swift-syntax]'s literal expression types with a computed
property named `inferedType`, that returns the default infered type of a literal.
This is mostly useful for attached macros that act like property wrappers and want
to offer users the convenience of leaving out type annotations. E.g. in the
following case:

```swift
@UserDefault var luminosity = 5
```

which expands to

```swift
var luminosity {
  get {
     ...
     let defaultValue = UserDefaults.standard.object(forKey: "luminosity") as? Int
     return defaultValue ?? 5
  }
}
```

the [`UserDefault`][user-default] macro needs to know the type of `luminosity` in
order to cast the result of [`UserDefaults.standard.object(forKey:)`][userdefaults-objectfor].
Without a simple type inference the user would have been obligated to annotate the type of `luminosity`.

[swift-syntax]: https://github.com/apple/swift-syntax
[user-default]: https://github.com/astzweig/swift-userdefaults-storage
[integer-literal]: https://swiftpackageindex.com/apple/swift-syntax/508.0.1/documentation/swiftsyntax/integerliteralexprsyntax
[userdefaults-objectfor]: https://developer.apple.com/documentation/foundation/userdefaults/1410095-object

## Usage
In your macro or wherever you are using `SwiftSyntax`:

```swift
import LiteralsMapper
// ...
print(someExprSyntax.inferedType)
```

### Conforming simple types
`inferedType` is defined on the following types

- `ExprSyntax`
- `IntegerLiteralExprSyntax`
- `FloatLiteralExprSyntax`
- `StringLiteralExprSyntax`
- `BooleanLiteralExprSyntax`
- `RegexLiteralExprSyntax`

### Conforming complex types
Additionally `inferedType` is defined on `ArrayExprSyntax` and
`DictionaryExprSyntax`. In this case it yields a value only if the structure
contains conforming simple types as specified above, or are nested structures
of them.

## Adding `swift-syntax-literals` as a dependency
To use the `LiteralsMapper` library in a Swift project, add it to the
dependencies for your package:

```swift
let package = Package(
    // name, platforms, products, etc.
    dependencies: [
        // other dependencies
        .package(url: "https://github.com/astzweig/swift-syntax-literals", from: "0.1.0"),
    ],
    targets: [
        .macro(name: "<macro-name>", dependencies: [
            // other dependencies
            .product(name: "LiteralsMapper", package: "swift-syntax-literals"),
        ]),
        // other targets
    ]
)
```

### Supported Versions

The minimum Swift version supported by swiftui-frameless-window releases are detailed below:

swiftui-frameless-window   | Minimum Swift Version
---------------------------|----------------------
`0.1.0 ...`                | 5.9
