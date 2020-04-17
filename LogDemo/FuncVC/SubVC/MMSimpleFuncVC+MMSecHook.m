//
//  MMSimpleFuncVC+MMSecHook.m
//  LogDemo
//
//  Created by mumu on 2020/4/17.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMSimpleFuncVC+MMSecHook.h"


@implementation MMSimpleFuncVC (MMSecHook)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleSEL:@selector(testFuncA) withSEL:@selector(testFuncC)];
    });
}

- (void)testFuncC {
    NSLog(@"c");
    [self testFuncC];
}

@end
