import XCTest
@testable import FiestaUI

enum TestColor: String {
    case red = "#FF0000"
    case green = "#00FF00"
    case blue = "#0000FF"
}

final class FiestaThemeTests: XCTestCase {
    let accuracy = 0.01

    func testColorHexStringBlackToRGB() throws {

        // Given a hex string for black
        let hexString = FiestaColor.black

        // When converted to RGB tuple
        let rgb = hexString.toRGB()

        // Then the the tuple values should all be zeroed out
        XCTAssertEqual(rgb.0, 0.0, accuracy: accuracy)
        XCTAssertEqual(rgb.1, 0.0, accuracy: accuracy)
        XCTAssertEqual(rgb.2, 0.0, accuracy: accuracy)
    }

    func testColorHexStringWhiteToRGB() throws {

        // Given a hex string for white
        let hexString = FiestaColor.white

        // When converted to RGB tuple
        let rgb = hexString.toRGB()

        // Then the the tuple values should all be around 1.0
        XCTAssertEqual(rgb.0, 1.0, accuracy: accuracy)
        XCTAssertEqual(rgb.1, 1.0, accuracy: accuracy)
        XCTAssertEqual(rgb.2, 1.0, accuracy: accuracy)
    }

    func testColorHexStringRedToRGB() throws {

        // Given a hex string for red
        let hexString = TestColor.red

        // When converted to RGB tuple
        let rgb = hexString.toRGB()

        // Then the the tuple values should only have the red component as 1.0
        XCTAssertEqual(rgb.0, 1.0, accuracy: accuracy)
        XCTAssertEqual(rgb.1, 0.0, accuracy: accuracy)
        XCTAssertEqual(rgb.2, 0.0, accuracy: accuracy)
    }

    func testColorHexStringGreenToRGB() throws {

        // Given a hex string for green
        let hexString = TestColor.green

        // When converted to RGB tuple
        let rgb = hexString.toRGB()

        // Then the the tuple values should only have the green component as 1.0
        XCTAssertEqual(rgb.0, 0.0, accuracy: accuracy)
        XCTAssertEqual(rgb.1, 1.0, accuracy: accuracy)
        XCTAssertEqual(rgb.2, 0.0, accuracy: accuracy)
    }

    func testColorHexStringBlueToRGB() throws {

        // Given a hex string for blue
        let hexString = TestColor.blue

        // When converted to RGB tuple
        let rgb = hexString.toRGB()

        // Then the the tuple values should only have the blue component as 1.0
        XCTAssertEqual(rgb.0, 0.0, accuracy: accuracy)
        XCTAssertEqual(rgb.1, 0.0, accuracy: accuracy)
        XCTAssertEqual(rgb.2, 1.0, accuracy: accuracy)
    }

}

