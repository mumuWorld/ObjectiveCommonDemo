//
//  MMSimpleFuncModel.h
//  LogDemo
//
//  Created by mumu on 2020/4/24.
//  Copyright © 2020 mumu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MMSimpleFuncProtocol <NSObject>

@property (nonatomic, copy) NSString *testKey;

@property (nonatomic, copy, nullable) void(^onDebugInfo)(NSString *info);

@end

@interface MMSimpleFuncModel : NSObject<NSCopying, MMSimpleFuncProtocol>
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, copy) NSString *keyType;
@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSArray *testArray;
@property (nonatomic, copy) NSDictionary *testDictionary;

@property (nonatomic, copy, readonly) NSString *readStr;

@property (nonatomic, copy, nullable) void(^nullBlock)(NSString *info);

@property (nonatomic, copy, nullable) void(^helloBlock)();

- (void)postNotify;

- (void)receviewNofitfy:(id)sender;

- (void)resgister;

- (void)testSetReadStr;

- (void)sayHello:(void(^)())callback;
@end



NS_ASSUME_NONNULL_END
