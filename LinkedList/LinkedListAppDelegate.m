//
//  LinkedListAppDelegate.m
//  LinkedList
//
//  Created by Jillian Crossley on 2013-01-27.
//  Copyright (c) 2013 Jillian Crossley. All rights reserved.
//

#import "LinkedListAppDelegate.h"
#import "ListViewController.h"
#import "ArticleViewController.h"
#import "LLNavigationController.h"

@implementation LinkedListAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    CGRect rect = CGRectMake(0, 0, screenWidth, screenHeight);
    
    self.window = [[UIWindow alloc] initWithFrame:rect];
    // Override point for customization after application launch.
    
    ListViewController *lvc = [[ListViewController alloc]init];
      NSLog(@"%f", lvc.view.frame.size.width);
    
    LLNavigationController *masterNav = [[LLNavigationController alloc]init];
     NSLog(@"%f", masterNav.view.frame.size.width);
    [masterNav addChildViewController:lvc];

    lvc.view.frame = rect;
    [masterNav.view addSubview:lvc.view];
    NSLog(@"%f", masterNav.view.frame.size.width);
     NSLog(@"%f", lvc.view.frame.size.width);

    [lvc didMoveToParentViewController:masterNav];
    
    [[self window]setRootViewController:masterNav];
    
    self.window.backgroundColor = [UIColor orangeColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end