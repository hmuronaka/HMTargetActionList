//
//  HMWeakTargetActionTest.swift
//
//  Created by Hiroaki Muronaka on 2021/10/08.

import XCTest
@testable import HMTargetActionList

final class HMWeakTargetActionTest: XCTestCase {
    var testObject: HMWeakTargetAction!
    
    override func setUp() {
        super.setUp()
        let obj = NSObject()
        self.testObject = HMWeakTargetAction(target: obj, action: #selector(HMWeakTargetActionTest.action))
    }
    
    //MARK: ///////////////////////////////////////////////////////////////////////////////////////////////
    //MARK: test properties
    
    func testProperties() {
        let w1 = HMWeakTargetAction(target: self, action: #selector(HMWeakTargetActionTest.action))
        
        XCTAssertEqual(w1.target as! HMWeakTargetActionTest, self)
        XCTAssertEqual(w1.action, #selector(HMWeakTargetActionTest.action))
    }
    
    //MARK: ///////////////////////////////////////////////////////////////////////////////////////////////
    //MARK: equals
    
    func testEquals() {
        let w1 = HMWeakTargetAction(target: self, action: #selector(HMWeakTargetActionTest.action))
        let w2 = HMWeakTargetAction(target: self, action: #selector(HMWeakTargetActionTest.action))
        
        XCTAssertEqual(w1, w2)
    }
    
    func testTargetIsNotEqual() {
        let w1 = HMWeakTargetAction(target: self, action: #selector(HMWeakTargetActionTest.action))
        let obj = NSObject()
        let w2 = HMWeakTargetAction(target: obj, action: #selector(HMWeakTargetActionTest.action))
        XCTAssertNotEqual(w1, w2)
    }
    
    func testSelectorIsNotEqual() {
        let w1 = HMWeakTargetAction(target: self, action: #selector(HMWeakTargetActionTest.action))
        let w2 = HMWeakTargetAction(target: self, action: #selector(HMWeakTargetActionTest.action2))
        XCTAssertNotEqual(w1, w2)
    }
    
    //MARK: weak test
    
    func testWeak1() {
        XCTAssertNil(self.testObject.target)
    }
    
    func testWeak2() {
        let w1 = HMWeakTargetAction(target: NSObject(), action: #selector(HMWeakTargetActionTest.action))
        XCTAssertNil(w1.target)
    }
    
    func testWeak3() {
        let obj = NSObject()
        let w1 = HMWeakTargetAction(target: obj, action: #selector(HMWeakTargetActionTest.action))
        XCTAssertEqual(w1.target as! NSObject, obj)
    }
}


extension HMWeakTargetActionTest {
    @objc func action() {
    }
    
    @objc func action2() {
    }
}
