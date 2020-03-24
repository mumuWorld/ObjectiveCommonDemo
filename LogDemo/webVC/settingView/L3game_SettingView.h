//
//  SettingView.h
//  L3Game
//
//  Created by YangJie on 2017/10/20.
//  Copyright © 2017年 StarMahjong. All rights reserved.
//

#import <UIKit/UIKit.h>
//typeof fontSize{
//
//};

typedef void(^refreshWebView)();

typedef void(^dismisSelf)();

typedef void(^fontSetting)();
@interface L3game_SettingView : UIView

+(instancetype)L3gamef_settingView;
- (void)L3gamef_removeAnimation;

@property (nonatomic,copy) refreshWebView refreshBLK;

@property (nonatomic,copy) dismisSelf  dismissBLK;

@property (nonatomic,copy) fontSetting fontSetBLK;

@end
