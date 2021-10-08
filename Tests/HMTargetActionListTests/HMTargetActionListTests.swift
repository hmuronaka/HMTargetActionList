//
//  HMTargetActionListTests.swift
//
//  Created by Hiroaki Muronaka on 2021/10/08.

import XCTest
@testable import HMTargetActionList

final class HMTargetActionListTests: XCTestCase {
    
    var targetList: HMTargetActionList!
    var duplicateCount: Int = 0
    var weakTestList: HMTargetActionList!
    
    override func setUp() {
        super.setUp()
        
        let obj = NSObject()
        
        self.targetList = HMTargetActionList()
        self.duplicateCount = 0
        self.weakTestList = HMTargetActionList()
        self.weakTestList.addTarget(obj, action: #selector(HMTargetActionListTests.handleFail(_:)))
    }
    
    //MARK: test fire
    
    func testFire() {
        self.targetList.addTarget(self, action: #selector(HMTargetActionListTests.handleTestFire(_:)))
        self.targetList.fire(self)
    }
    
    /// 重複した内容は１つしかaddTargetされない
    func testDuplicateFire() {
        self.targetList.addTarget(self, action: #selector(HMTargetActionListTests.handleDuplicateFire(_:)))
        self.targetList.addTarget(self, action: #selector(HMTargetActionListTests.handleDuplicateFire(_:)))
        self.targetList.fire(self)
    }
    
    //MARK: test remove
    
    func testRemoveTarget() {
        self.targetList.addTarget(self, action: #selector(HMTargetActionListTests.handleRemoveTarget1))
        self.targetList.addTarget(self, action: #selector(HMTargetActionListTests.handleRemoveTarget2))
        let obj = NSObject()
        self.targetList.addTarget(obj, action: #selector(HMTargetActionListTests.action1))
        self.targetList.removeActions(self)
        XCTAssertEqual(self.targetList.targetActionList.count, 1)
    }
    
    func testRemoveAction() {
        self.targetList.addTarget(self, action: #selector(HMTargetActionListTests.handleRemoveTarget1))
        self.targetList.addTarget(self, action: #selector(HMTargetActionListTests.handleTestFire(_:)))
        self.targetList.removeTarget(self, action: #selector(HMTargetActionListTests.handleRemoveTarget1(_:)))
        XCTAssertEqual(self.targetList.targetActionList.count, 1)
        self.targetList.fire(self)
    }
    
    func testRemoveAll() {
        self.targetList.addTarget(self, action: #selector(HMTargetActionListTests.handleRemoveTarget1))
        self.targetList.addTarget(self, action: #selector(HMTargetActionListTests.handleRemoveTarget2))
        let obj = NSObject()
        self.targetList.addTarget(obj, action: #selector(HMTargetActionListTests.action1))
        self.targetList.removeAll()
        XCTAssertEqual(self.targetList.targetActionList.count, 0)
    }
    
    //MARK: test weak
    
    func testWeak1() {
        self.weakTestList.fire(self)
    }
}


extension HMTargetActionListTests {
    @objc func action1() {
    }
    
    @objc func handleTestFire(_ sender: HMTargetActionListTests) {
        XCTAssertEqual(self, sender)
    }
    
    @objc func handleDuplicateFire(_ sender: HMTargetActionListTests) {
        XCTAssertEqual(self, sender)
        XCTAssertEqual(duplicateCount, 0)
        duplicateCount += 1
    }
    
    @objc func handleRemoveTarget1(_ sender: HMTargetActionListTests) {
        XCTFail()
    }
    
    @objc func handleRemoveTarget2(_ sender: HMTargetActionListTests) {
        XCTFail()
    }
    
    @objc func handleFail(_ sender: HMTargetActionListTests) {
        XCTFail()
    }
}
