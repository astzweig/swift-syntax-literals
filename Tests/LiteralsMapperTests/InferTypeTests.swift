import XCTest
import SwiftSyntax
import SwiftParser
import SwiftSyntaxBuilder
@testable import LiteralsMapper

final class InferTypeTests: XCTestCase {
    func testInfersTypeOfIntegerLiteral() throws {
        let (literal, type) = try Self.getLiteralAndTypeFromVariableDecl("var luminosity: Int = 5")
        try Self.assertInferedType(of: literal, equals: type)
    }
    
    func testInfersTypeOfStringLiteral() throws {
        let (literal, type) = try Self.getLiteralAndTypeFromVariableDecl(#"var luminosity: String = "bright""#)
        try Self.assertInferedType(of: literal, equals: type)
    }
    
    func testInfersTypeOfDoubleLiteral() throws {
        let (literal, type) = try Self.getLiteralAndTypeFromVariableDecl("var luminosity: Double = 1.5")
        try Self.assertInferedType(of: literal, equals: type)
    }
    
    func testInfersTypeOfBooleanLiteral() throws {
        let (literal, type) = try Self.getLiteralAndTypeFromVariableDecl("var turnLightOn: Bool = true")
        try Self.assertInferedType(of: literal, equals: type)
    }
    
    func testInfersTypeOfRegexLiteral() throws {
        let (literal, type) = try Self.getLiteralAndTypeFromVariableDecl("var regexParser: Regex = /(.+?): (.+)/")
        try Self.assertInferedType(of: literal, equals: type)
    }
    
    func testDoesNotInferTypeOfRegexInitializer() throws {
        let (literal, _) = try Self.getLiteralAndTypeFromVariableDecl(#"var regexParser: Regex = try Regex("[0-9]+")"#)
        XCTAssertNil(literal.inferedType)
    }
    
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
