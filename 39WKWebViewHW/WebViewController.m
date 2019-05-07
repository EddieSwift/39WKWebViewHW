//
//  WebViewController.m
//  39WKWebViewHW
//
//  Created by Eduard Galchenko on 5/7/19.
//  Copyright © 2019 Eduard Galchenko. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView.translatesAutoresizingMaskIntoConstraints = false;
    self.webView.navigationDelegate = self;
    
    if ([self.pdfOrUrlPath containsString:@"https"]) {
        
        NSString *urlString = self.pdfOrUrlPath;
        
        NSLog(@"self.pdfOrUrlPath = %@", self.pdfOrUrlPath);
        
        self.webView.translatesAutoresizingMaskIntoConstraints = false;
        self.webView.navigationDelegate = self;
        
        NSURL *url = [NSURL URLWithString:urlString];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        [self.webView loadRequest:request];
        
        [self.view addSubview:self.webView];
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
        
    } else {
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:self.pdfOrUrlPath ofType:nil];
        
        NSURL *fileUrl = [NSURL fileURLWithPath:filePath];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:fileUrl];
        
        [self.webView loadRequest:request];
    }
    
    [self.view addSubview:self.indicator];
    [self.indicator startAnimating];
    self.webView.navigationDelegate = self;
    [self.indicator hidesWhenStopped];
}

#pragma mark - Help Methods

- (void) refreshButtons {
    
    self.backButtonItem.enabled = [self.webView canGoBack];
    self.forwardButtonItem.enabled = [self.webView canGoForward];
}

#pragma mark - WKNavigationDelegate

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
    [self.indicator stopAnimating];
    
    [self refreshButtons];
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    
    [self.indicator stopAnimating];
    
    [self refreshButtons];
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

#pragma mark - Actions

- (IBAction)actionForward:(UIBarButtonItem *)sender {
    
    if ([self.webView canGoForward]) {
        [self.webView stopLoading];
        [self.webView goForward];
    }
}

- (IBAction)actionRefresh:(UIBarButtonItem *)sender {
    
    [self.indicator startAnimating];
    [self.webView stopLoading];
    [self.webView reload];
    [self.indicator stopAnimating];
}


- (IBAction)actionBack:(UIBarButtonItem *)sender {
    
    if ([self.webView canGoBack]) {
        [self.webView stopLoading];
        [self.webView goBack];
    }
}

@end
