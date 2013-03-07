//
//  LLParser.m
//  LinkedList
//
//  Created by Jillian Crossley on 2013-02-03.
//  Copyright (c) 2013 Jillian Crossley. All rights reserved.
//

#import "LLParser.h"
#import "AppNetKit.h"
#import "LLItem.h"

@implementation LLParser

-(NSMutableArray *) parsePosts: (NSArray *)posts
{
    NSMutableArray *parsedPosts = [[NSMutableArray alloc]init];
    /*for(ANPost* post in posts){
                NSString *html = [post HTML];
        
        NSRange linkPrefixSearch = [html rangeOfString:@"<a href=\""];
        
        if(linkPrefixSearch.location == NSNotFound)continue;
        
        NSString *trimLinkPrefix = [html substringFromIndex:NSMaxRange(linkPrefixSearch)];        
        NSRange linkSuffixSearch = [trimLinkPrefix rangeOfString:@"\">"];
        NSString *link = [trimLinkPrefix substringToIndex:linkSuffixSearch.location];
        NSLog(@"trim link: %@", link);
        
        LLItem *newItem = [[LLItem alloc]init];
        [newItem setLink: link];
        NSString *instapaperBaseURL = @"http://www.instapaper.com/m?u=";
        NSString *instapaperArg = [link stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        [newItem setMobilizedLink: [instapaperBaseURL stringByAppendingString:instapaperArg]];
        NSLog(@"instapaper'd link:%@", [newItem mobilizedLink]);

        [newItem setUsername:@"jillian"];
        [newItem cacheWebpage];
        [parsedPosts addObject:newItem];
      
    }*/
    
    //LLItem *newItem = [[LLItem alloc]init];
    //[newItem setLink: @"http://www.mirimage.ca"];
    //NSString *instapaperBaseURL = @"http://www.instapaper.com/text?u=http%3A%2F%2Fmirimage.ca%2F";
   
   // [newItem setMobilizedLink: instapaperBaseURL];
   // NSLog(@"instapaper'd link:%@", [newItem mobilizedLink]);
    
    //[newItem setUsername:@"jillian"];
    //[newItem cacheWebpage];
    
    for(int i=0; i<10; i++){
        LLItem *newItem = [[LLItem alloc]init];
         [newItem cacheWebpage];
        [newItem cacheWebpage];
        [parsedPosts addObject:newItem];
    }
      
    return parsedPosts;
    
    
    
}

@end
