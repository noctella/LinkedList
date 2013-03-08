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

-(void) parsePosts: (NSArray *)posts toLLItems: (NSMutableArray*)parsedPosts usingTableView: (UITableView*)articleTableView;
{
    _parsedPosts = parsedPosts;
    _tableView = articleTableView;
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
    
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc]init];
    
    
    
    for(int i=0; i<10; i++){
        NSInvocationOperation *invocationOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(loadDataAsychn:) object:posts[i]];
        [operationQueue addOperation:invocationOperation];
        
    }
}

-(void)loadDataAsychn:(NSString*)imageNo
{
    LLItem *newItem = [[LLItem alloc]init];
    [newItem cacheWebpage];
    [_parsedPosts addObject:newItem];
    [_tableView reloadData];
}

@end
