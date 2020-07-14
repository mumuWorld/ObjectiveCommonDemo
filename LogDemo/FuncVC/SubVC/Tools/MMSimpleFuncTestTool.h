//
//  MMSimpleFuncTestTool.h
//  LogDemo
//
//  Created by World on 2020/7/13.
//  Copyright © 2020 mumu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MMSimpleFuncTestTool : NSObject
+ (void)test;

+ (BOOL)testPoint:(NSString **)str;

+ (void)addTargetVC:(UIViewController *)target;


+ (void)printTable;

+ (void)utfCode;
+ (NSString *)md5HashToLower32Bit:(NSString *)source;
@end

NS_ASSUME_NONNULL_END