//
//  UIButton+MMCategory.h
//  LogDemo
//
//  Created by mumu on 2020/1/9.
//  Copyright © 2020 mumu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (MMCategory)

+ (instancetype)buttonWith:(NSString *)title tColor:(UIColor * _Nullable)tColor cImage:(NSString * _Nullable)cImage target:(id)target selector:(SEL)selector;

@end

NS_ASSUME_NONNULL_END
