//
//  MMSimpleFuncVC+MMHook.m
//  LogDemo
//
//  Created by mumu on 2020/4/17.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMSimpleFuncVC+MMHook.h"


@implementation MMSimpleFuncVC (MMHook)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleSEL:@selector(testFuncA) withSEL:@selector(testFuncB)];
    });
}


- (void)testFuncB {
    NSLog(@"b");
    [self testFuncB];
}

@end
