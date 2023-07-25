import SwiftSyntax

extension ExprSyntax {
    var inferedType: TypeSyntax? {
        switch Syntax(self).as(SyntaxEnum.self) {
        case .integerLiteralExpr(let node):  return node.inferedType
        case .stringLiteralExpr(let node):   return node.inferedType
        case .floatLiteralExpr(let node):    return node.inferedType
        case .booleanLiteralExpr(let node):  return node.inferedType
        case .regexLiteralExpr(let node):    return node.inferedType
        case .arrayExpr(let node):           return node.inferedType
        default:                             return nil
        }
    }
}
