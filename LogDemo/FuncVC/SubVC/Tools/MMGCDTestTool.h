//
//  MMGCDTestTool.h
//  LogDemo
//
//  Created by mumu on 2020/5/14.
//  Copyright © 2020 mumu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MMGCDTestTool : NSObject
+ (void)gcd_groupTest1;

+ (void)gcd_groupTest2;

+ (void)gcd_barrier_test;

+ (void)gcd_barrier_test_2;

- (void)testInvoke:(void (^)(int type, NSString * msg))back;

+ (void)threadTest;

+ (void)waitTest;

+ (void)queueCreateTest;
@end

NS_ASSUME_NONNULL_END
