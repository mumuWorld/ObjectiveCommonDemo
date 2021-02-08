//
//  AppDelegate.m
//  LogDemo
//
//  Created by feiyujie on 2016/12/26.
//  Copyright © 2016年 feiyujie. All rights reserved.
//

#import "AppDelegate.h"
#import "TimeProfiler.h"

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
}


@end
