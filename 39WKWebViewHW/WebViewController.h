//
//  WebViewController.h
//  39WKWebViewHW
//
//  Created by Eduard Galchenko on 5/7/19.
//  Copyright © 2019 Eduard Galchenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WebViewController : UIViewController <WKNavigationDelegate>

@property (strong, nonatomic) NSString *pdfOrUrlPath;

@property (weak, nonatomic) IBOutlet WKWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButtonItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwardButtonItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *refreshButtonItem;

- (IBAction)actionBack:(UIBarButtonItem *)sender;
- (IBAction)actionForward:(UIBarButtonItem *)sender;
- (IBAction)actionRefresh:(UIBarButtonItem *)sender;


@end

NS_ASSUME_NONNULL_END
