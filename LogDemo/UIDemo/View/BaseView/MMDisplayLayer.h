//
//  MMDisplayLayer.h
//  LogDemo
//
//  Created by World on 2020/9/24.
//  Copyright © 2020 mumu. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN
@protocol MMDisplayLayer <NSObject>

- (void)display:(CGContextRef)context size:(CGSize)size;

@end

@interface MMDisplayLayer : CALayer

@end

NS_ASSUME_NONNULL_END
