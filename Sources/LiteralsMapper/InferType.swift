import SwiftSyntax
import SwiftSyntaxBuilder

extension ExprSyntax {
    private static let mapping: [String: ExprSyntaxProtocol.Type] = [
        "Int": IntegerLiteralExprSyntax.self,
        "String": StringLiteralExprSyntax.self,
        "Double": FloatLiteralExprSyntax.self,
        "Bool": BooleanLiteralExprSyntax.self
    ]
    
    var inferedType: TypeSyntax? {
        for (inferedType, exprType) in Self.mapping {
            guard self.is(exprType) else { continue }
            return TypeSyntax(stringLiteral: inferedType)
        }
        
        return nil
    }
}
