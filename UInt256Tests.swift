//
//  UInt256Tests.swift
//  Crypto Coin Swift
//
//  Created by Sjors Provoost on 24-06-14.
//

import XCTest
import CryptoCoin

class UInt256Tests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInitWith16BitMaxHex() {
        // The largest value for an unsigned 16 bit integer is 2^16 - 1
        let bi = UInt256(hexStringValue: "FFFF")
        
        XCTAssertTrue(bi != nil, "Should exist");
        
    }
    
    func testToHexString() {
        let bi = UInt256(hexStringValue: "FFFF")
        XCTAssertEqual(bi.toHexString, "FFFF", "");

    }

    func testInitWith32BitHex() {
        let bi = UInt256(hexStringValue: "7FFFFFFF")
        
        XCTAssertTrue(bi != nil, "Should exist");
        
    }

    func testInitWithHalfMax32BitHex() {
        // The largest value for an unsigned 32 bit integer is 2^32 - 1
        let bi = UInt256(hexStringValue: "80000000")
        
        XCTAssertTrue(bi != nil, "Should exist");
        
    }
    
    func testInitWith32BitMaxHex() {
        // The largest value for an unsigned 32 bit integer is 2^32 - 1
        let bi = UInt256(hexStringValue: "FFFFFFFF")
        
        XCTAssertTrue(bi != nil, "Should exist");
        
    }

    func testInitWith64BitMaxHex() {
        // The largest value for an unsigned 64 bit integer is 2^64 - 1
        let bi = UInt256(hexStringValue: "FFFFFFFFFFFFFFFF")
        
        XCTAssertTrue(bi != nil, "Should exist");
        
    }

    
    func testInitWith128BitMaxHex() {
        // The largest value for an unsigned 128 bit integer is 2^128 - 1
        let bi = UInt256(hexStringValue: "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF")
        
        XCTAssertTrue(bi != nil, "Should exist");
        
    }

    func testInitWithLargestHex() {
        // The largest value for an unsigned 256 bit integer is 2^256 - 1
        let bi = UInt256(hexStringValue: "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF")
        
        XCTAssertTrue(bi != nil, "Should exist");
        
    }
    
    func testInitWithDecimal() {
        let dec = UInt256(decimalStringValue: "42")
        let hex = UInt256(hexStringValue: "2A")

        XCTAssertEqual(dec, hex, "Should exist and be the same");
    }
    
    func testToDecimalString() {
        let bi = UInt256(decimalStringValue: "42")
        XCTAssertEqual(bi.toDecimalString, "42", "");
        
    }
    
    
    func test9DigitNumber() {
        let bi = UInt256(decimalStringValue: "100000000")
        XCTAssertTrue(bi != nil, "Should exist");
    }

    func test12DigitNumber() {
        let bi = UInt256(decimalStringValue: "100000000000")
        XCTAssertTrue(bi != nil, "Should exist");
    }

    func testInitWithLargestDecimalNumber() {
        // The largest value for an unsigned 256 bit integer is 2^256 - 1
        let a = UInt256(decimalStringValue: "115792089237316195423570985008687907853269984665640564039457584007913129639935")
        let b = UInt256(hexStringValue: "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF")
        
        XCTAssertEqual(a, b, "Should be the same as max hex");

    }
    
    func testInitWithExampleDecimalNumber() {
        let a = UInt256(decimalStringValue: "29048849665247")
        let b = UInt256(hexStringValue: "1A6B765D8CDF")
        
        XCTAssertEqual(a, b, "Should be the same as max hex");

    }
    func testEquality() {
        let a =  UInt256(decimalStringValue: "100000000000")
        let b =  UInt256(decimalStringValue: "100000000000")

        XCTAssertTrue(a == b, "Should be the same");
    }

    func testComparison() {
        let smaller = UInt256(decimalStringValue: "100000000000")
        let bigger =  UInt256(decimalStringValue: "100000000001")

        XCTAssertTrue(smaller < bigger, "Should compare");
    }


    func testAdd() {
        let a = UInt256(decimalStringValue: "14")
        let b = UInt256(decimalStringValue: "26")
        let c = UInt256(decimalStringValue: "40")
        
        XCTAssertEqual(a + b, c, "a + b = c");

    }
    
    func testAddHex() {
        let a = UInt256(hexStringValue: "14")
        let b = UInt256(hexStringValue: "26")
        let c = UInt256(hexStringValue: "3A")

        XCTAssertEqual(a + b, c, "a + b = c");

    }
    

    func testAddBig() {
        let a = UInt256(decimalStringValue: "14000000123400000001")
        let b = UInt256(decimalStringValue: "26000000123400000001")
        let c = UInt256(decimalStringValue: "40000000246800000002")
        
        XCTAssertEqual(a + b, c, "\(a) + \(b) = \( c )");
    }
    
    func testSubtract() {
        let a = UInt256(decimalStringValue: "40")
        let b = UInt256(decimalStringValue: "26")
        let c = UInt256(decimalStringValue: "14")
        
        XCTAssertEqual(a - b, c, "a - b = c");
        
    }

    func testSubtractHex() {
        let a = UInt256(hexStringValue: "3A")
        let b = UInt256(hexStringValue: "26")
        let c = UInt256(hexStringValue: "14")

        XCTAssertEqual(a - b, c, "a - b = c");
        
    }

    func testSubtractBig() {
        let a = UInt256(decimalStringValue: "40000000000000000000")
        let b = UInt256(decimalStringValue: "26000000000000000000")
        let c = UInt256(decimalStringValue: "14000000000000000000")
        
        XCTAssertEqual(a - b, c, "a - b = c");
        
    }

}
