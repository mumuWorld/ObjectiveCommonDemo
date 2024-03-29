//
//  MMSimpleFuncVC.m
//  LogDemo
//
//  Created by mumu on 2020/4/17.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMSimpleFuncVC.h"
#import "MMPresentTestVC.h"
#import "MMSimpleFuncModel.h"
#import "MMGCDTestTool.h"
#import "MMSimpleFuncTestTool.h"
#import "MMGenerateObjTool.h"
#import "NSString+MMString.h"
#import "MMUIKitTool.h"
#import "ELHotelDispatchTimer.h"
#import "MMPresentTestVC.h"
#import "MMGCDTestVC.h"
#import "MMSimpleFuncModel+MMExtension.h"
#import "FBRetainCycleDetector.h"
#import <AVFAudio/AVFAudio.h>

@interface MMSimpleFuncVC ()
@property (nonatomic, strong) NSArray *strongArray;
@property (nonatomic, copy) NSArray *cpArray;

@property (nonatomic, strong) NSMutableArray *strongMutableArray;
@property (nonatomic, strong) NSMutableArray *cpMutableArray;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, copy) NSString *timerName;

@property (nonatomic, strong) UIWindow *window;

@property (nonatomic, strong) MMSimpleFuncModel *funcModel;

@property (nonatomic, strong) MMSimpleFuncTestTool *testTool;

@property (nonatomic, strong) MMSimpleFuncTestTool *testToolNoShared;

@property (nonatomic, copy) dispatch_block_t emptyBlock;
@end

@implementation MMSimpleFuncVC

- (void)dealloc {
    NSLog(@"dealloc->%@",self);
    //objc[8207]: Cannot form weak reference to instance (0x7f8119431ce0) of class MMSimpleFuncVC. It is possible that this object was over-released, or is in the process of deallocation.
//    __weak typeof(self) ws = self;
//    NSLog(@"%@",ws);
}
__weak id reference = nil;

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    NSLog(@"reference=%@",reference);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [self.navigationController dismissViewControllerAnimated:YES completion:^{
//            NSLog(@"完成");
//        }];
//    });
//    NSLog(@"reference=%@", reference); // Console: (null)
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self windowTest];
//    [self test6];
    
//    NSString *obj = [NSString stringWithFormat:@"sunnyxx-%@",@"test"];
    NSArray *obj = [NSArray arrayWithObject:@"test"];
//    NSObject *obj = [NSObject new];
    // str是一个autorelease对象，设置一个weak的引用来观察它
        reference = obj;
//    NSLog(@"reference=%@", reference); // Console: (null)
    CGFloat testF = 0002.0;
    NSString *result = [NSString stringWithFormat:@"%03.1f",testF];
    NSLog(@"reference=%@", result);
//    [self animationBLockTest];
//    [self test];
//    NSLog(@"%@",self.navigationController.presentedViewController);
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [self.navigationController.presentedViewController dismissViewControllerAnimated:YES completion:nil];
//    });
    
}

- (void)test {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"test" message:@"test" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *act = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击");
//        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:act];
    [self.navigationController presentViewController:alert animated:YES completion:nil];
}

