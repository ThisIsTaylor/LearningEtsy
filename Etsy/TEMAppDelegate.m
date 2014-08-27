//
//  TEMAppDelegate.m
//  Etsy
//
//  Created by DL Admin on 6/13/14.
//  Copyright (c) 2014 Detroit Labs. All rights reserved.
//

#import "TEMAppDelegate.h"
#import "TEMViewController.h"

@implementation TEMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
   
    TEMViewController *viewController = [[TEMViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];
    self.window.rootViewController = navController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
