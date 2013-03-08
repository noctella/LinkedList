//
//  LLParser.h
//  LinkedList
//
//  Created by Jillian Crossley on 2013-02-03.
//  Copyright (c) 2013 Jillian Crossley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLParser : NSObject{
    NSMutableArray *_parsedPosts;
    UITableView *_tableView;
}


-(void) parsePosts: (NSArray *)posts toLLItems: (NSMutableArray*) parsedPosts usingTableView: (UITableView*)articleTableView;

@end
