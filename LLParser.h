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
    UICollectionView *_itemView;
}


-(void) parsePosts: (NSArray *)posts toLLItems: (NSMutableArray*) parsedPosts usingItemView: (UICollectionView*)articleTableView;
-(void)post: (NSString*) html containsUrlWithRange: (NSRange *) urlPrefixSearch;

@end
