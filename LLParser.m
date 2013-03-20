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
     NSOperationQueue *operationQueue = [[NSOperationQueue alloc]init];
    
    for(ANPost* post in posts){
                NSString *html = [post HTML];
        
        NSInvocationOperation *invocationOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(parsePostAsychn:) object:html];
        [operationQueue addOperation:invocationOperation];
        
              // [newItem setUsername:@"jillian"];      
    }
    
    //LLItem *newItem = [[LLItem alloc]init];
    //[newItem setLink: @"http://www.mirimage.ca"];
    //NSString *instapaperBaseURL = @"http://www.instapaper.com/text?u=http%3A%2F%2Fmirimage.ca%2F";
   
   // [newItem setMobilizedLink: instapaperBaseURL];
   // NSLog(@"instapaper'd link:%@", [newItem mobilizedLink]);
    
    //[newItem setUsername:@"jillian"];
    //[newItem cacheWebpage];
    
   
    
    
    
    /*for(int i=0; i<10; i++){
        NSInvocationOperation *invocationOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(loadDataAsychn:) object:posts[i]];
        [operationQueue addOperation:invocationOperation];
        
    }*/
}

-(void)parsePostAsychn:(NSString*)html
{
    NSRange urlPrefixSearch = [html rangeOfString:@"<a href=\""];
    
    if(urlPrefixSearch.length == 0){
           [self parsePost:html];
    }
    else{
        [self parsePost:html thatContainsUrlWithRange:&urlPrefixSearch];
    }
}

-(void)parsePost: (NSString*) html thatContainsUrlWithRange: (NSRange *) urlPrefixSearch{
    NSString *trimUrlPrefix = [html substringFromIndex:NSMaxRange(*urlPrefixSearch)];
    NSRange linkSuffixSearch = [trimUrlPrefix rangeOfString:@"\">"];
    
    NSString *url = [trimUrlPrefix substringToIndex:linkSuffixSearch.location];
    NSLog(@"url: %@", url);
    
    
    NSString *instapaperBaseURL = @"http://www.instapaper.com/m?u=";
    NSString *instapaperArg = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    LLItem *newItem = [[LLItem alloc]init];
    [newItem setUrl: url];
    [newItem setMobilizedLink: [instapaperBaseURL stringByAppendingString:instapaperArg]];
    NSLog(@"mobilized link: %@", [newItem mobilizedLink]);

    [_parsedPosts addObject:newItem];
    [_tableView reloadData];
    
    NSLog(@"instapaper'd link:%@", [newItem mobilizedLink]);

}

-(void) parsePost: (NSString *)html{
    
   // LLItem *newItem = [[LLItem alloc]init];
    //[_parsedPosts addObject:newItem];
    //[_tableView reloadData];
}

@end
