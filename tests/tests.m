//
//  tests.m
//  tests
//
//  Created by Paul Agron on 2/19/15.
//  Copyright (c) 2015 Paul Agron. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>

#import "Deck+Tests.h"
#import "Shuffler.h"
#import <iso646.h>

@interface tests : XCTestCase

@end

@implementation tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testArrayEquality {
  id a = @[ @1, [NSString stringWithUTF8String:"hello"], @948, @93];
  id b = @[ @1, @("hello"), @948, @93];
  XCTAssert([a isEqualTo:b], @"Pass");
}

- (void)testPop {
  
  Deck* a = [[Deck alloc] initWithSize:5];
  
  NSNumber* n = [a pop];
  NSArray* cards = [a cards];
  NSArray* check  = @[@0, @1, @2, [NSNumber numberWithDouble:3.0]];
  
  XCTAssert( [n isEqual:@4], @"Pass");
  XCTAssert( [cards isEqual:check], @"Pass");
}


- (void)testZeroSizedShuffle {
  Shuffler* s = [[Shuffler alloc] initWithDeckSize:0];
  XCTAssert(   countRoundsToRecompose(s) == 1, @"Pass");
}

- (void)testOneSizedShuffle {
  Shuffler* s = [[Shuffler alloc] initWithDeckSize:1];
  XCTAssert(   countRoundsToRecompose(s) == 1, @"Pass");
}

- (void)testTwoSizedShuffle {
  Shuffler* s = [[Shuffler alloc] initWithDeckSize:2];
  XCTAssert(   countRoundsToRecompose(s) == 2, @"Pass");
}

- (void)testThreeSizeShuffle {
  Shuffler* s = [[Shuffler alloc] initWithDeckSize:3];
  XCTAssert(   countRoundsToRecompose(s) == 3, @"Pass");
}

- (void)testFourSizedShuffle {
  Shuffler* s = [[Shuffler alloc] initWithDeckSize:4];
  XCTAssert(   countRoundsToRecompose(s) == 2, @"Pass");
}

- (void)testFiveSizedShuffle {
  Shuffler* s = [[Shuffler alloc] initWithDeckSize:5];
  XCTAssert(   countRoundsToRecompose(s) == 5, @"Pass");
}

- (void)testMidSizedShuffle {
  Shuffler* s = [[Shuffler alloc] initWithDeckSize:54];
  NSUInteger count = countRoundsToRecompose(s);
  
  // The result 1680 generated using a Scala impl of the alg
  XCTAssert(count == 1680, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
