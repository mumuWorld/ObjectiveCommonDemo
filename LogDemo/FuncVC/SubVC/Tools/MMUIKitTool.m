//
//  MMUIKitTool.m
//  LogDemo
//
//  Created by mumu on 2020/9/18.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMUIKitTool.h"

@implementation MMUIKitTool
- (instancetype)init {
    NSLog(@"%@",self);
    if (self = [super init]) {
        NSLog(@"%@",self);
    }
    return self;
}
+ (void)differentWindowScreen {
    UIWindow *window = UIApplication.sharedApplication.delegate.window;
    
    UIScreen *main = UIScreen.mainScreen;
    
    UIScreen *s1 = window.screen;
    
    NSLog(@"joeLog->windwo=%@",window);
}

- (void)ARCProblem {
    //常量区不释放
    id obj0 = @"normalStr";
    //不释放
    __weak id obj1 = obj0;
    //函数销毁释放
    id obj2 = NSObject.new;
    //创建完释放
    __weak id obj3 = NSObject.new;
    {
        //作用域结束释放
        id obj4 = NSObject.new;
    }
    //下一个autoreleasepool pop时释放
    __autoreleasing id obj5 = NSObject.new;
    //随时有可能释放 取决于self  __unsafe_unretained 不会对引用的对象做任何影响。
    __unsafe_unretained id obj6 = self;
}

- (void)viewAnimationTest {
    UIView *view  = UIView.new;
    [UIView animateWithDuration:1 animations:^{
        /*
         thread #1, queue = 'com.apple.main-thread', stop reason = breakpoint 19.1
          * frame #0: 0x000000010d70f6de LogDemo`__32-[MMUIKitTool viewAnimationTest]_block_invoke(.block_descriptor=0x00007ffee2533a50) at MMUIKitTool.m:44:9
            frame #1: 0x00007fff24bc507a UIKitCore`+[UIView _setupAnimationWithDuration:delay:view:options:factory:animations:start:animationStateGenerator:completion:] + 573
            frame #2: 0x00007fff24bc55b8 UIKitCore`+[UIView(UIViewAnimationWithBlocks) animateWithDuration:animations:completion:] + 74
         */
        NSLog(@"log1");
        view.frame = CGRectMake(0, 0, 0, 1);
    } completion:^(BOOL finished) {
        /*
         frame #0: 0x000000010d70f89f LogDemo`__32-[MMUIKitTool viewAnimationTest]_block_invoke.30(.block_descriptor=0x000000010d7d73a0, finished=NO) at MMUIKitTool.m:47:9
         frame #1: 0x00007fff24bc4b4c UIKitCore`-[UIViewAnimationBlockDelegate _didEndBlockAnimation:finished:context:] + 779
         frame #2: 0x00007fff24b9562f UIKitCore`-[UIViewAnimationState sendDelegateAnimationDidStop:finished:] + 268
         * frame #3: 0x00007fff24b95ba1 UIKitCore`-[UIViewAnimationState animationDidStop:finished:] + 259
         */
        NSLog(@"log3");
    }];
    NSLog(@"log2");
    [UIView animateWithDuration:1 delay:100000 options:0 animations:^{
        NSLog(@"log4");
    } completion:^(BOOL finished) {
        NSLog(@"log5");
    }];
    NSLog(@"log6");
}

//魔法数字
- (void)invokeBlock {
    void(^block)(void) = ^{
        NSLog(@"joeLog->test");
    };
    [UIView animateWithDuration:1 animations:block];
    
    dispatch_async(dispatch_get_main_queue(), block);
    
    dispatch_async(dispatch_get_main_queue(), block);
    
    [[NSInvocation invocationWithMethodSignature:[NSMethodSignature signatureWithObjCTypes:@"v@?"]] invokeWithTarget:block];
    
    [block invoke];
    
    void *pBlock = (__bridge void *)(block);
    void (*invoke)(void *, ...) = *((void **)pBlock + 2);
    invoke(pBlock);
}


@end