- (IBAction)handleClick:(UIButton *)sender {
    switch (sender.tag) {
        case 1:
            [self.testTool kvoRegister];
            break;
        case 2:
            [self.testTool kvoTest];
            break;
        case 3:
            [self.testTool kvoSet];
            break;
        case 4:
            [self.testTool taskTest];
            break;
        case 5:
            [self.testTool blockCancel];
            break;
        case 6:
            [self.testTool createPlist];
            break;
        case 7:
            [self.testTool modifyPlist];
            break;
        case 8: {
//            __weak typeof(self) ws = self;
//            self.emptyBlock = ^{
//                NSLog(@"进入block");
////                __strong typeof(ws) ss = ws;
////                __strong typeof(ws) self = ws;
//                __strong MMSimpleFuncVC *ss = ws;
//
//                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
////                    NSLog(@"self->%@",self);
//                    NSLog(@"self->%@",ss);
//
//                });
//            };
//            self.emptyBlock();
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            //                    NSLog(@"self->%@",self);
//                                NSLog(@"self->%@",self);
//                if([self respondsToSelector:@selector(viewDidLoad)]) {
//                    NSLog(@"self->%@",self);
//                }
//            });
            break;
        }
        case  9: {
            MMSimpleFuncTestTool *tool = [MMSimpleFuncTestTool new];
            [tool doSomethingBack:^{
                NSLog(@"self");
            }];
            break;
        }
        case 10: {
            //test->105553173940672
            NSLog(@"test->%zu",(size_t)self.testToolNoShared);
            FBRetainCycleDetector *detecotr = [FBRetainCycleDetector new];
            [detecotr addCandidate:self.testToolNoShared];
            NSSet<NSArray<FBObjectiveCGraphElement *> *> * set = [detecotr findRetainCyclesWithMaxCycleLength:20];
            NSLog(@"test->%@",set);
//            [self.testToolNoShared callSwift];
            break;
        }
        case 11: {
            [[AVAudioSession sharedInstance] setActive:true error:nil];
            [[AVAudioSession sharedInstance] setActive:true withOptions:nil error:nil];

            break;
        }
        case 12: {
            MMSimpleFuncTestTool *tool = [MMSimpleFuncTestTool new];
            __weak typeof(MMSimpleFuncTestTool *) weaktool = tool;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                [weaktool taskTest];
            });
//            tool = nil;
            
            NSString *str = nil;
            [str length];
            
//            NSString *str = nil;
            [str characterAtIndex:0];
            
            [tool crashTest];
        }
        case 13: {
            [MMSimpleFuncTestTool arrayTest];
        }
        default:
            break;
    }
}

- (void)releaseTest {
    [self preforTest];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self preforTest];
    });
}

- (void)animationBLockTest {
    [MMSimpleFuncTestTool animationBlockTest];
}

- (void)test8 {
    CGFloat test = 10;
    test -= 10 + 12; // -12
    CGFloat test_2 = 10;
    test_2 += 10 - 12; // 8
    CGFloat test_3 = 10;
    test_3 -= 10 - 12; // 12
}

- (void)gcdfunc {
    NSThread *thread = [[NSThread alloc] init];
//    [self performSelector:@selector(testThread1:) onThread:thread withObject:@{@"key":@(1)} waitUntilDone:true];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self performSelector:@selector(testThread1:) onThread:thread withObject:@{@"key":@(2)} waitUntilDone:true];
    });
    [self performSelector:@selector(testThread1:) onThread:thread withObject:@{@"key":@(3)} waitUntilDone:false];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self performSelector:@selector(testThread1:) onThread:thread withObject:@{@"key":@(4)} waitUntilDone:false];
    });
    
    //- (void)viewDidLoad {
    
    [self performSelector:@selector(testThread1:) withObject:@{@"key":@(5)} afterDelay:2];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self performSelector:@selector(testThread1:) withObject:@{@"key":@(6)} afterDelay:3];
    });
}

- (void)testThread1:(NSDictionary *)obj {
    NSLog(@"joeLog->obj=%@,thread=%@,obj=%@",self,[NSThread currentThread],obj);
}

- (void)testBLock {
        int x = 0;
       // ARC 下定义 normalBlock 后再打印其所在的内存地址
    void(^normalBlock)(void) = ^{
        NSLog(@"%d", x);
    };
    NSLog(@"normalBlock: %@", normalBlock);

    // 直接打印某个 block 的内存地址
    NSLog(@"block: %@", ^{
        NSLog(@"%d", x);
    });
}

- (void)testFuncA {
    NSLog(@"a");
}

- (void)preforTest {
    MMSimpleFuncModel *model = [MMSimpleFuncModel new];
}

