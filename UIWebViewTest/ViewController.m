//
//  ViewController.m
//  UIWebViewTest
//
//  Created by Tang Qiao on 12-4-10.
//  Copyright (c) 2012年 Netease. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    
    self.addLineBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.addLineBtn.frame = CGRectMake(screenW - 200, screenH - 200, 100, 50);
    [self.addLineBtn setTitle:@"增加一行" forState:UIControlStateNormal];
    [self.addLineBtn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [self.addLineBtn addTarget:self action:@selector(addContentAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.addLineBtn];
    
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH)];
    self.webView.delegate = self;
    [self.view insertSubview:self.webView belowSubview:self.addLineBtn];
    
    NSString * path = [[NSBundle mainBundle] bundlePath];
    NSURL * baseURL = [NSURL fileURLWithPath:path];
    NSString * htmlFile = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSString * htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:(NSUTF8StringEncoding) error:nil];
    [self.webView loadHTMLString:htmlString baseURL:baseURL];
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSURL * url = [request URL];
    if ([[url scheme] isEqualToString:@"youdao"]) {
        UIAlertView * alertView = [[[UIAlertView alloc] initWithTitle:@"test" message:[url absoluteString] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease];
        [alertView show];
        return NO;
    }

    return YES;
}

- (void)addContentAction:(id)sender {
    NSString * js = @" var p = document.createElement('p'); p.innerText = 'new Line';document.body.appendChild(p);";
    [self.webView stringByEvaluatingJavaScriptFromString:js];
}


- (void)dealloc {
    [self.webView release];
    [super dealloc];
}
@end
