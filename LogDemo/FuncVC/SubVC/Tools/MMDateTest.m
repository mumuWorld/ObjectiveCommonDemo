//
//  MMDateTest.m
//  LogDemo
//
//  Created by mumu on 2020/10/14.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMDateTest.h"
#import "NSDate+Tools.h"
#include <mach/mach_time.h>
#include <sys/time.h>

@implementation MMDateTest

+ (void)dateTest {
    //23700440873531
    uint64_t mach_time = mach_absolute_time();
    //23700.440875225002  将上面mach_absolute_time()的CPU tick数转化成秒数的结果
    CGFloat mediaTime = CACurrentMediaTime();
    // 23700.440875225002 == CACurrentMediaTime()
    NSTimeInterval systemUptime = [[NSProcessInfo processInfo] systemUptime];
    //623924625.32565904 以GMT为标准的，2001年一月一日00：00：00这一刻的时间绝对值
    CGFloat absoluteTime = CFAbsoluteTimeGetCurrent();
    
    struct timeval now;
    struct timezone tz;
//    (timeval) now = (tv_sec = 1602231152, tv_usec = 400892)
//    (timezone) tz = (tz_minuteswest = -480, tz_dsttime = 0)
    gettimeofday(&now, &tz);
    //2020-10-09 08:12:32 +0000
    NSDate* date = [NSDate date];
    //(CGFloat) date_time = 1602231152.400984
    CGFloat date_time = [date timeIntervalSince1970];
    //(CGFloat) date_time_now = -0.0000069141387939453125
    CGFloat date_time_now = [date timeIntervalSinceNow];

    NSLog(@"test");
}
@end
