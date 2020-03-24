//
//  UIBarButtonItem+MMCategory.m
//  LogDemo
//
//  Created by mumu on 2020/1/9.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "UIBarButtonItem+MMCategory.h"
#import <objc/runtime.h>

@implementation UIBarButtonItem (MMCategory)

+ (instancetype)barButtonItemWithBtn:(UIButton *)btn {

    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    item.contentButton = btn;
    return item;
}

- (void)setContentButton:(UIButton *)contentButton {
    if (contentButton) {
        objc_setAssociatedObject(self, @selector(contentButton), contentButton, OBJC_ASSOCIATION_RETAIN);
    }
}

- (UIButton *)contentButton {
    UIButton *btn = objc_getAssociatedObject(self, @selector(contentButton));
    return btn;
}

@end
