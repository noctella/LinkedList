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


@end
