import XCTest

final class InferSimpleLiteralTypeTests: InferTypeTests {
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
}
