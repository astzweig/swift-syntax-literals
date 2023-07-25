import XCTest

final class InferArrayLiteralTypeTests: InferTypeTests {
    func testInfersTypeOfIntArrayInitializer() throws {
        let (literal, type) = try Self.getLiteralAndTypeFromVariableDecl("var luminosityHistory: [Int] = [10, 5, 7, 1, 18]")
        try Self.assertInferedType(of: literal, equals: type)
    }
    
    func testInfersTypeOfStringArrayInitializer() throws {
        let (literal, type) = try Self.getLiteralAndTypeFromVariableDecl(#"var roomHistory: [String] = ["bathroom", "kitchen", "livingroom"]"#)
        try Self.assertInferedType(of: literal, equals: type)
    }
    
    func testInfersTypeOfNestedStringArrayInitializer() throws {
        let (literal, type) = try Self.getLiteralAndTypeFromVariableDecl(#"var roomHistory: [[String]] = [["bathroom"], ["kitchen", "livingroom"]]"#)
        try Self.assertInferedType(of: literal, equals: type)
    }
    
    func testDoesNotInferTypeOfNonLiteralArrayElements() throws {
        let (literal, _) = try Self.getLiteralAndTypeFromVariableDecl("var luminosityHistory: [OtherType] = [OtherType(), OtherType()]")
        XCTAssertNil(literal.inferedType)
    }
}
