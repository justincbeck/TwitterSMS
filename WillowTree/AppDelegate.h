//
//  AppDelegate.h
//  WillowTree
//
//  Created by Justin Beck on 10/14/11.
//  Copyright (c) 2011 BeckProduct. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>

#import "RootViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, RKRequestDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) RootViewController *rootViewController;

@end
