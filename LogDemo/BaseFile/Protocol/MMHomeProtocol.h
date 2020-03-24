//
//  MMHomeProtocol.h
//  LogDemo
//
//  Created by mumu on 2019/12/18.
//  Copyright © 2019 mumu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMHomeBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MMHomeCellProtocol <NSObject>

- (void)loadModel:(MMHomeBaseModel *)model;

@end

NS_ASSUME_NONNULL_END
