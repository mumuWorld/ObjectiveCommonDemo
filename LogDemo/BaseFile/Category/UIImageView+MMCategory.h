//
//  UIImageView+MMCategory.h
//  LogDemo
//
//  Created by mumu on 2020/1/14.
//  Copyright © 2020 mumu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (MMCategory)

- (void)setImage:(UIImage *)image fitSize:(CGSize)fitSize;

@end

NS_ASSUME_NONNULL_END
