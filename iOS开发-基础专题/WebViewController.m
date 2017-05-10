//
//  WebViewController.m
//  iOS开发-基础专题
//
//  Created by 宇玄丶 on 2017/3/30.
//  Copyright © 2017年 阡陌科技. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
@property(nonatomic,strong)UIWebView *contentWebView;
@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.contentWebView];
    [self.contentWebView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    [self loadData];
}

- (void)loadData {
    if (self.urlStr.length) {
        NSURL* url=[NSURL URLWithString:self.urlStr relativeToURL:[NSURL URLWithString:@"https://"]];
        NSURLRequest *request =[NSURLRequest requestWithURL:url];
        [self.contentWebView loadRequest:request];
        return;
    }
    if (self.filePath.length) {
        NSString *bundleFilePath = [[NSBundle mainBundle] pathForResource:self.filePath ofType:@"html"];
        NSString *htmlString = [NSString stringWithContentsOfFile:bundleFilePath encoding:NSUTF8StringEncoding error:nil];
        [self.contentWebView loadHTMLString:htmlString baseURL:[NSURL URLWithString:bundleFilePath]];
        return;
    }
    if (self.content.length) {
        [self.contentWebView loadHTMLString:self.content baseURL:nil];
        return;
    }
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView{
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    if (!self.title.length) {
        NSString *title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
        self.title = title;
    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
}

#pragma mark - getters and setters
- (UIWebView *)contentWebView {
    if (!_contentWebView) {
        _contentWebView=[[UIWebView alloc] init];
        _contentWebView.scalesPageToFit =YES;
        _contentWebView.delegate =(id)self;
        [_contentWebView setBackgroundColor:[UIColor clearColor]];
        [_contentWebView setOpaque:NO];
    }
    return _contentWebView;
}

@end
