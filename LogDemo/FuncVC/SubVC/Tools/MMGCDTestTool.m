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


+ (void)test {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"detail" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    NSLog(@"dict=%@",dict);
}

+ (BOOL)testPoint:(NSString **)str {
//    NSString *strTMp;
    @autoreleasepool {
//        strTMp = [[NSMutableString alloc] initWithString:@"change"];
//        NSMutableString *mStr = [[NSMutableString alloc] initWithString:@"change"];
//        *str = mStr;
//        *str = [[NSMutableString alloc] initWithString:@"change"];
        *str = @"change";
    }
    NSLog(@"p2->%@",*str);
//    NSLog(@"p2->%@,%@",*str,strTMp);
    return true;
}
@end
