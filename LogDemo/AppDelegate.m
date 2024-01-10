//
//  AppDelegate.m
//  LogDemo
//
//  Created by feiyujie on 2016/12/26.
//  Copyright © 2016年 feiyujie. All rights reserved.
//

#import "AppDelegate.h"
#import "TimeProfiler.h"
#import "ELHotelDispatchTimer.h"
#include <stdint.h>
#include <stdio.h>
#include <sanitizer/coverage_interface.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//[[TimeProfiler shareInstance] TPStartTrace:"大卡页的viewDidLoad函数"];
    //    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    // Override point for customization after application launch.
    NSLog(@"启动完成=%@,%@",[NSDate date],NSHomeDirectory());
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"%@",application);
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"%@",application);
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"%@",application);
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"%@",application);
}


- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"%@",application);
    static int value = 0;
    [ELHotelDispatchTimer excuTimerTask:^(NSString * _Nonnull timer) {
            NSLog(@"value=%d",value);
    } andStart:0 interval:0.1 repeats:YES async:NO];
}

/*
 -fsanitize-coverage=trace-pc-guard
 */
void __sanitizer_cov_trace_pc_guard_init(uint32_t *start,uint32_t *stop) {
  static uint64_t N;  // Counter for the guards.
  if (start == stop || *start) return;  // Initialize only once.
  printf("INIT: %p %p\n", start, stop);
  for (uint32_t *x = start; x < stop; x++)
    *x = (uint32_t)++N;  // Guards should start from 1.
}
 
void __sanitizer_cov_trace_pc_guard(uint32_t *guard) {
//  if (!*guard) return;  // Duplicate the guard check.
 
  void *PC = __builtin_return_address(0);
  char PcDescr[1024];
  //__sanitizer_symbolize_pc(PC, "%p %F %L", PcDescr, sizeof(PcDescr));
  printf("guard: %p %x PC %s\n", guard, *guard, PcDescr);
}


@end
