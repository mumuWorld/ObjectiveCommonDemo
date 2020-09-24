//
//  MMContentView.h
//  LogDemo
//
//  Created by World on 2020/9/24.
//  Copyright © 2020 mumu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface MMRadiusConfigure : NSObject

@property (nonatomic, assign) UIRectCorner rectCorner;

@property (nonatomic, assign) CGFloat cornerRaidus;

@property (nonatomic, strong) UIColor *backGroundColor;

@end

@interface MMContentView : UIView

@property (nonatomic, strong) MMRadiusConfigure *configure;

@end



NS_ASSUME_NONNULL_END
