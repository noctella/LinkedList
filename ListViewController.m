//
//  ListViewController.m
//  LinkedList
//
//  Created by Jillian Crossley on 2013-01-27.
//  Copyright (c) 2013 Jillian Crossley. All rights reserved.
//

#define TITLEBOX_TAG 1
#define SNIPPETBOX_TAG 2


#import "ListViewController.h"
#import "ArticleViewController.h"
#import "ContainerView.h"
#import "LLItem.h"
#import "LLParser.h"
#import "AppNetKit.h"
#import "LinkedListAppDelegate.h"
#import "CollectionViewLayout.h"
#import "CollectionViewCell.h"
#import <QuartzCore/QuartzCore.h>


@implementation ListViewController
@synthesize articleViewController, containerView, scrollView, sidebarSize;


-(void)viewDidLoad
{
    sidebarSize = 0.85;
    CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
   
    //CGRect rect = CGRectMake(0, 0, screenWidth * 2, screenHeight);
    CGRect rect = CGRectMake(0, 0, screenWidth + (screenWidth * sidebarSize), screenHeight);
    [self  setContainerView: [[ContainerView alloc] initWithFrame:rect]];
    [[self containerView] setBackgroundColor: [UIColor clearColor]];
   
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    CGRect scrollViewContentSize = CGRectMake(- (screenWidth * sidebarSize), 0, screenWidth + (screenWidth * sidebarSize), screenHeight);
    [scrollView setContentSize:scrollViewContentSize.size];
    [scrollView setBackgroundColor:[UIColor clearColor]];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.bounces = NO;
    [scrollView setPagingEnabled:YES];
    [scrollView setDelegate:self];
    [scrollView addSubview:containerView];
 
    
    
    [self setView:scrollView];
    
    UIScrollView *scrollViewForCollectionView = [[UIScrollView alloc] initWithFrame:CGRectMake(screenWidth * sidebarSize, 0, screenWidth, screenHeight)];
    
    [scrollViewForCollectionView setContentSize:scrollViewForCollectionView.frame.size];
    
    UICollectionViewLayout *collectionViewLayout = [[CollectionViewLayout alloc]init];
    itemView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)collectionViewLayout:collectionViewLayout];
    
    [itemView setBackgroundColor:[UIColor redColor]];
    [itemView setDelegate: self];
    [itemView setDataSource:self];
    [itemView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    
    /*articleTableView = [[UITableView alloc]initWithFrame:CGRectMake(screenWidth * sidebarSize, 0, screenWidth, screenHeight)style:UITableViewStylePlain];
    articleTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    articleTableView.rowHeight = 130;
    articleTableView.backgroundColor = [UIColor whiteColor]; //[UIColor colorWithRed:0.99 green:0.99 blue:0.99 alpha:1];
    
    [articleTableView setDataSource:self];
    [articleTableView setDelegate:self];*/

    [scrollViewForCollectionView addSubview:itemView];
    
    [[self containerView] addSubview:scrollViewForCollectionView];
 
    
    avc = [[ArticleViewController alloc]init];
    
    
    [[self llNavigationController]addChildViewController:avc];
 
    [scrollView scrollRectToVisible:CGRectMake(screenWidth * (1/sidebarSize), 0, screenWidth, screenHeight) animated:YES];

}

