//
//  AppDelegate.m
//  WillowTree
//
//  Created by Justin Beck on 10/14/11.
//  Copyright (c) 2011 BeckProduct. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize rootViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    // We need a rootViewController
    rootViewController = [[RootViewController alloc] init];
    self.window.rootViewController = rootViewController;
    
    
    // Playing with grabbing a user timeline
    RKClient* client = [RKClient clientWithBaseURL:@"http://api.twitter.com/1/statuses/user_timeline.json"];
    [client get: @"?screen_name=willowtreeapps" delegate: self];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"Foo";

    rootViewController.view = label;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)request:(RKRequest*)request didLoadResponse:(RKResponse*)response
{
    // Grabbed the timeline in didFinishLaunchingWithOptions
    // Logging here
    NSLog(@"%@", [response bodyAsString]);  

    UIViewController *c = self.window.rootViewController;
    UILabel *label = [[UILabel alloc] init];
    label.text = [response bodyAsString];
    c.view = label;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
