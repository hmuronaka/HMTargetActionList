//
//  HMTargetActionListTest.m
//  HMTargetActionList
//
//  Created by Muronaka Hiroaki on 2015/09/04.
//  Copyright (c) 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "HMTargetActionList.h"

@interface HMTargetActionListTest : XCTestCase

@property(nonatomic, strong) HMTargetActionList* targetList;
@property(nonatomic, assign) NSInteger duplicateCount;
@property(nonatomic, strong) HMTargetActionList* forWeakTestList;

@end

@implementation HMTargetActionListTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.targetList = [HMTargetActionList new];
    self.duplicateCount = 0;
    
    self.forWeakTestList = [HMTargetActionList new];
    [self.forWeakTestList addTarget:[HMTargetActionListTest new] action:@selector(handleWeakTest:)];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFire {
    [self.targetList addTarget:self action:@selector(handleTestFire:)];
    [self.targetList fireWithSender:self];
}

-(void)handleTestFire:(id)sender {
    XCTAssertEqual(sender, self);
}

-(void)testNotDuplicateFire {
    [self.targetList addTarget:self action:@selector(handleTestDuplicateFire:)];
    [self.targetList addTarget:self action:@selector(handleTestDuplicateFire:)];
    [self.targetList fireWithSender:self];
}

-(void)handleTestDuplicateFire:(id)sender {
    XCTAssertEqual(self.duplicateCount, 0);
    self.duplicateCount++;
}

-(void)testRemoveTarget {
    [self.targetList addTarget:self action:@selector(handleRemoveTarget1:)];
    [self.targetList addTarget:self action:@selector(handleRemoveTarget2:)];
    [self.targetList removeActionFromTarget:self];
    [self.targetList fireWithSender:self];
}


-(void)handleRemoveTarget1:(id)sender {
    XCTFail();
}

-(void)handleRemoveTarget2:(id)sender {
    XCTFail();
}

-(void)testRemoveTargetAction {
    [self.targetList addTarget:self action:@selector(handleRemoveTargetAction1:)];
    [self.targetList addTarget:self action:@selector(handleRemoveTargetAction2:)];
    [self.targetList removeTaget:self action:@selector(handleRemoveTargetAction2:)];
    [self.targetList fireWithSender:self];
}

-(void)handleRemoveTargetAction1:(id)sender {
    XCTAssertTrue(YES);
}

-(void)handleRemoveTargetAction2:(id)sender {
    XCTFail();
}

-(void)testRemoveAll {
    [self.targetList addTarget:self action:@selector(handleRemoveTarget1:)];
    [self.targetList addTarget:self action:@selector(handleRemoveTarget2:)];
    [self.targetList removeAll];
    [self.targetList fireWithSender:self];
}

-(void)testWeak {
    [self.forWeakTestList fireWithSender:self];
}

-(void)handleWeakTest:(id)sender {
    XCTFail();
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
