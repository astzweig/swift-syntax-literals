import SwiftSyntax
import SwiftSyntaxBuilder

public extension ArrayExprSyntax {
    var inferedType: TypeSyntax? {
        guard let elementExpr = self.elements.first?.expression,
              let elementType = elementExpr.inferedType
        else { return nil }
        return ArrayTypeSyntax(elementType: elementType).as(TypeSyntax.self)
    }
}
