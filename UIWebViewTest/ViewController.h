//
//  ViewController.h
//  UIWebViewTest
//
//  Created by Tang Qiao on 12-4-10.
//  Copyright (c) 2012年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIWebViewDelegate>

@property (retain, nonatomic) UIWebView *webView;
@property (retain, nonatomic) UIButton *addLineBtn;

@end
