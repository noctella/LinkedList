//
//  LLItem.h
//  LinkedList
//
//  Created by Jillian Crossley on 2013-01-29.
//  Copyright (c) 2013 Jillian Crossley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ANUser.h"

@interface LLItem : NSObject 
{
    
}


@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSString *mobilizedLink;
@property (nonatomic, strong) NSString *snippet;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *originalPost;
@property (nonatomic, strong) ANUser *poster;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) UIImage * avatarImage;

-(void)cacheWebpage;

@end
