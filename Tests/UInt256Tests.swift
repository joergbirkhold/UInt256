//
//  UInt256Tests.swift
//  Crypto Coin Swift
//
//  Created by Sjors Provoost on 24-06-14.
//

import XCTest
import UInt256

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
        
        XCTAssertTrue(bi == 0xFFFF, "Should exist");
 
        
    }
    
    func testToHexString() {
        let bi = UInt256(hexStringValue: "FFF")
        let expected: String = "FFF"
        XCTAssertEqual(bi.toHexString, expected);

    }

 
    func testInitWithIntHexLiterals() {
        let a = UInt256(hexStringValue: "FFFFFFFFFFFFFFFF")
        let b = UInt256(0,0,0,0,0,0,0xFFFFFFFF,0xFFFFFFFF)

        XCTAssertTrue(a == b, b.description);
        
    }
    
    func testInitWithIntLiteral() {
        let a = UInt256(decimalStringValue: "50245")
        let b = UInt256(UInt32(50245))
        let e = UInt256(50245)


        let c: UInt256 = 50245
        
        
        XCTAssertTrue(a == b, b.description);
        XCTAssertTrue(a == c, c.description);
        XCTAssertTrue(a == e, e.description);
        
        // 32 bit values (no longer allowed):
//        let d: UInt256 = 3221225472
//        XCTAssertTrue(d.toDecimalString == "3221225472", "")


        let f = UInt256(3221225472)
        XCTAssertTrue(f.toDecimalString == "3221225472", "")
    }
    

    
    func testInitWithDecimal() {
        let dec = UInt256(decimalStringValue: "42")
        let hex = UInt256(hexStringValue: "2A")

        XCTAssertEqual(dec, hex, "Should exist and be the same");
    }
    
    func testToDecimalString() {
        let bi = UInt256(decimalStringValue: "42")
        let expected: String = "42"
        XCTAssertEqual(bi.toDecimalString, expected, "");
        
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
    
    func testAllZeros() {
        let a = UInt256(decimalStringValue: "131069")
        let b = UInt256(decimalStringValue: "65534")
        let c = UInt256.allZeros
        
        if(a == c || b == c) {
            XCTAssertTrue(false ,"Not zero")
        }
        
         XCTAssertTrue(a != c && b != c, "")
        
    }

    func testComparison() {
        let smaller = UInt256(decimalStringValue: "100000000000")
        let bigger =  UInt256(decimalStringValue: "100000000001")

        XCTAssertTrue(smaller < bigger, "Should compare");
        XCTAssertFalse(smaller > bigger, "Should compare");

    }
    
    func testCompareBig() {
        var smaller = UInt256(decimalStringValue: "340282366920938463463374607431768211454")
        var bigger =  UInt256(decimalStringValue: "340282366920938463463374607431768211455")
        
        XCTAssertTrue(smaller < bigger, "Should compare");
        XCTAssertTrue(bigger > smaller, "Should compare");
        
        smaller =   UInt256(decimalStringValue: "64333151529")
        bigger =    UInt256(decimalStringValue: "158113883008")

        XCTAssertTrue(smaller < bigger, "Should compare");
        XCTAssertTrue(bigger > smaller, "Should compare");
        
        XCTAssertFalse(smaller > bigger, "Should compare");
        XCTAssertFalse(bigger < smaller, "Should compare");
    }
    
    func testGreaterOrEqual() {
        var smaller =   UInt256(decimalStringValue: "64333151529")
        var bigger =    UInt256(decimalStringValue: "158113883008")
        
        XCTAssertTrue(smaller <= bigger, "Should compare");
        XCTAssertTrue(bigger >= smaller, "Should compare");
        
        XCTAssertFalse(smaller >= bigger, "Should compare");
        XCTAssertFalse(bigger <= smaller, "Should compare");
    }
}