- (void)testEqualArray {
    MMSimpleFuncModel *model_1 = [[MMSimpleFuncModel alloc] init];
    model_1.keyType = @"beddesc";
    model_1.content = @"c1";
    MMSimpleFuncModel *model_2 = [[MMSimpleFuncModel alloc] init];
    model_2.keyType = @"multibed";
    model_2.content = @"c2";
    MMSimpleFuncModel *model_3 = [[MMSimpleFuncModel alloc] init];
    model_3.keyType = @"multibed";
    model_3.content = @"c2";
    MMSimpleFuncModel *model_4 = [model_1 copy];
    NSArray *array_1 = @[model_1,model_2];
    NSArray *array_2 = @[model_1,model_2];
    NSArray *array_3 = @[model_1,model_3];
    NSArray *array_4 = [array_1 copy];
    NSArray *array_5 = array_1;
    BOOL equal = [array_1 isEqual:array_2];
    BOOL equal_2 = [array_1 isEqualToArray:array_2];
    BOOL equal_3 = array_1 == array_2;
    
    BOOL equal_2_1 = [array_1 isEqual:array_3];
    BOOL equal_2_2 = [array_1 isEqualToArray:array_3];
    BOOL equal_2_3 = array_1 == array_3;
    NSLog(@"resutl");
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self.timer invalidate];
//    [self test2];
    [self.funcModel postNotify];
//    MMPresentTestVC *test = [[MMPresentTestVC alloc] init];
//    test.modalPresentationStyle = UIModalPresentationFullScreen;
//    [self.navigationController presentViewController:test animated:true completion:nil];
}

/// 谓词测试
- (void)test2 {
    MMSimpleFuncModel *model_1 = [[MMSimpleFuncModel alloc] init];
    model_1.keyType = @"beddesc";
    model_1.content = @"c1";
    model_1.type = 1;
    MMSimpleFuncModel *model_2 = [[MMSimpleFuncModel alloc] init];
    model_2.keyType = @"multibed";
    model_2.content = @"c2";
    model_2.type = 2;
    MMSimpleFuncModel *model_3 = [[MMSimpleFuncModel alloc] init];
    model_2.keyType = @"beddesc";
    model_2.content = @"c3";
    model_2.type = 3;
    NSArray *array = @[@{@"keyType":@"beddesc",
                         @"content":@"c1",
                         @"type": @(1)
    },
                       @{@"keyType":@"multibed",
                         @"content":@"c1",
                         @"type": @(1)
                       }];
    NSArray *array_2 = @[model_1,model_2,model_3];
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"keyType = %@ || keyType = %@",@"beddesc",@"multibed"];
    //错误写法
    NSPredicate *pre_1 = [NSPredicate predicateWithFormat:@"keyType = beddesc"];
    
    NSPredicate *pre_2 = [NSPredicate predicateWithFormat:@"type = %d",1];
    NSPredicate *pre_5 = [NSPredicate predicateWithFormat:@"type == %d",1];

//    NSArray <MMSimpleFuncModel>*array = @[model_1,model_2];
    NSPredicate *pre_3 = [NSPredicate predicateWithFormat:@"type == 1"];
    NSPredicate *pre_4 = [NSPredicate predicateWithFormat:@"type = 1"];

//    NSArray *result = [self.hotelDetailModel.otherText filteredArrayUsingPredicate:pre];
    
    NSArray *result = [array filteredArrayUsingPredicate:pre];
    NSArray *result_2 = [array filteredArrayUsingPredicate:pre_1];
    
    NSArray *result_2_1 = [array_2 filteredArrayUsingPredicate:pre_2];
    
    NSArray *result_2_result_1 = [array_2 filteredArrayUsingPredicate:pre];
    //错误用法
    NSArray *result_2_result_2 = [array_2 filteredArrayUsingPredicate:pre_1];

    
    NSArray *result_4 = [array filteredArrayUsingPredicate:pre_3];
    NSArray *result_4_2 = [array_2 filteredArrayUsingPredicate:pre_3];
    NSArray *result_5 = [array filteredArrayUsingPredicate:pre_4];
    NSArray *result_5_2 = [array_2 filteredArrayUsingPredicate:pre_4];
    NSArray *result_6 = [array filteredArrayUsingPredicate:pre_5];
    NSArray *result_6_2 = [array_2 filteredArrayUsingPredicate:pre_5];
    NSLog(@"%@--%@",result);
}

