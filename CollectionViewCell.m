//
//  collectionViewCell.m
//  LinkedList
//
//  Created by Jillian Crossley on 2013-04-17.
//  Copyright (c) 2013 Jillian Crossley. All rights reserved.
//

#import "CollectionViewCell.h"
#import "LLItem.h"

@implementation CollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"making a cell mofos");

    }
    return self;
}

-(void) displayData: (LLItem *) data{
    NSLog(@"filling in the cell mother fuckers");
    
    UIView *cellView = [[UIView alloc]initWithFrame:[self frame]];
    [cellView setBackgroundColor:[UIColor grayColor]];
    [self setBackgroundColor:[UIColor greenColor]];
    

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
