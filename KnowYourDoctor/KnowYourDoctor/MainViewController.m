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

#define FirstPage @"http://www.knowyourdoctor.com.cy"
#define SecondPage @"https://www.facebook.com/knowyourdoctor.com.cy/?ref=aymt_homepage_panel"
#define ThirdPage @"https://twitter.com/KYD_Cyprus"

#define TABHEIGHT 58

@interface MainViewController () <WKNavigationDelegate> {
    UIActivityIndicatorView *spinView;
    WKWebViewConfiguration *theConfiguration;
    WKWebView *webView;
}
@property (weak, nonatomic) IBOutlet UIView *containerTab;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentTab;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    theConfiguration = [[WKWebViewConfiguration alloc] init];
    webView = [[WKWebView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.containerTab.frame.size.height, self.view.frame.size.width, self.view.frame.size.height) configuration:theConfiguration];
    webView.navigationDelegate = self;
    
    [self setupView];
    [self loadPage:FirstPage];
}

- (void)setupView {
    self.title = @"Learn";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
}

- (void)loadPage: (NSString*)page {
    NSURL *nsurl = [NSURL URLWithString:page];
    
    NSURLRequest *nsrequest = [NSURLRequest requestWithURL:nsurl];
    [webView loadRequest:nsrequest];
    [self.view addSubview:webView];
    spinView = [Help createSpinView:self.view];
    [spinView startAnimating];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [spinView stopAnimating];
}

- (IBAction)onSwitchSegment:(id)sender {
    
    switch (self.segmentTab.selectedSegmentIndex)
    {
        case 0:
            [self loadPage:FirstPage];
            break;
        case 1:
            [self loadPage:SecondPage];
            break;
        case 2:
            [self loadPage:ThirdPage];
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

