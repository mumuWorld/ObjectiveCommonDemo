//
//  WebViewController.m
//  ScrollView
//
//  Created by YangJie on 2017/9/15.
//  Copyright © 2017年 YangJie. All rights reserved.
//

#import "L3game_WebViewController.h"
#import <WebKit/WebKit.h>
#import "NSString+MMString.h"
#import "DefineString.h"
#import "L3game_SettingView.h"
#import "WebViewJavascriptBridge.h"

@interface L3game_WebViewController ()<WKNavigationDelegate,WKUIDelegate>

@property (nonatomic,strong) UIButton *backBtn;

@property (nonatomic,strong) UIButton *settingBtn;

@property (nonatomic,copy)   NSURL *url;

@property (nonatomic,strong) WKWebView *webView;

@property (nonatomic,strong) UIProgressView *progressView;

@property (nonatomic,strong) L3game_SettingView *settingView;

@property (nonatomic,strong) WebViewJavascriptBridge *bridge;

@end

@implementation L3game_WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self L3gamef_loadWebView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(viewChangeRotation:) name:UIDeviceOrientationDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receivePurchaseFinish:) name:@"receivePurchaseFinish" object:nil];

}
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.dict = dict;
    }
    return self;
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    NSLog(@"加载失败%@", error.userInfo);
}

- (void)webView:(WKWebView *)webView
didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
                completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition
disposition, NSURLCredential * _Nullable credential))completionHandler{
    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
    NSURLCredential *card = [[NSURLCredential alloc]initWithTrust:challenge.protectionSpace.serverTrust];
    completionHandler(NSURLSessionAuthChallengeUseCredential,card);
    }
}

- (BOOL)shouldAutorotate
{
    return NO;
}
 
// 只支持竖向
- (NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationPortrait;
}

- (void)viewChangeRotation:(NSNotification *)notic
{
//    [self.webView setFrame:CGRectMake(0,MM_ProgressViewY , ScreenWidth, ScreenHeight-(MM_ProgressViewY))];
//    [self.progressView setFrame:CGRectMake(0, MM_ProgressViewY, ScreenWidth, ProgressViewH)];
//    if (_settingView) {
//        _settingView.frame = CGRectMake(0, MM_ProgressViewY, ScreenWidth, ScreenHeight-(MM_ProgressViewY));
//    }
}
/**
 支付完成后通知
 */
- (void)receivePurchaseFinish:(NSNotification *)notic
{
    NSDictionary *dict = notic.userInfo;
    NSString *resultCode = [dict objectForKey:@"ResultStatus"];
    if ([resultCode isEqualToString:@"9000"]) {
        [self showAlertView:@"支付成功，商品如未到账请尝试刷新页面"];
    } else if ([resultCode isEqualToString:@"6001"]){
        [self showAlertView:@"您已取消交易,并未扣款"];
    } else{
        [self showAlertView:@"支付失败，如有问题请联系官方客服"];
    }
    NSString *tmp = [[NSUserDefaults standardUserDefaults] objectForKey:@"myAgentUrl"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:tmp]]];
   
}
- (void)L3gamef_loadWebView
{
    self.view.backgroundColor  = [UIColor whiteColor];
//    self.webView.scrollView.backgroundColor = [UIColor clearColor];
//    self.webView.backgroundColor = [UIColor blueColor];
//    self.webView.scrollView.alpha = 0;
    [self setInterfaceOrientation:UIInterfaceOrientationPortrait];
    [self.view addSubview:self.webView];
    [self.view addSubview:self.progressView];
    if (self.url == nil)
    {
        self.title=@"网页加载错误";
    } else
    {
        NSLog(@"self.url=%@",self.url);
        NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
        [self.webView loadRequest:request];
    }
    UIView *itemView = [[UIView alloc] initWithFrame:self.backBtn.bounds];
    [itemView addSubview:self.backBtn];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView: itemView];
    
