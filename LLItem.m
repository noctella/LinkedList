//
//  LLItem.m
//  LinkedList
//
//  Created by Jillian Crossley on 2013-01-29.
//  Copyright (c) 2013 Jillian Crossley. All rights reserved.
//

#import "LLItem.h"

@implementation LLItem
@synthesize link, title, mobilizedLink, avatarImage, snippet, content;

-(void)cacheWebpage
{
    /*NSURL *url = [NSURL URLWithString:mobilizedLink];
    NSData *webpage = [NSData dataWithContentsOfURL:url];
    NSString *content = [[NSString alloc]  initWithBytes:[webpage bytes]
                                                  length:[webpage length] encoding: NSUTF8StringEncoding];
    
    NSRange titlePrefixSearch = [content rangeOfString:@"<title>"];
    
    
    NSString *trimTitlePrefix = [content substringFromIndex:NSMaxRange(titlePrefixSearch)];
    NSRange titleSuffixSearch = [trimTitlePrefix rangeOfString:@"</title>"];
    NSString *newTitle = [trimTitlePrefix substringToIndex:titleSuffixSearch.location];
    [self setTitle:newTitle];
    
    NSRange paragraphPrefixSearch = [content rangeOfString:@"<p>"];
    
    
    NSString *trimParagraphPrefix = [content substringFromIndex:NSMaxRange(paragraphPrefixSearch)];
    NSRange paragraphSuffixSearch = [trimParagraphPrefix rangeOfString:@"."];
    NSString *newSnippet = [trimParagraphPrefix substringToIndex:paragraphSuffixSearch.location +1];*/
    
    NSString *newTitle = @"Today Will be great";
    [self setTitle:newTitle];
    
    NSString *newContent = @"This is some sample article text about nothing in particular and i hope that things will turn out well in the future. going to go buy some chocolate today and tastse some also.it will be really fun and perhaps we will alos go out for dinner later. i am meeting james at 12 pm and we will walk over to freemount. i am hoping that it does not rain because i forgot to bring my unbrella i left it at the office and yeah i don't have much for to say on the subjust right now but i think it will be a really fun day.";
    
    [self setContent: newContent];
    
    NSString *newSnippet = @"This is some sample article text about nothing in particular and i hope that things will turn out well in the future";
    [self setSnippet:newSnippet];

}


@end
