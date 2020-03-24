//
//  WebViewController.h
//  ScrollView
//
//  Created by YangJie on 2017/9/15.
//  Copyright © 2017年 YangJie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface L3game_WebViewController : UIViewController

/**
 加载的dict
 */
@property (nonatomic,copy) NSDictionary *dict;

- (instancetype)initWithDict:(NSDictionary *)dict;
@end
