//
//  WebViewController.m
//  LinkedList
//
//  Created by Jillian Crossley on 2013-01-27.
//  Copyright (c) 2013 Jillian Crossley. All rights reserved.
//

#import "ArticleViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation ArticleViewController: UIViewController

@synthesize title, content;

-(void)loadView
{
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    CGRect rect = CGRectMake(0, 0, screenWidth * 2, screenHeight);
    
    UIView  *containerView = [[UIView alloc]initWithFrame:rect];
    [containerView setBackgroundColor: [UIColor clearColor]];
    
    scrollView = [[UIScrollView alloc]initWithFrame:rect];
    [scrollView setContentSize:rect.size];
    [scrollView setBackgroundColor:[UIColor clearColor]];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.bounces = NO;
    [scrollView setPagingEnabled:YES];
    [scrollView setDelegate:self];
    [scrollView addSubview:containerView];

    /*UIView *av = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight * 2)];
    [av setBackgroundColor:[UIColor whiteColor]];
    
    
    CGFloat width = 320;
    
    UILabel *titleBox = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 3*(width/4), width/10)];
    titleBox.font = [UIFont fontWithName: @"Avenir" size:18.0];
    titleBox.textColor = [UIColor blackColor];
    titleBox.backgroundColor = [UIColor clearColor];
    [titleBox setText:@"Hey this is a title"];
    [av addSubview:titleBox];*/
    
    
    webView = [[UIWebView alloc]initWithFrame:CGRectMake(screenWidth, 0, screenWidth, screenHeight)];
    NSLog(@"0width: %f", webView.frame.size.width);
   // UIScrollView *articleScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(screenWidth, 0, screenWidth*2, screenHeight)];
    //[articleScrollView setContentSize: CGRectMake(0, 0, screenWidth, screenHeight*2).size];
   // [articleScrollView setBackgroundColor:[UIColor whiteColor]];
    [webView setDelegate:self];
    //[articleScrollView setBounces:NO];
   // [articleScrollView setShowsVerticalScrollIndicator:YES];
    [containerView addSubview:webView];
   [webView setScalesPageToFit:YES];
    
    [self setView: scrollView];
     NSLog(@"1width: %f", webView.frame.size.width);
}

-(void)loadPageWithUrl: (NSURL*)url{
    NSLog(@"webpage: %@", url);

   NSURLRequest *req = [NSURLRequest requestWithURL:url];
   [webView loadRequest:req];
}


- (void)scrollViewDidScroll:(UIScrollView *)sender {
    if(scrollView.contentOffset.x == 0){
        [self willMoveToParentViewController:nil];
        [self.view removeFromSuperview];
    }
  
}

-(void)didMoveToParentViewController:(UIViewController*) nc{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    CGRect arect = CGRectMake(screenWidth, 0, screenWidth*2, screenHeight);
    [scrollView scrollRectToVisible:arect animated: YES];
    NSLog(@"2width: %f", webView.frame.size.width);
    
}

-(void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
}

-(void)setTitle:(NSString *)newTitle
{
    title = newTitle;
}

-(void)setContent:(NSString *)newContent
{
    content = newContent;
}



@end
