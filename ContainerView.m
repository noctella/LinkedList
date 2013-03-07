//
//  ContainerView.m
//  LinkedList
//
//  Created by Jillian Crossley on 2013-02-19.
//  Copyright (c) 2013 Jillian Crossley. All rights reserved.
//

#import "ContainerView.h"

@implementation ContainerView

-(id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
    }
    return self;
}

/*-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touch!");
    self.center = CGPointMake(0, self.center.y);

}*/

-(void) scrollToArticle
{
    NSLog(@"scrollin");
    CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    [self setBounds: CGRectMake(0 - screenWidth, 0, screenWidth * 2, screenHeight)];
}

@end
