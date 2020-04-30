//
//  NSDate_CategoriesTests.m
//  NSDate-CategoriesTests
//
//  Created by mac on 2020/5/1.
//  Copyright © 2020 梁大红. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDate+BMKit.h"

@interface NSDate_CategoriesTests : XCTestCase

@end

@implementation NSDate_CategoriesTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testDate {
    XCTAssertTrue([[NSDate bm_stringWithSecondTimeStamp:1588268755 format:@"yyyy-MM-dd HH:mm:ss"] isEqualToString:@"2020-05-01 01:45:55"]);

    XCTAssertTrue(([[NSDate bm_stringWithMillisecondTimeStamp:1588268755000 formats:
                     @"yyyy",
                     @"-MM",
                     @"-dd",
                     @" HH",
                     @":mm",
                     @":ss", nil] isEqualToString:@"2020-05-01 01:45:55"]));

    XCTAssertTrue(([[NSDate bm_stringWithMillisecondTimeStamp:1588268755000 formats:
                     @"yyyy",nil] isEqualToString:@"2020"]));

    XCTAssertTrue(([[NSDate bm_stringWithMillisecondTimeStamp:1588268755000 formats:
                     @"yyyy",
                     @"-MM",nil] isEqualToString:@"2020-05"]));

    XCTAssertTrue(([[NSDate bm_stringWithMillisecondTimeStamp:1588268755000 formats:
                     @"MM",nil] isEqualToString:@"05"]));

    XCTAssertTrue(([[NSDate bm_stringWithMillisecondTimeStamp:1588268755000 formats:
                     @"yyyy",
                     @"-MM",
                     @"-dd",nil] isEqualToString:@"2020-05-01"]));
    XCTAssertTrue(([[NSDate bm_stringWithMillisecondTimeStamp:1588268755000 formats:
                     @"dd",nil] isEqualToString:@"01"]));

    XCTAssertTrue(([[NSDate bm_stringWithMillisecondTimeStamp:1588268755000 formats:
                     @"yyyy",
                     @"-MM",
                     @"-dd",
                     @" HH",nil] isEqualToString:@"2020-05-01 01"]));

    XCTAssertTrue(([[NSDate bm_stringWithMillisecondTimeStamp:1588268755000 formats:
                     @"yyyy",
                     @"-MM",
                     @"-dd",
                     @" HH",
                     @":mm", nil] isEqualToString:@"2020-05-01 01:45"]));

}

@end
