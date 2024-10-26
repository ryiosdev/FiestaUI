import XCTest
@testable import FiestaUI

final class FiestaThemeTests: XCTestCase {
    let accuracy = 0.001

    func testColorHexStringBlackToRGB() throws {
        // Given a value for black
        let black = FiestaColor.black

        // When converted to RGB tuple
        let rgb = black.toRGB()

        // Then the the tuple values should all be zeroed out
        XCTAssertEqual(rgb.r, 0.0, accuracy: accuracy)
        XCTAssertEqual(rgb.g, 0.0, accuracy: accuracy)
        XCTAssertEqual(rgb.b, 0.0, accuracy: accuracy)
    }

    func testColorHexStringWhiteToRGB() throws {
        // Given a value for white
        let white = FiestaColor.white

        // When converted to RGB tuple
        let rgb = white.toRGB()

        // Then the the tuple values should all be around 1.0
        XCTAssertEqual(rgb.r, 1.0, accuracy: accuracy)
        XCTAssertEqual(rgb.g, 1.0, accuracy: accuracy)
        XCTAssertEqual(rgb.b, 1.0, accuracy: accuracy)
    }

    func testColorHexStringRedToRGB() throws {
        // Given a value for red
        let red = FiestaColor.red

        // When converted to RGB tuple
        let rgb = red.toRGB()

        // Then the the tuple values should match hex theme's hex string for "Red" which is "#dc291e"
        var col = Double(Int("dc", radix: 16)!) / 255.0
        XCTAssertEqual(rgb.r, col, accuracy: accuracy)
        col = Double(Int("29", radix: 16)!) / 255.0
        XCTAssertEqual(rgb.g, col, accuracy: accuracy)
        col = Double(Int("1e", radix: 16)!) / 255.0
        XCTAssertEqual(rgb.b, col, accuracy: accuracy)
    }
}

