//
//  SidebarViewController.m
//  LinkedList
//
//  Created by Jillian Crossley on 2013-03-21.
//  Copyright (c) 2013 Jillian Crossley. All rights reserved.
//

#import "SidebarViewController.h"

@implementation SidebarViewController

-(void)loadView
{
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    UIView *sidebarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    [sidebarView setBackgroundColor:[UIColor greenColor]];
 
    
    UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [testLabel setText:@"hello world how are all of you doing this evening"];
    [sidebarView addSubview:testLabel];

    
     [self setView: sidebarView];
    NSLog(@"hello world i am here");

}


- (void)scrollViewDidScroll:(UIScrollView *)sender {
  /*  if(scrollView.contentOffset.x == 0){
        [self willMoveToParentViewController:nil];
        [self.view removeFromSuperview];
    }*/
    
}

-(void)didMoveToParentViewController:(UIViewController*) nc{
    NSLog(@"moved to parent");

    
}

-(void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
}


@end
