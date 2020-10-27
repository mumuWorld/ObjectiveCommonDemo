//
//  MMPresentTestVC.h
//  LogDemo
//
//  Created by mumu on 2020/4/17.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^CallBack)(void);

@interface MMPresentTestVC : MMBaseViewController
@property (nonatomic, copy) CallBack callBack;
@end

NS_ASSUME_NONNULL_END
