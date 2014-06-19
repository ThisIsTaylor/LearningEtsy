//
//  TEMAppDelegateSpec.m
//  Etsy
//
//  Created by DL Admin on 6/16/14.
//  Copyright (c) 2014 Detroit Labs. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "TEMAppDelegate.h"

SPEC_BEGIN(TEMAppDelegateSpec)

	describe(@"TEMAppDelegate", ^{
		it(@"assigns TEMViewController as the rootViewController", ^{
            TEMAppDelegate *appDelegate = [[TEMAppDelegate alloc] init];
            [appDelegate application:nil didFinishLaunchingWithOptions:nil];
            
            [[appDelegate.window.rootViewController should]beKindOfClass:[UINavigationController class]];
        });

	});
	
SPEC_END
