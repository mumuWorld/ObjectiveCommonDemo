//
//  NSString+MMCategory.h
//  LogDemo
//
//  Created by mumu on 2020/1/16.
//  Copyright © 2020 mumu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (MMCategory)

/// 根据规则匹配字符串
/// @param regularStr 正则规则
- (NSArray *)matchStringWithRegularRule:(NSString *)regularStr;
@end

NS_ASSUME_NONNULL_END