//    UIView *setingView = [[UIView alloc] initWithFrame:self.settingBtn.bounds];
//    [setingView addSubview:self.settingBtn];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:setingView];
}
#pragma mark ----   Setter方法    -----
- (NSURL *)url
{
    if(!_url)
    {
        if ([[_dict allKeys] containsObject:@"url"])
        {
            NSString *str = [_dict objectForKey:@"url"];
            _url = [NSURL URLWithString:str];
             [[NSUserDefaults standardUserDefaults] setObject:[_url absoluteString]  forKey:@"myAgentUrl"];
        } else
        {
            _url = [NSURL URLWithString:@"http://rmqp.starmj.cn/"];
        }
    }
    return _url;
}
- (WKWebView *)webView
{
    if (!_webView) {
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        config.userContentController = [WKUserContentController new];
        WKPreferences *perference = [WKPreferences new];
        perference.javaScriptEnabled = YES;
        perference.javaScriptCanOpenWindowsAutomatically = YES;
        config.preferences = perference;
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - MM_StatusBarAndNavigationBarHeight) configuration:config];
        if (@available(iOS 11.0, *)) {
            _webView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.automaticallyAdjustsScrollViewInsets = false;
        }
        _webView.allowsBackForwardNavigationGestures = YES;
        _webView.navigationDelegate = self;
        _webView.UIDelegate = self;
        [_webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];
//        进度条
        [_webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:NULL];
    }
    return _webView;
}
- (UIProgressView *)progressView
{
    if (!_progressView) {
        _progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ProgressViewH)];
        _progressView.tintColor = LightBuleColor;
        _progressView.trackTintColor = [UIColor whiteColor];
//        _progressView.transform = CGAffineTransformMakeScale(1.f, 2.f);
    }
    return _progressView;
}
- (UIButton *)backBtn
{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setTitle:@"返回游戏" forState:UIControlStateNormal];
        [_backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_backBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [_backBtn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [_backBtn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [_backBtn sizeToFit];
        [_backBtn setContentEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
        [_backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}
- (UIButton *)settingBtn
{
    if (!_settingBtn) {
        _settingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_settingBtn setImage:[UIImage imageNamed:@"optionBtn"] forState:UIControlStateNormal];
        [_settingBtn setImage:[UIImage imageNamed:@"optionBtnClick"] forState:UIControlStateHighlighted];
        [_settingBtn sizeToFit];
//        _settingBtn.frame.size.width = self.backBtn.frame.size.width;
//        _settingBtn
//        _settingBtn setFrame:cgrect
        [_settingBtn addTarget:self action:@selector(optionBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _settingBtn;
}
- (L3game_SettingView *)settingView
{
        if (!_settingView) {
            _settingView = [L3game_SettingView L3gamef_settingView];
            _settingView.frame = CGRectMake(0, MM_ProgressViewY, ScreenWidth, ScreenHeight-(MM_ProgressViewY));
            __weak typeof (self) weakSelf = self;
            _settingView.refreshBLK = ^{
                [weakSelf.webView reloadFromOrigin];// 刷新网页
            };
            _settingView.dismissBLK = ^{
                _settingView = nil;
            };
        }
        return _settingView;
}
- (WebViewJavascriptBridge *)bridge
{
    if(!_bridge){
//        [WebViewJavascriptBridge enableLogging];
        _bridge = [WebViewJavascriptBridge bridgeForWebView:self.webView];
        [_bridge setWebViewDelegate:self];
    }
    return _bridge;
}
#pragma mark ----   与js交互方法    -----
- (void)registerHandler
{
    [self.bridge registerHandler:@"" handler:^(id data, WVJBResponseCallback responseCallback) {
        NSLog(@"这里是 js 调用 OC");
        responseCallback(@"");//回调js方法
    }];
}
- (void)callJSFromOC:(NSDictionary *)dict
{
    [self.bridge callHandler:@"callJSHandler" data:dict];
}
#pragma mark -----------wkwebview KVO---
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"title"]) {
        if (object == self.webView) {
            self.title = self.webView.title;
        } else {
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
    } else if ([keyPath isEqualToString:@"estimatedProgress"]){
        if (object ==_webView) {
            [self.progressView setAlpha:1.0f];
            [self.progressView setProgress:self.webView.estimatedProgress animated:YES];
            
            if(_webView.estimatedProgress >=1.0f) {
                
                [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    [self.progressView setAlpha:0.0f];
                } completion:^(BOOL finished) {
                    [self.progressView setProgress:0.0f animated:NO];
                }];
                
            }
        }
    } else  {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

#pragma mark -----------wkwebview delegate
// 类似 UIWebView的 -webView: shouldStartLoadWithRequest: navigationType:
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction*)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
        NSString *strRequest = [navigationAction.request.URL.absoluteString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL *url = navigationAction.request.URL;
        NSString *urlString = (url) ? url.absoluteString : @"";
        if ([urlString containsString:@"//itunes.apple.com/"]) {
            [[UIApplication sharedApplication] openURL:url];
            decisionHandler(WKNavigationActionPolicyCancel);
            return;
        }
        // Protocol/URL-Scheme without http(s)
        else if (url.scheme && ![url.scheme hasPrefix:@"http"]) {
            [[UIApplication sharedApplication] openURL:url];
            decisionHandler(WKNavigationActionPolicyCancel);
            return;
        }
//        NSLog(@"strRequest   ==> %@", strRequest);
//        if ([strRequest containsString:@"notify_url"]&&[strRequest containsString:@"out_trade_no"])
//        {
//            NSArray *array1 = [strRequest componentsSeparatedByString:@"?"];
//            NSString *str2 = [NSString URLDecodedString:array1[1]];
//            NSArray *array2 = [str2 componentsSeparatedByString:@"&"];
//            NSMutableDictionary *tmpDic = [NSMutableDictionary new];
//            for (NSString *str in array2) {
//                NSArray* tmp =  [str componentsSeparatedByString:@"="];
//                [tmpDic setObject:tmp[1] forKey:tmp[0]];
//            }
//            decisionHandler(WKNavigationActionPolicyCancel);//不允许跳转
//        }  else
//        {
//            decisionHandler(WKNavigationActionPolicyAllow);//允许跳转
//        }
         decisionHandler(WKNavigationActionPolicyAllow);//允许跳转
}
// WKNavigationDelegate 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    //修改字体大小 300%
//    [ webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '300%'" completionHandler:nil];
    
    //修改字体颜色  #9098b8
//    [ webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.webkitTextFillColor= '#9098b8'" completionHandler:nil];
    
}
#pragma mark ----WKUIDelegate ----------弹框代理方法
// 在JS端调用alert函数时，会触发此代理方法。
// JS端调用alert时所传的数据可以通过message拿到
// 在原生得到结果后，需要回调JS，是通过completionHandler回调
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message
initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:
                      UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                          completionHandler();
                      }]];
    
    [self presentViewController:alert animated:YES completion:NULL];

}
- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL result))completionHandler
{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(YES);
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(NO);
    }]];
    [self presentViewController:alert animated:YES completion:NULL];
    
