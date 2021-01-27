//
//  MMRuntimeTest.m
//  LogDemo
//
//  Created by mumu on 2021/1/27.
//  Copyright © 2021 mumu. All rights reserved.
//

#import "MMRuntimeTest.h"
#import <objc/runtime.h>

@implementation MMRuntimeTest

+ (BOOL)resolveClassMethod:(SEL)sel {
    return YES;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"sel=%p",sel);
    return YES;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return self;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature * sign = [NSMethodSignature signatureWithObjCTypes:"v16@0:8"];
    return sign;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    [anInvocation invoke];
}
@end
