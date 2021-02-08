//
//  MMSimpleFuncModel.h
//  LogDemo
//
//  Created by mumu on 2020/4/24.
//  Copyright © 2020 mumu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MMSimpleFuncModel : NSObject<NSCopying>
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, copy) NSString *keyType;
@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSArray *testArray;
@property (nonatomic, copy) NSDictionary *testDictionary;

- (void)postNotify;

- (void)receviewNofitfy:(id)sender;

- (void)resgister;
@end



NS_ASSUME_NONNULL_END
