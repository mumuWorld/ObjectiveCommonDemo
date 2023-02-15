//
//  AppDelegate.h
//  LogDemo
//
//  Created by feiyujie on 2016/12/26.
//  Copyright © 2016年 feiyujie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

#define weakify(var) ext_keywordify __weak typeof(var) O2OWeak_##var = var;
#define strongify(var) ext_keywordify \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
__strong typeof(var) var = O2OWeak_##var; \
_Pragma("clang diagnostic pop")
#if DEBUG
#   define ext_keywordify autoreleasepool {}
#else
#   define ext_keywordify try {} @catch (...) {}
#endif
