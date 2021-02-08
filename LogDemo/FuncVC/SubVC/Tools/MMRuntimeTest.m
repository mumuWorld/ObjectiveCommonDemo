//
//  MMRuntimeTest.m
//  LogDemo
//
//  Created by mumu on 2021/1/27.
//  Copyright © 2021 mumu. All rights reserved.
//

#import "MMRuntimeTest.h"
#import <objc/runtime.h>
#import "MMRunHelpTest.h"

@interface MMRuntimeTest ()
@property (nonatomic, strong) MMRunHelpTest *testObj;
@end

@implementation MMRuntimeTest

//+ (BOOL)resolveClassMethod:(SEL)sel {
//    return YES;
//}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"sel=%p",sel);
    return YES;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"sel=%s",aSelector);
    return self;
}

//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
//    NSLog(@"");
//    NSMethodSignature * sign = [NSMethodSignature signatureWithObjCTypes:"v16@0:8"];
//    return sign;
//}
//
//- (void)forwardInvocation:(NSInvocation *)anInvocation {
//    NSLog(@"");
//    anInvocation.target = [[MMRunHelpTest alloc] init];
//    [anInvocation invoke];
////    [anInvocation invokeWithTarget:[[MMRunHelpTest alloc] init]];
//}

- (MMRunHelpTest *)testObj {
    if (!_testObj) {
        _testObj = [MMRunHelpTest new];
    }
    return _testObj;
}

- (void)setTest:(NSString *)test {
    NSLog(@"1");
}
@end
