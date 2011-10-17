//
//  TweetTableViewController.h
//  WillowTree
//
//  Created by Justin Beck on 10/16/11.
//  Copyright (c) 2011 BeckProduct. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>

@interface TweetTableViewController : UITableViewController <RKRequestDelegate>
{
    NSMutableArray *tweetData;
    BOOL dataLoaded;
}

@end