- (void)test7 {
    NSString *test = @"多少人[多少人]多少人多少人[]";
    NSString *rules = @"\\[[^\\]]+\\]";
    
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",rules];
    NSRange reslut = [test rangeOfString:rules options:NSRegularExpressionSearch];
    NSLog(@"result=%zd",reslut.length);

    NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:rules options:0 error:nil];
    NSArray *match = [regular matchesInString:test options:NSMatchingReportCompletion range:NSMakeRange(0, test.length)];
    NSTextCheckingResult *check2 = [regular firstMatchInString:test options:NSMatchingReportCompletion range:NSMakeRange(0, test.length)];
    [regular enumerateMatchesInString:test options:NSMatchingReportCompletion range:NSMakeRange(0, test.length) usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
        
        NSLog(@"usingBlock->%d,str->%@",result.range.length,[test substringWithRange:result.range]);
    }];
    for (NSTextCheckingResult *check in match) {
        NSLog(@"range->%d,str->%@",check.range.length,[test substringWithRange:check.range]);
    }
}
- (void)test3 {
    CFUUIDRef uuidRef = CFUUIDCreate(NULL);
    CFStringRef uuid = CFUUIDCreateString(NULL, uuidRef);
    CFRelease(uuidRef);
    NSString *uuidStr = (__bridge_transfer NSString *)uuid;
    NSLog(@"uuid-%@",uuidStr);
}

- (void)test4 {
    char *str = "aabbcc";
    char *p = str + 2;
    NSLog(@"%s",p);
}

- (void)windowTest {
    UIWindow *topWindow = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    MMPresentTestVC *pre = [MMPresentTestVC new];
    __weak typeof(self) ws = self;
    __weak typeof(pre) ws_pre = pre;

    pre.callBack = ^{
        MMPresentTestVC *test = [[MMPresentTestVC alloc] init];
        [ws_pre.navigationController pushViewController:test animated:YES];

        MMGCDTestVC *test_2 = [[MMGCDTestVC alloc] init];
        [ws.navigationController pushViewController:test_2 animated:YES];
    };
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:pre];
    topWindow.rootViewController = navi;
    
    topWindow.windowLevel = 100;
    topWindow.hidden = false;
    self.window = topWindow;
    
}
- (void)test5 {
    MMSimpleFuncModel *model_1 = [[MMSimpleFuncModel alloc] init];
    model_1.keyType = @"beddesc";
    model_1.content = @"c1";
    MMSimpleFuncModel *model_2 = [[MMSimpleFuncModel alloc] init];
    model_2.keyType = @"multibed";
    model_2.content = @"c2";
    NSArray *array_2 = @[model_1,model_2];
    NSMutableArray *array_1 = [NSMutableArray arrayWithArray:array_2];

    self.strongArray = array_1;
    self.cpArray = array_1;
    NSLog(@"%p",array_1);
    NSLog(@"%@,%@, %p,%p",self.strongArray,self.cpArray,self.strongArray,self.cpArray);
    model_1 = nil;
    NSLog(@"%p",array_1);
    NSLog(@"%@,%@, %p,%p",self.strongArray,self.cpArray,self.strongArray,self.cpArray);
    self.strongArray = [array_1 copy];
    self.cpArray = [array_1 copy];
    NSLog(@"%p",array_1);
    NSLog(@"%@,%@, %p,%p",self.strongArray,self.cpArray,self.strongArray,self.cpArray);
//    self.strongMutableArray = [array_2 mutableCopy];
//    self.cpMutableArray = [array_2 copy]; //必崩
//        NSLog(@"%p",array_2);
//        NSLog(@"%@,%@, %p,%p",self.strongMutableArray,self.cpMutableArray,self.strongMutableArray,self.cpMutableArray);
//    [self.cpMutableArray removeLastObject];
//NSLog(@"%p",array_1);
}
- (void)test6 { //更改文件名
//     NSString *lastPathComponent = @"/Users/mumu/Documents/EL&TC_Pro/resource/设计稿/国内酒店迭代/967/详情页点评模块引入动态点评/assets/t";
    NSString *path2 = @"/Users/mumu/Documents/EL&TC_Pro/resource/设计稿/国内酒店迭代/973/酒店详情页头部设施icon";
    [self p_setupFileRename:path2];
//    [self p_setupFileRename:lastPathComponent];
//    [self getAllPngName:lastPathComponent];
//    [self getAllPngName:path2];
}


