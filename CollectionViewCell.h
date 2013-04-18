//
//  collectionViewCell.h
//  LinkedList
//
//  Created by Jillian Crossley on 2013-04-17.
//  Copyright (c) 2013 Jillian Crossley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLItem.h"

@interface CollectionViewCell : UICollectionViewCell

-(void) displayData: (LLItem *) data;

@end
