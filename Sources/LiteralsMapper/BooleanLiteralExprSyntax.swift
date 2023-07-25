import SwiftSyntax
import SwiftSyntaxBuilder

public extension BooleanLiteralExprSyntax {
    var inferedType: TypeSyntax? { "Bool" }
}
