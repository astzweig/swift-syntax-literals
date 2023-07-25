import SwiftSyntax
import SwiftSyntaxBuilder

public extension DictionaryExprSyntax {
    var inferedType: TypeSyntax? {
        guard let elementExpr = self.content.as(DictionaryElementListSyntax.self)?.first,
              let keyType = elementExpr.keyExpression.inferedType,
              let valueType = elementExpr.valueExpression.inferedType
        else { return nil }
        return DictionaryTypeSyntax(keyType: keyType, valueType: valueType).as(TypeSyntax.self)
    }
}
