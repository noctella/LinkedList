//
//  ListViewController.h
//  LinkedList
//
//  Created by Jillian Crossley on 2013-01-27.
//  Copyright (c) 2013 Jillian Crossley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContainerView.h"
#import "SidebarViewController.h"
#import "LLNavigationController.h"

@class ArticleViewController;

@interface ListViewController : UIViewController
{
    
/*javascript:(function({
    var INSTAPAPER=true,w=window,d=document,pageSelectedTxt=w.getSelection?w.getSelection():(d.getSelection)?d.getSelection():(d.selection?d.selection.createRange().text:0),pageTitle=d.title,pageUri=w.location.href,tmplt="";
    tmplt="From ["+pageTitle+"]("+pageUri+"):\n\n";
    if(pageSelectedTxt!="") {
        pageSelectedTxt=">%20"+pageSelectedTxt;
        pageSelectedTxt=pageSelectedTxt.replace(/(\r\n|\n+|\r)/gm,"\n");
        pageSelectedTxt=pageSelectedTxt.replace(/\n/g,"\n>%20\n>%20");
        w.location.href="nvalt://make/?txt="+encodeURIComponent(tmplt+pageSelectedTxt)+"&title="+encodeURIComponent(pageTitle)
    }
    else {
        if(INSTAPAPER) {
            pageUri="http://www.instapaper.com/m?u="+encodeURIComponent(pageUri)
        };
        w.location.href="nvalt://make/?url="+encodeURIComponent(pageUri)+"&title="+encodeURIComponent(pageTitle)
    }
})();*/
    
    NSMutableArray *LLItems;
    //UIView *containerView;
    UITableView *articleTableView;
    ArticleViewController *avc;
    SidebarViewController *sidebarViewController;
    
}

@property (nonatomic, strong)ArticleViewController *articleViewController;
@property (nonatomic, strong)LLNavigationController *llNavigationController;
@property (nonatomic, strong) ContainerView *containerView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *storyView;


-(void) fetchEntries;
@end
