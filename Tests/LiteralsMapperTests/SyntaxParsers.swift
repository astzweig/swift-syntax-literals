import XCTest
import SwiftParser
import SwiftSyntax

class SyntaxParsers: XCTestCase {
    static func parse(_ source: String) -> SourceFileSyntax {
        return Parser.parse(source: source)
    }
    
    static func parseFirstStatement(from source: String) throws -> CodeBlockItemSyntax.Item {
        let syntaxTree = Self.parse(source)
        XCTAssertEqual(syntaxTree.statements.count, 1)
        
        let firstStatement = try XCTUnwrap(syntaxTree.statements.first?.item)
        return firstStatement
    }
    
    static func parseFirstStatement<T: SyntaxProtocol>(from source: String) throws -> T {
        let syntaxNode = try Self.parseFirstStatement(from: source)
        let convertedNode = try XCTUnwrap(syntaxNode.as(T.self))
        return convertedNode
    }
}
