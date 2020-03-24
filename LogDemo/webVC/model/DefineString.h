//
//  DefineString.h
//  StarMahjong
//
//  Created by YangJie on 2017/9/20.
//  Copyright © 2017年 StarMahjong. All rights reserved.
//

#import "UIDevice+Tools.h"

#define ScreenWidth     [UIScreen mainScreen].bounds.size.width                         //屏幕宽度
#define ScreenHeight    [UIScreen mainScreen].bounds.size.height                        //屏幕高度
#define ProgressViewH   4.f                                                             //网页进度条高度
// iPhone X
#define MM_iPhoneX     [UIDevice isiPhoneX]                                           //iPhone X
#define MM_StatusBarH   (MM_iPhoneX?44.f:20.f)                                          //状态栏高度
#define NavigationBarH   44.f                                                           //导航栏高度
#define MM_ProgressViewY        (ScreenWidth>ScreenHeight) ? 32.f:MM_StatusBarH+ NavigationBarH
#define MM_TabbarHeight         (MM_iPhoneX ? (49.f+34.f) : 49.f)

#define MM_TabbarSafeBottomMargin         (MM_iPhoneX ? 34.f : 0.f)
// Status bar & navigation bar height.
#define MM_StatusBarAndNavigationBarHeight  (MM_iPhoneX ? 88.f : 64.f)

#define LightBuleColor [UIColor colorWithRed:38/255.0 green:182/255.0 blue:242/255.0 alpha:1]
