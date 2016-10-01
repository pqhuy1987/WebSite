//
//  MainViewController.m
//  KnowYourDoctor
//
//  Created by TUNG on 10/1/16.
//  Copyright © 2016 MACCyprus. All rights reserved.
//

#import "MainViewController.h"
#import "Help.h"
@import WebKit;

@interface MainViewController () <WKNavigationDelegate> {
    UIActivityIndicatorView *spinView;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    [self setupWebView];
}

- (void)setupView {
    self.title = @"Learn";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
}

- (void)setupWebView {
    if (self.title.length > 0) {
        WKWebViewConfiguration *theConfiguration = [[WKWebViewConfiguration alloc] init];
        WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y + 20, self.view.frame.size.width, self.view.frame.size.height) configuration:theConfiguration];
        webView.navigationDelegate = self;
        NSURL *nsurl = [NSURL URLWithString:@"http://www.knowyourdoctor.com.cy"];
        
        NSURLRequest *nsrequest = [NSURLRequest requestWithURL:nsurl];
        [webView loadRequest:nsrequest];
        [self.view addSubview:webView];
        spinView = [Help createSpinView:self.view];
        [spinView startAnimating];
    }
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [spinView stopAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

