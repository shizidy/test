//
//  testTests.m
//  testTests
//
//  Created by wdyzmx on 2018/5/3.
//  Copyright © 2018年 wdyzmx. All rights reserved.
//

#import <XCTest/XCTest.h>
//#import "ViewController.h"
@interface testTests : XCTestCase
//@property (nonatomic, strong) ViewController *vc;
@end

@implementation testTests
//-(ViewController *)vc{
//    if (_vc==nil) {
//        _vc = [[ViewController alloc] init];
//    }
//    return _vc;
//}
- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
//    [self.vc quchongMethod];
//    [self.vc maopaoSortArray];
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
