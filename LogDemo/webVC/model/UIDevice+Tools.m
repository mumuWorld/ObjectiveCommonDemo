//
//  UIDevice+Tools.m
//  LogDemo
//
//  Created by mumu on 2020/3/16.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "UIDevice+Tools.h"

@implementation UIDevice (Tools)
//判断是否为iphone X

+ (BOOL)isiPhoneX {
    if(@available(iOS 11.0, *)) {
        CGFloat bottomSafeInset = [self safeBottomHeight];
        if(bottomSafeInset == 34.0f|| bottomSafeInset == 21.0f) {
            return YES;
        }
    }
    return NO;
}

//安全区域高度
+ (float)safeBottomHeight {
    if(@available(iOS 11.0, *)) {
        return [[[UIApplication sharedApplication] delegate] window].safeAreaInsets.bottom;
    }
    return 0.0f;
}
@end
