//
//  MMRunHelpTest.m
//  LogDemo
//
//  Created by mumu on 2021/1/28.
//  Copyright © 2021 mumu. All rights reserved.
//

#import "MMRunHelpTest.h"

@implementation MMRunHelpTest
+ (BOOL)resolveClassMethod:(SEL)sel {
    return YES;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"");
    return YES;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"sel=%s",aSelector);
    return self;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSLog(@"");
    NSMethodSignature * sign = [NSMethodSignature signatureWithObjCTypes:"v16@0:8"];
    return sign;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"%@",anInvocation);
//    anInvocation.target = [MMRunHelpTest new];
//    [anInvocation invoke];
}

- (void)unImplementMethod {
    NSLog(@"");
}
@end
