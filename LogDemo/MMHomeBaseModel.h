//
//  MMHomeBaseModel.h
//  LogDemo
//
//  Created by mumu on 2019/12/18.
//  Copyright © 2019 mumu. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface MMHomeBaseModel : NSObject

@property(nonatomic,assign) CGFloat cellHeight;

+ (instancetype)initWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
