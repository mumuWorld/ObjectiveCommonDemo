//
//  MMSimpleFuncTestTool.h
//  LogDemo
//
//  Created by World on 2020/7/13.
//  Copyright © 2020 mumu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMSimpleFuncModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MMSimpleFuncTestTool : NSObject

@property (nonatomic, strong) MMSimpleFuncModel *simpleModel;

+ (instancetype)shareInstance;

+ (void)test;

+ (void)htmlStr;

+ (BOOL)testPoint:(NSString **)str;

+ (void)addTargetVC:(UIViewController *)target;


+ (void)printTable;

+ (void)utfCode;
+ (NSString *)md5HashToLower32Bit:(NSString *)source;

+ (void)invokeGCDTest;

+ (void)dateTest;

+ (void)interTest;

+ (void)crashTest;

+ (void)arraySortTest;

+ (void)sizeTest;

+ (void)animationBlockTest;

- (void)kvoRegister;
- (void)kvoTest;
- (void)kvoSet;

- (void)taskTest;

extern void notifyFinish();

+ (void)requestStart;
+ (void)addRequest:(void(^)(void *notify))finish;

- (void)blockCancel;
@end

NS_ASSUME_NONNULL_END
