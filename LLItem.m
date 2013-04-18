//
//  LLItem.m
//  LinkedList
//
//  Created by Jillian Crossley on 2013-01-29.
//  Copyright (c) 2013 Jillian Crossley. All rights reserved.
//

#import "LLItem.h"
#import "TFHpple.h"

@implementation LLItem
@synthesize url, title, mobilizedLink, avatarImage, snippet, content;

-(void)cacheWebpage
{
    NSLog(@"url, %@", url);
           
    NSData *webpageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    
    TFHpple *webpageParser = [TFHpple hppleWithHTMLData:webpageData];

    NSString *contentQueryString = @"//p";
    NSString *titleQueryString = @"//title";
    NSArray *titles = [webpageParser searchWithXPathQuery:titleQueryString];
    
    TFHppleElement *element = titles[0];
    NSString *newTitle = [[element firstChild] content];
    [self setTitle:newTitle];
    
    NSArray *contentArray = [webpageParser searchWithXPathQuery:contentQueryString];

    TFHppleElement *contentElement = contentArray[0];
    NSString *newSnippet = [[contentElement firstChild] content];
    [self setSnippet:newSnippet];

}


@end
