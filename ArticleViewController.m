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
    /*UISwipeGestureRecognizer *swipeRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeRight:)];
   [swipeRecognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    swipeRecognizer.delegate = self;
    
    [scrollView addGestureRecognizer: swipeRecognizer];*/


   // CGRect articleFrame = CGRectMake(screenWidth, 0, screenWidth*2, screenHeight * 2);
    UIView *av = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight * 2)];
    [av setBackgroundColor:[UIColor grayColor]];
    
    
    CGFloat width = 320;
    
    UILabel *titleBox = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 3*(width/4), width/10)];
    titleBox.font = [UIFont fontWithName: @"Avenir" size:24.0];
    titleBox.textColor = [UIColor blackColor];
    titleBox.backgroundColor = [UIColor clearColor];
    [titleBox setText:@"Hey this is a title"];
    [av addSubview:titleBox];
    
    
    UIScrollView *articleScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(screenWidth, 0, screenWidth*2, screenHeight)];
    [articleScrollView setContentSize: CGRectMake(0, 0, screenWidth, screenHeight*2).size];
    [articleScrollView setBackgroundColor:[UIColor clearColor]];
    [articleScrollView setDelegate:self];
    [articleScrollView addSubview:av];
   // [articleScrollView setBounces:NO];
    //[articleScrollView setAlwaysBounceHorizontal:NO];
    //[articleScrollView setAlwaysBounceVertical:NO];
    [containerView addSubview:articleScrollView];
   //[articleScrollView setScalesPageToFit:YES];
    
    [self setView: scrollView];
}


- (void)scrollViewDidScroll:(UIScrollView *)sender {
    if(scrollView.contentOffset.x == 0){
        NSLog(@"paged!");
        [self willMoveToParentViewController:nil];
        [self.view removeFromSuperview];
        // and then remove from the parent VC
       // [self removeFromParentViewController];
  
    }
  
}

-(void)didMoveToParentViewController:(UIViewController*) nc{
    NSLog(@"moved");

    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    CGRect arect = CGRectMake(screenWidth, 0, screenWidth*2, screenHeight);
    [scrollView scrollRectToVisible:arect animated: YES];
    
}

/*-(void)swipeRight: (UIGestureRecognizer *)gr{
    NSLog(@"testing shit");

    if(gr.state == UIGestureRecognizerStateRecognized){
        NSLog(@"removed avc");

        [self removeFromParentViewController];
    }
}*/

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
