//
//  NSString+MMString.h
//  myLaya
//
//  Created by YangJie on 2017/8/31.
//  Copyright © 2017年 myLaya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MMString)

//url编码
+ (NSString *)URLEncodedString:(NSString *)str;
//url解码
+ (NSString *)URLDecodedString:(NSString *)str;

- (NSString *(^)(id obj))appendObj;
@end
