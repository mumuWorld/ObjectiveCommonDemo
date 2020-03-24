//
//  MMCollectionViewAlignmentLayout.h
//  LogDemo
//
//  Created by mumu on 2020/1/15.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMCollectionBaseLayout.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, MMCollectionAlignType){
    MMCollectionAlignLeft = 0,
    MMCollectionAlignCenter,
    MMCollectionAlignRight
};

@interface MMCollectionViewAlignmentLayout : MMCollectionBaseLayout

@property (nonatomic, assign) MMCollectionAlignType alignType;

- (instancetype)initWithAlignType:(MMCollectionAlignType)align;
@end

NS_ASSUME_NONNULL_END