//    NSLog(@"%@", message);
}
// JS端调用prompt函数时，会触发此方法
// 要求输入一段文本
// 在原生输入得到文本内容后，通过completionHandler回调给JS
- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(nullable NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * __nullable result))completionHandler {

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请输入" message:prompt preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.textColor = [UIColor blackColor];
        textField.placeholder = defaultText;
    }];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler([[alert.textFields lastObject] text]);
    }]];
    
    [self presentViewController:alert animated:YES completion:NULL];
}

/**
 移除通知和kvo
 */
- (void)backBtnClick
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_webView removeObserver:self forKeyPath:@"title"];
    [_webView removeObserver:self forKeyPath:@"estimatedProgress"];
//    [RCLayaHelper shareInstance].viewAblum = false;
    
#ifdef __IPHONE_9_0
    if (@available(iOS 9.0, *))
    {
        [self deleteWebCach];
    }
#endif
    //问题代码
    [self dismissViewControllerAnimated:YES completion:nil];
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
//    [RCLayaHelper shareInstance].isMaskAll = FALSE;
}
#pragma mark >>>>>>设置按钮
/**
 弹出设置界面
 */
- (void)optionBtnClick
{
    if (_settingView) {
        [_settingView L3gamef_removeAnimation];
         _settingView = nil;
    } else {
        [self.view addSubview:self.settingView];
    }
}
- (void)showAlertView:(NSString *)message
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"系统提示" message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}
- (void)setInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)])
    {
        SEL selector = NSSelectorFromString(@"setOrientation:");
        NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setTarget:[UIDevice currentDevice]];
        [invocation setSelector:selector];
        [invocation setArgument:&orientation atIndex:2];
        [invocation invoke];

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)deleteWebCach
{
    NSSet *websiteDataTypes = [WKWebsiteDataStore allWebsiteDataTypes];
    
    //// Date from
    
    NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
    
    //// Execute
    
    [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{
        
        NSLog(@"deletesuccess=");
    }];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
