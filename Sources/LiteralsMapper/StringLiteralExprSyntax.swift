import SwiftSyntax
import SwiftSyntaxBuilder

public extension StringLiteralExprSyntax {
    var inferedType: TypeSyntax? { "String" }
}
