//
//  MMGCDTestTool.m
//  LogDemo
//
//  Created by mumu on 2020/5/14.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMGCDTestTool.h"


@implementation MMGCDTestTool

/// 0 2  3 func 5 5.1 7 1 4 6
+ (void)gcd_groupTest1 {
    dispatch_group_t group = dispatch_group_create();
    NSLog(@"0");
    dispatch_group_async(group, dispatch_get_main_queue(), ^{
        NSLog(@"1");
    });
    NSLog(@"2");
    dispatch_function_t func = testFunc;
    int testNumber = 10;
    dispatch_group_async_f(group, dispatch_get_global_queue(0, 0), &testNumber, func);
    NSLog(@"3");
    dispatch_group_enter(group);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        NSLog(@"4");
        dispatch_group_leave(group);
    });
    NSLog(@"5");
    dispatch_group_wait(group, dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC));
    NSLog(@"5.1");
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
       NSLog(@"6");
    });
    NSLog(@"7");
}

void testFunc(void *context) {
    int *number = context;
    NSLog(@"testFunc-%d",*number);
}

/// 0 - 1[main]  - 6/ 2/3 -  5- 4
+ (void)gcd_groupTest2 {
    dispatch_queue_t custom = dispatch_queue_create("mm.custom", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"0-%@",[NSThread currentThread]);
    dispatch_sync(custom, ^{
        NSLog(@"1-%@",[NSThread currentThread]);
        dispatch_async(custom, ^{
            NSLog(@"2-%@",[NSThread currentThread]);
        });
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"3-%@",[NSThread currentThread]);
        });
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), custom, ^{
            NSLog(@"4-%@",[NSThread currentThread]);
        });
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC) , dispatch_get_main_queue(), ^{
            NSLog(@"5-%@",[NSThread currentThread]);
        });
    });
    NSLog(@"6-%@",[NSThread currentThread]);
}
@end
