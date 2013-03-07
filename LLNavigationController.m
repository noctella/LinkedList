//
//  LLNavigationControllerViewController.m
//  LinkedList
//
//  Created by Jillian Crossley on 2013-02-22.
//  Copyright (c) 2013 Jillian Crossley. All rights reserved.
//

#import "LLNavigationController.h"
#import "ArticleViewController.h"
#import "ListViewController.h"

@interface LLNavigationController()

@end

@implementation LLNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
        CGFloat screenWidth = screenRect.size.width;
        CGFloat screenHeight = screenRect.size.height;
        
        CGRect rect = CGRectMake(0, 0, screenWidth * 2, screenHeight);
        UIView *view = [[UIView alloc] initWithFrame:rect];
        [self setView:view];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)returnToListView{
    
    CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    /*NSLog(@"view controller3 %@", [self viewControllers]);
    ArticleViewController *avc = [self popViewControllerAnimated:NO];
     NSLog(@"view controller4 %@", [self viewControllers]);
    ListViewController *lvc = [self topViewController];
    [self setViewControllers:[NSArray arrayWithObjects: avc,lvc, nil]];
     NSLog(@"view controller4 %@", [self viewControllers]);*/
      //NSLog(@"avc position %f", avc.view.frame.origin.x);
      //[[lvc scrollView] setContentOffset:CGPointMake(screenWidth, 0) animated:NO];
      //NSLog(@"avc position %f", avc.view.frame.origin.x);
}

@end
