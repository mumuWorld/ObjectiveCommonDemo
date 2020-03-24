//
//  UIBarButtonItem+MMCategory.h
//  LogDemo
//
//  Created by mumu on 2020/1/9.
//  Copyright © 2020 mumu. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (MMCategory)

@property (nonatomic, strong) UIButton *contentButton;

+ (instancetype)barButtonItemWithBtn:(UIButton *)btn;

@end

NS_ASSUME_NONNULL_END