-(id)init
{
    self = [super init];
    if(self){
        
        [self fetchEntries];
    }
    return self;
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    
    return 2;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize size = CGSizeMake(200, 200);
    return size;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    

     NSLog(@"collection view cell width");
    
    CollectionViewCell *cell = [cv  dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath: indexPath];
    UILabel *titleBox, *snippetBox;
    NSLog(@"collection view cell width2");
    
    if([LLItems count] >= [indexPath length]){
        LLItem *currentItem = [LLItems objectAtIndex:[indexPath row]];
        [cell displayData: currentItem];
    }
    
    

    
    //if(cell == nil){
        
       // int width = articleTableView.bounds.size.width;
        // int height = articleTableView.rowHeight;
        
        //cell = [itemView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"CollectionViewCell"];
        
        /*UIImage *indicatorTriangleUnread = [UIImage imageNamed: @"indicatorTriangleUnread.png"];
        UIImageView *unreadTriangleView = [[UIImageView alloc] initWithImage:indicatorTriangleUnread];
        
        unreadTriangleView.frame = CGRectMake(tableView.bounds.size.width - indicatorTriangleUnread.size.width, 0, indicatorTriangleUnread.size.width, indicatorTriangleUnread.size.height);
       

        [cell.contentView addSubview:unreadTriangleView];
        
        float startingX = width/12;
        float snippetWidth = width - 2*startingX;
        float snippetHeight = width/5;

        titleBox = [[UILabel alloc] initWithFrame:CGRectMake(startingX, width/40, snippetWidth, width/10)];
        titleBox.tag = TITLEBOX_TAG;
        titleBox.font = [UIFont fontWithName: @"Avenir" size:18.0];
        titleBox.textColor = [UIColor blackColor];
        titleBox.backgroundColor = [UIColor clearColor];
        
        //titleBox.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
        [cell.contentView addSubview:titleBox];
        
        
        snippetBox = [[UILabel alloc] initWithFrame:CGRectMake(startingX,  width/27 + titleBox.frame.size.height, snippetWidth,snippetHeight )];
        snippetBox.tag = SNIPPETBOX_TAG;
        snippetBox.font = [UIFont fontWithName: @"Avenir" size:14.0];
        snippetBox.textColor = [UIColor blackColor];
        snippetBox.backgroundColor = [UIColor clearColor];
        snippetBox.lineBreakMode = NSLineBreakByWordWrapping;
        snippetBox.numberOfLines = 4;
        
        //titleBox.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
        [cell.contentView addSubview:snippetBox];

        
        UIImage *separator = [UIImage imageNamed:@"separator.png"];
        UIImageView *separatorView = [[UIImageView alloc] initWithImage:separator];
        separatorView.frame = CGRectMake(0, 0, separator.size.width - indicatorTriangleUnread.size.width, separator.size.height);
        [cell.contentView addSubview: separatorView];*/
        
        
    //}else{
         //titleBox = (UILabel *)[cell.contentView viewWithTag:TITLEBOX_TAG];
    //}

    //[titleBox setText: [currentItem title]];
    //[snippetBox setText: [currentItem snippet]];

    return cell;
}

-(void)fetchEntries
{
    LLItems = [[NSMutableArray alloc]init];
                
    NSURL *appAccessURL = [NSURL URLWithString:@"https://account.app.net/oauth/access_token"];
    
    NSMutableURLRequest *appnetReqest = [[NSMutableURLRequest alloc]initWithURL:appAccessURL];
    [appnetReqest setHTTPMethod:@"POST"];
    NSString *clientId = @"EMkJTS2VaHXu3dr9grHU32LCUfEwcpGc";
    NSString *clientSecret = @"khJG87nfwWE7RJ2GTCJv7xBKtfYD8MqV";
    NSString *requestBody = [NSString stringWithFormat:@"client_id=%@&client_secret=%@&grant_type=client_credentials", clientId, clientSecret];
    [appnetReqest setHTTPBody: [requestBody dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES]];
    
    NSString *userToken = @"AQAAAAAAAimn9WNEU3eUTZwVCnbxpTZ-nfrCKYTKyr7FPsGtaDQA9Tt2FhJD6mpBnjG1f8n1y59qGM0XeCX5FaHFdDrrwK8gZg";
    
    ANSession *session  = [ANSession defaultSession];
    session.accessToken = userToken;
    
    [session postsInStreamWithCompletion:^(ANResponse * response, NSArray * posts, NSError * error) {
        
        LLParser *parser = [[LLParser alloc]init];
        LLItems = [[NSMutableArray alloc]init];
        [parser parsePosts:posts toLLItems:LLItems usingItemView: itemView];
        //[itemView reloadData];
        
    }];

}

-(void)didMoveToParentViewController:(UIViewController*) nc{
    self.llNavigationController = nc;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;

    [[self llNavigationController].view addSubview:avc.view];
    avc.view.frame = screenRect;
    
    
    LLItem *item = [LLItems objectAtIndex:[indexPath row]];
    
    //NSURL *url = [NSURL URLWithString:[item mobilizedLink]];
    NSURL *url = [NSURL URLWithString:[item url]];
    NSLog(@"%@", item);

    NSLog(@"url: %@", [item url]);
    NSLog(@"url2: %@", [item mobilizedLink]);

    [avc loadPageWithUrl:url];
    [avc didMoveToParentViewController:[self llNavigationController]];

    //[avc setTitle:[item title]];
    //[avc setContent:[item content]];

    
}


@end
