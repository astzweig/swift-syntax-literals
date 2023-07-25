import XCTest
import SwiftSyntax
import SwiftParser
import SwiftSyntaxBuilder
@testable import LiteralsMapper

class InferTypeTests: XCTestCase {
    static func assertInferedType(of literal: ExprSyntax, equals type: TypeSyntax) throws {
        let inferedType = try XCTUnwrap(literal.inferedType)
        XCTAssertEqual(inferedType.description, type.description)
    }
    
    static func getLiteralAndTypeFromVariableDecl(_ declaration: String) throws -> (ExprSyntax, TypeSyntax) {
        let variableDeclaration: VariableDeclSyntax = try SyntaxParsers.parseFirstStatement(from: declaration)
        let binding = try XCTUnwrap( variableDeclaration.bindings.first?.as(PatternBindingSyntax.self) )
        let literal = try XCTUnwrap(binding.initializer?.value.trimmed)
        let type = try XCTUnwrap(binding.typeAnnotation?.type.as(TypeSyntax.self)?.trimmed)
        return (literal, type)
    }
}
