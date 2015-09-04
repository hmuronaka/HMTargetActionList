//
//  HMWeakTargetActionTest.m
//  HMTargetActionList
//
//  Created by Muronaka Hiroaki on 2015/09/04.
//  Copyright (c) 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "HMWeakTargetAction.h"

@interface HMWeakTargetActionTest : XCTestCase

@property(nonatomic, strong) HMWeakTargetAction* forWeakTest;

@end

@implementation HMWeakTargetActionTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    NSObject* obj = [NSObject new];
    self.forWeakTest = [[HMWeakTargetAction alloc] initWithTarget:obj action:@selector(setUp)];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

/////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark test property

-(void)testProperties {
    HMWeakTargetAction* w1 = [[HMWeakTargetAction alloc] initWithTarget:self action:@selector(setUp)];
    
    XCTAssertEqual(w1.target, self);
    XCTAssertEqual(w1.action, @selector(setUp));
}

/////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark test equal or not equal

- (void)testEqual {
    HMWeakTargetAction* w1 = [[HMWeakTargetAction alloc] initWithTarget:self action:@selector(setUp)];
    HMWeakTargetAction* w2 = [[HMWeakTargetAction alloc] initWithTarget:self action:@selector(setUp)];
    
    XCTAssertEqual(w1, w1);
    XCTAssertEqualObjects(w1, w1);
    XCTAssertEqualObjects(w1, w2);
    
    // they aren't same object.
    XCTAssertNotEqual(w1, w2);
}

- (void)testNotEqualTarget {
    HMWeakTargetAction* w1 = [[HMWeakTargetAction alloc] initWithTarget:self action:@selector(setUp)];
    HMWeakTargetAction* w2 = [[HMWeakTargetAction alloc] initWithTarget:w1 action:@selector(setUp)];
    
    XCTAssertNotEqual(w1, w2);
    XCTAssertNotEqualObjects(w1, w2);
}

- (void)testNotEqualSelector {
    HMWeakTargetAction* w1 = [[HMWeakTargetAction alloc] initWithTarget:self action:@selector(setUp)];
    HMWeakTargetAction* w2 = [[HMWeakTargetAction alloc] initWithTarget:self action:@selector(tearDown)];
    
    XCTAssertNotEqual(w1, w2);
    XCTAssertNotEqualObjects(w1, w2);
}

/////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark test weak

-(void)testWeak {
    XCTAssertNil(self.forWeakTest.target);
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
