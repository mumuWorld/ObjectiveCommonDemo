//
//  MMPredicateTestFir.m
//  LogDemoTests
//
//  Created by mumu on 2020/1/2.
//  Copyright © 2020 mumu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MMPredicateTest.h"

@interface MMPredicateTestFir : XCTestCase

@end

@implementation MMPredicateTestFir

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    [self find];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}
- (void)find {
    MMPredicateTest *pre = [[MMPredicateTest alloc] init];
//    [pre findMatchString];
    [pre emailCheckTest:@"295065249@.qq.com"];
    [pre emailCheckTest:@"295065249@sin..com"];
    [pre emailCheckTest:@"439857940@qq..com"];
    [pre emailCheckTest:@"295065249@qq.com"];
    [pre emailCheckTest:@"295065249@q-.com"];
    [pre emailCheckTest:@"295065249@q--.com"];
    NSLog(@"");
}

- (void)compareTest {
    NSNumber *testNumber = @123;
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF BETWEEN {100, 200}"];
    // != <> 不等于
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF <> 123"];

        if ([predicate evaluateWithObject:testNumber]) {
            NSLog(@"testString:%@", testNumber);
        } else {
            NSLog(@"不符合条件");
        }
}

- (void)filterTest {
    NSString *test = @"abbbb";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES ab*"];
}
@end