- (NSString *)fitNameWith:(NSString *)original {
    BOOL is2x = [original containsString:@"@2x"];
    NSString *fit = @"";
    NSString *common = @"hotelDetail_facility_entrance_";
    if ([original containsString:@"接送机"]) {
        fit = @"airport_transfer";
    } else if ([original containsString:@"儿童设施"]) {
        fit = @"child_facility";
    } else if ([original containsString:@"温泉"]) {
        fit = @"hot_spring";
    } else if ([original containsString:@"沙滩"]) {
        fit = @"private_sandbeach";
    } else if ([original containsString:@"滑雪"]) {
        fit = @"skiing";
    } else if ([original containsString:@"高尔夫"]) {
        fit = @"golf";
    } else if ([original containsString:@"潜水"]) {
        fit = @"dive";
    } else if ([original containsString:@"水上运动"]) {
        fit = @"water_sport";
    } else if ([original containsString:@"海边娱乐"]) {
        fit = @"sea_happy";
    } else if ([original containsString:@"泳池"]) {
        fit = @"swimming_pool";
    } else if ([original containsString:@"健身中心"]) {
        fit = @"gym";
    } else if ([original containsString:@"景观"]) {
        fit = @"scenery";
    } else if ([original containsString:@"免费停车"]) {
        fit = @"park";
    } else if ([original containsString:@"智能家具"]) {
        fit = @"smart_home";
    } else if ([original containsString:@"免费携带宠物"]) {
        fit = @"pet";
    } else if ([original containsString:@"spa"]) {
        fit = @"spa";
    } else if ([original containsString:@"会议室"]) {
        fit = @"meeting_room";
    } else if ([original containsString:@"行政酒廊"]) {
        fit = @"executive_lounge";
    } else if ([original containsString:@"餐厅"]) {
        fit = @"restaurant";
    } else if ([original containsString:@"接站服务"]) {
        fit = @"pickup_station";
    } else if ([original containsString:@"WIFI"]) {
        fit = @"wifi";
    } else if ([original containsString:@"24小时前台"]) {
        fit = @"24hour_receptionist_service";
    } else if ([original containsString:@"篮球场"]) {
        fit = @"basketball_court";
    } else if ([original containsString:@"茶室"]) {
        fit = @"tea_room";
    } else if ([original containsString:@"欢迎礼品"]) {
        fit = @"wellcom_gift";
    } else if ([original containsString:@"酒吧"]) {
        fit = @"bar";
    } else if ([original containsString:@"乒乓球"]) {
        fit = @"pingpang";
    } else if ([original containsString:@"休闲会所"]) {
        fit = @"lie_club";
    } else if ([original containsString:@"行李寄存"]) {
        fit = @"baggage";
    } else if ([original containsString:@"叫醒服务"]) {
        fit = @"wakeup_service";
    } else if ([original containsString:@"叫车服务"]) {
        fit = @"car_service";
    } else if ([original containsString:@"免费洗漱用品"]) {
        fit = @"wash";
    } else if ([original containsString:@"洗衣服务"]) {
        fit = @"washcloth";
    } else if ([original containsString:@"24小时热水"]) {
        fit = @"24th_hotwater";
    } else if ([original containsString:@"电梯"]) {
        fit = @"elevator";
    } else if ([original containsString:@"旅游服务"]) {
        fit = @"tour";
    } else if ([original containsString:@"外币兑换"]) {
        fit = @"foreign_currency";
    } else if ([original containsString:@"商务"]) {
        fit = @"business_center";
    } else if ([original containsString:@"入住测温"]) {
        fit = @"moveinto_temperature";
    } else if ([original containsString:@"员工测温"]) {
        fit = @"staff_temperature";
    } else if ([original containsString:@"14天无病"]) {
        fit = @"no_patient";
    } else if ([original containsString:@"每日消毒"]) {
        fit = @"everyday_disinfect";
    } else if ([original containsString:@"配备消毒设施"]) {
        fit = @"have_facility";
    } else if ([original containsString:@"咖啡厅"]) {
        fit = @"coffee_house";
    } else if ([original containsString:@"桑拿"]) {
        fit = @"sauna";
    } else if ([original containsString:@"足浴"]) {
        fit = @"foot_bath";
    }
    if(fit.length < 1) {
        return @"";
    }
    if (is2x) {
        fit = [NSString stringWithFormat:@"%@%@_header.png",fit,common];
    } else {
        return nil;
    }
    

//    fit = [NSString stringWithFormat:@"%@%@_header%@.png",common,fit,is2x ? @"@2x":@"@3x"];
    return fit;
}

