//
//  MMSimpleFuncModel.m
//  LogDemo
//
//  Created by mumu on 2020/4/24.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMSimpleFuncModel.h"

@implementation MMSimpleFuncModel
- (BOOL)isEqual:(id)object {
    if (![object isKindOfClass:[MMSimpleFuncModel class]]) {
        return false;
    }
    MMSimpleFuncModel *model = object;
    return [self.keyType isEqual:model.keyType];
}

//- (id)copy {
//    MMSimpleFuncModel *model = [MMSimpleFuncModel new];
//    model.keyType = _keyType;
//    model.type = _type;
//    model.content = _content;
//    return model;
//}

- (id)copyWithZone:(NSZone *)zone {
    MMSimpleFuncModel *model = [MMSimpleFuncModel new];
    model.keyType = _keyType;
    model.type = _type;
    model.content = _content;
    return model;
}
@end
