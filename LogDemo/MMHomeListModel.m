//
//  MMHomeListModel.m
//  LogDemo
//
//  Created by mumu on 2019/12/18.
//  Copyright © 2019 mumu. All rights reserved.
//

#import "MMHomeListModel.h"

@implementation MMHomeListModel

+ (instancetype)initWithDict:(NSDictionary *)dict {
    MMHomeListModel *model = [[MMHomeListModel alloc] init];
    model.name = [dict objectForKey:@"title"];
    model.imageUrl = [dict objectForKey:@"url"];
    model.router = [dict objectForKey:@"router"];
    model.text = [dict objectForKey:@"text"];

    return model;
}

@end
