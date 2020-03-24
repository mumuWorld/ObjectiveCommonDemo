//
//  UIButton+MMCategory.m
//  LogDemo
//
//  Created by mumu on 2020/1/9.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "UIButton+MMCategory.h"

@implementation UIButton (MMCategory)

+ (instancetype)buttonWith:(NSString *)title tColor:(UIColor *)tColor cImage:(NSString *)cImage target:(id)target selector:(SEL)selector {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor: tColor ?: UIColor.blackColor forState:UIControlStateNormal];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
@end
