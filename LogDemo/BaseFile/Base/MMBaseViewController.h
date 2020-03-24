//
//  BaseViewController.h
//  LogDemo
//
//  Created by mumu on 2019/5/18.
//  Copyright © 2019 feiyujie. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol BaseProtocol <NSObject>

/// 父类调用  子类初始化子视图
- (void)initSubView;

@end
NS_ASSUME_NONNULL_BEGIN

@interface MMBaseViewController : UIViewController <BaseProtocol>

- (void)callBasePublic;

@end

NS_ASSUME_NONNULL_END
