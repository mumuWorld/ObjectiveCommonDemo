//
//  UIDevice+MMCategory.m
//  LogDemo
//
//  Created by mumu on 2020/1/13.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "UIDevice+MMCategory.h"

#import <sys/utsname.h>

static BOOL isStraightBangsScreen = false;

@implementation UIDevice (MMCategory)

+ (BOOL)isStraightBangsScreen {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
         struct utsname systemInfo;
           uname(&systemInfo);
           NSString *identifier = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
           if ([identifier isEqualToString:@"i386"] || [identifier isEqualToString:@"x86_64"]) {
               identifier = [NSProcessInfo processInfo].environment[@"SIMULATOR_MODEL_IDENTIFIER"];
           }
           
           if ([identifier isEqualToString:@"iPhone10,3"] || // iPhone X
               [identifier isEqualToString:@"iPhone10,6"] || // iPhone X
               [identifier isEqualToString:@"iPhone11,8"] || // iPhone XR
               [identifier isEqualToString:@"iPhone11,2"] || // iPhone XS
               [identifier isEqualToString:@"iPhone11,4"] || // iPhone XS Max
               [identifier isEqualToString:@"iPhone11,6"] || // iPhone XS Max
               [identifier isEqualToString:@"iPhone12,1"] || // iPhone 11
               [identifier isEqualToString:@"iPhone12,3"] || // iPhone 11 Pro
               [identifier isEqualToString:@"iPhone12,5"]    // iPhone 11 Pro Max
               ) {
               isStraightBangsScreen = true;
           }
           else {
               isStraightBangsScreen = false;
           }
    });
    return isStraightBangsScreen;
}

@end
