//
//  WebViewController.m
//  QiPinTong
//
//  Created by mac on 2017/3/15.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>
#import "LWActiveIncator.h"
@interface WebViewController ()<WKUIDelegate,WKNavigationDelegate,UIWebViewDelegate>

@property(nonatomic,strong)WKWebView *webVc;

@property (nonatomic ,strong) UIProgressView *progressView;

//@property(nonatomic,strong) UIWebView *webView;

@end

@implementation WebViewController

-(WKWebView *)webVc
{
    if (!_webVc) {
        _webVc = [[WKWebView alloc]initWithFrame:self.view.bounds];
        _webVc.backgroundColor = whiteC;
//        _webVc.UIDelegate = self;
        _webVc.navigationDelegate = self;
        
        _webVc.multipleTouchEnabled = YES;
        
        _webVc.autoresizesSubviews = YES;
        
        _webVc.scrollView.alwaysBounceVertical = YES;
        
        _webVc.allowsBackForwardNavigationGestures = YES;
        
//        _webVc.goForward
        
        
    }
    return _webVc;
}


-(void)viewWillAppear:(BOOL)animated
{
    
    [LWActiveIncator showInView:self.view];
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = self.ctrlStr;
    
    self.view.backgroundColor = whiteC;
    
    [self.webVc addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:self.urlStr];
    
    [self.webVc loadRequest:request];
    
    [self.view addSubview:self.webVc];
    
    self.progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 2)];
//    self.progressView.backgroundColor = grayC;
    self.progressView.progressTintColor = orangeC;
    self.progressView.trackTintColor = blueC;
    
    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
    self.progressView.hidden = NO;
    [self.view addSubview:self.progressView];
    
    
    /*
    
    [self.webVc loadRequest:request];
     */
}



-(void)dealloc
{
    [self.webVc removeObserver:self forKeyPath:@"estimatedProgress"];
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    HWLog(@"haha");
    
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        
        self.progressView.progress = self.webVc.estimatedProgress;
        
        
        if (self.progressView.progress == 1) {
            
            WeakSelf(self);
            
            [UIView animateWithDuration:0.25f delay:0.5f options:UIViewAnimationOptionCurveEaseOut animations:^{
                weakSelf.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.4f);
            } completion:^(BOOL finished) {
               
                weakSelf.progressView.hidden = YES;
                
            }];
            
        }
        
    }else
    {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}



//页面开始加载时调用
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    self.progressView.hidden = NO;
    
    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
    
    [self.view bringSubviewToFront:self.progressView];
}
//页面开始返回时调用
-(void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation
{
    
}

//页面加载完成之后调用
-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    self.progressView.hidden = YES;
    
    [LWActiveIncator hideInViwe:self.view];
//    [MBProgressHUD showSuccess:@"加载成功" toView:self.view];
}

//页面加载失败时调用
-(void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    self.progressView.hidden = YES;
//    [LWAlertView shoWithMessage:@"网络不给力"];
    [MBProgressHUD showError:error.localizedFailureReason toView:self.view];
    
}

#pragma mark  WKNavigtionDelegate来进行页面跳转
/*
 // 接收到服务器跳转请求之后再执行
 - (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation;
 // 在收到响应后，决定是否跳转
 - (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler;

 */

// 在发送请求之前，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    if (navigationAction.accessibilityNavigationStyle == WKNavigationTypeBackForward) {
        
        
        if (webView.backForwardList.backList.count>0) {
            
//            WKBackForwardListItem *item = webView.backForwardList.currentItem;
            
            for (WKBackForwardListItem *backItem in webView.backForwardList.backList) {
                
                [webView goToBackForwardListItem:backItem];
                
            }
            
            
        }
        
    }
    
    decisionHandler(WKNavigationActionPolicyAllow);
    
}

//- (void)webViewDidStartLoad:(UIWebView *)webView {
//    [LWActiveIncator showInView:self.view];
//}
//- (void)webViewDidFinishLoad:(UIWebView *)webView {
//    [LWActiveIncator hideInViwe:self.view];
//}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}



@end
