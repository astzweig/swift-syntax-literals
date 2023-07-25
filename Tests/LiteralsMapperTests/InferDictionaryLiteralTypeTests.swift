import XCTest

final class InferDictionaryLiteralTypeTests: InferTypeTests {
    func testInfersTypeOfStringIntDictionaryInitializer() throws {
        let (literal, type) = try Self.getLiteralAndTypeFromVariableDecl(#"var luminosity: [String:Int] = ["kitchen": 12, "livingroom": 5]"#)
        try Self.assertInferedType(of: literal, equals: type)
    }
    
    func testInfersTypeOfNestedStringIntDictionaryInitializer() throws {
        let (literal, type) = try Self.getLiteralAndTypeFromVariableDecl(#"var luminosity: [String:[String:Int]] = ["byRoom": ["kitchen": 12, "livingroom": 5]]"#)
        try Self.assertInferedType(of: literal, equals: type)
    }
    
    func testDoesNotInferTypeOfNonLiteralDictionaryElements() throws {
        let (literal, _) = try Self.getLiteralAndTypeFromVariableDecl(#"var luminosityHistory: [String:OtherType()] = ["kitchen": OtherType(), "livingroom": OtherType()]"#)
        XCTAssertNil(literal.inferedType)
    }
}
