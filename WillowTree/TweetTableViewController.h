//
//  TweetTableViewController.h
//  WillowTree
//
//  Created by Justin Beck on 10/16/11.
//  Copyright (c) 2011 BeckProduct. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>
#import <MessageUI/MessageUI.h>

@interface TweetTableViewController : UITableViewController <RKRequestDelegate, MFMessageComposeViewControllerDelegate>
{
    NSMutableArray *tweetData;
    BOOL dataLoaded;
}

@property (nonatomic) BOOL dataLoaded;

@end
