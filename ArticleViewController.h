//
//  WebViewController.h
//  LinkedList
//
//  Created by Jillian Crossley on 2013-01-27.
//  Copyright (c) 2013 Jillian Crossley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LLNavigationController.h"


@interface ArticleViewController : UIViewController
{
    UIScrollView *scrollView;
}

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *content;
@end
