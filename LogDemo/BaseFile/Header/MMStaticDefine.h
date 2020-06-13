//
//  MMStaticDefine.h
//  LogDemo
//
//  Created by mumu on 2020/1/13.
//  Copyright © 2020 mumu. All rights reserved.
//

#ifndef MMStaticDefine_h
#define MMStaticDefine_h


#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#define NavigationBarHeight [UIDevice isStraightBangsScreen] ? 88 : 64


#ifdef DEBUG // 开发

#define NSLog(format, ...) do {                                                                          \
                             fprintf(stderr, "<%s : %d> %s\n",                                           \
                             [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],  \
                             __LINE__, __func__);                                                        \
                             (NSLog)((format), ##__VA_ARGS__);                                           \
                                                                                                         \
                           } while (0)

#define NSLogRect(rect) NSLog(@"%s x:%.4f, y:%.4f, w:%.4f, h:%.4f", #rect, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height)
#define NSLogSize(size) NSLog(@"%s w:%.4f, h:%.4f", #size, size.width, size.height)
#define NSLogPoint(point) NSLog(@"%s x:%.4f, y:%.4f", #point, point.x, point.y)

#else // 生产
#define NSLog(format, ...)
#define NSLogSize(size)
#endif

#import "MMConstDefine.h"

#endif /* MMStaticDefine_h */
