//
//  AppDelegate.m
//  WillowTree
//
//  Created by Justin Beck on 10/14/11.
//  Copyright (c) 2011 BeckProduct. All rights reserved.
//

#import "AppDelegate.h"
#import "TweetTableViewController.h"

@implementation AppDelegate

@synthesize window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [window setRootViewController: [[TweetTableViewController alloc] init]];
    [window setBackgroundColor:[UIColor whiteColor]];
    [window makeKeyAndVisible];
    
    return YES;
}

@end
