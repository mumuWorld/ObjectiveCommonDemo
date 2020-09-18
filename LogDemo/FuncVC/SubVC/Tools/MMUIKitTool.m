//
//  MMUIKitTool.m
//  LogDemo
//
//  Created by mumu on 2020/9/18.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMUIKitTool.h"

@implementation MMUIKitTool
+ (void)differentWindowScreen {
    UIWindow *window = UIApplication.sharedApplication.delegate.window;
    
    UIScreen *main = UIScreen.mainScreen;
    
    UIScreen *s1 = window.screen;
    
    NSLog(@"joeLog->windwo=%@",window);
}
@end
