//
//  MMHomeListModel.h
//  LogDemo
//
//  Created by mumu on 2019/12/18.
//  Copyright © 2019 mumu. All rights reserved.
//

#import "MMHomeBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MMHomeListModel : MMHomeBaseModel

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *imageUrl;

@property (nonatomic, copy) NSString *router;

@property (nonatomic, copy) NSString *text;

+ (instancetype)initWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