- (void) p_setupFileRename:(NSString *)lastPathComponent {
    
   
    NSFileManager *fileManager = [NSFileManager defaultManager];

    NSArray *arr = [fileManager contentsOfDirectoryAtPath:lastPathComponent error:nil];
    for (NSString *name in arr) {
        NSString *fitName = [self fitNameWith:name];
        if (fitName.length == 0) {
            continue;
        }
        NSString *orginalPath = [lastPathComponent stringByAppendingPathComponent:name];
        NSString *moveToPath = [lastPathComponent stringByAppendingPathComponent:fitName];
        NSError *error;
        //通过移动该文件对文件重命名
        BOOL isSuccess = [fileManager moveItemAtPath:orginalPath toPath:moveToPath error:&error];
        if (isSuccess) {
            NSLog(@"rename success ->%@",fitName);
        }else{
            NSLog(@"%@",error);
        }
    }
}

- (void)getAllPngName:(NSString *)path {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray *arr = [fileManager contentsOfDirectoryAtPath:path error:nil];
    NSMutableArray *array = [NSMutableArray array];
    for (NSString *name in arr) {
        if ([name containsString:@".png"]) {
            NSString *imgName = [name substringToIndex:name.length - 7];
            [array addObject:imgName];
        }
    }
    NSLog(@"arr->%@",array);
}

- (void)testDate {
    NSDate *date = [NSDate date];
    NSTimeInterval timer = [date timeIntervalSince1970];
    NSLog(@"timer->%f",timer);
}
- (void)handleTimerInvoke:(id)sender {
    NSLog(@"%@",sender);
}
- (void)testTimer {
    self.timer = [NSTimer timerWithTimeInterval:3 target:self selector:@selector(handleTimerInvoke:) userInfo:nil repeats:true];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    [self.timer fire];
}

- (MMSimpleFuncTestTool *)testTool {
    if (!_testTool) {
        _testTool = [MMSimpleFuncTestTool shareInstance];
    }
    return _testTool;
}

- (MMSimpleFuncTestTool *)testToolNoShared {
    if (!_testToolNoShared) {
        _testToolNoShared = [MMSimpleFuncTestTool new];
        _testToolNoShared.simpleVC = self;
    }
    return _testToolNoShared;
}

@end
