//
//  AppDelegate.h
//  WillowTree
//
//  Created by Justin Beck on 10/14/11.
//  Copyright (c) 2011 BeckProduct. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>

@class RootView;

@interface AppDelegate : UIResponder <UIApplicationDelegate, RKRequestDelegate>
{
    RootView *view;
}

@property (strong, nonatomic) UIWindow *window;

@end
