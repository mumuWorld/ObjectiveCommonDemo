//
//  MMIndistinctTools.h
//  LogDemo
//
//  Created by mumu on 2020/1/14.
//  Copyright © 2020 mumu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MMIndistinctTools : NSObject

+ (void)createIndistinctImage:(CGFloat)blur size:(CGSize)size style:(int)style finish:(void (^)(UIImage *image))finish;

@end

NS_ASSUME_NONNULL_END
