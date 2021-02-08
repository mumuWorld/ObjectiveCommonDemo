//
//  MMRuntimeTest.h
//  LogDemo
//
//  Created by mumu on 2021/1/27.
//  Copyright © 2021 mumu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MMProTest <NSObject>

@property (nonatomic, copy) NSString *test;

@end

@interface MMRuntimeTest : NSObject <MMProTest>

- (void)unImplementMethod;

@end

NS_ASSUME_NONNULL_END
