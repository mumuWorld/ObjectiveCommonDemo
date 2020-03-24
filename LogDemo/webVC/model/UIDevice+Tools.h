//
//  UIDevice+Tools.h
//  LogDemo
//
//  Created by mumu on 2020/3/16.
//  Copyright © 2020 mumu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (Tools)

+ (BOOL)isiPhoneX;

//安全区域高度
+ (float)safeBottomHeight;
@end

NS_ASSUME_NONNULL_END
