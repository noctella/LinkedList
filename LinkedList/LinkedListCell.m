//
//  LinkedListCell.m
//  LinkedList
//
//  Created by Jillian Crossley on 2013-01-30.
//  Copyright (c) 2013 Jillian Crossley. All rights reserved.
//

#import "LinkedListCell.h"

@implementation LinkedListCell
@synthesize title;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
