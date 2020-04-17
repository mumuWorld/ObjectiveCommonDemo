//
//  NSObject+MMCategory.h
//  LogDemo
//
//  Created by mumu on 2020/4/17.
//  Copyright © 2020 mumu. All rights reserved.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (MMCategory)
+ (void)swizzleSEL:(SEL)originalSEL withSEL:(SEL)swizzledSEL;
@end

NS_ASSUME_NONNULL_END
