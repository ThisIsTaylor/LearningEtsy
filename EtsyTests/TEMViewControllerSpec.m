//
//  TEMViewControllerSpec.m
//  Etsy
//
//  Created by DL Admin on 6/16/14.
//  Copyright (c) 2014 Detroit Labs. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "TEMViewController.h"

SPEC_BEGIN(TEMViewControllerSpec)

	describe(@"TEMViewController", ^{
		
        __block TEMViewController *viewController;
        
        beforeEach(^{
            viewController = [[TEMViewController alloc] init];
        });
        
		it(@"has an etsyService property that is not nil", ^{
            [[viewController.etsyService shouldNot] beNil];
        });
        
        it(@"updates the title label with the Etsy store name", ^{
            viewController.storeTitle = [UILabel nullMock];
            NSString *sampleTitle = @"ThisIsTaylor";
            
            [[viewController.storeTitle should] receive:@selector(setText:) withArguments:sampleTitle];
            
            
            KWCaptureSpy *spy = [viewController.etsyService captureArgument:@selector(getEtsyStore:) atIndex:0];
            [viewController viewDidLoad];
            void (^capturedSuccessBlock)(NSString *) = spy.argument;
            capturedSuccessBlock(sampleTitle);
        });

        it(@"updates numberOfListings Label with the number of active listings on Etsy", ^{
            viewController.numberOfListings = [UILabel nullMock];
            NSInteger sampleNumber = 12;
            NSString *sampleNumberString = [@(sampleNumber) stringValue];
            
            [[viewController.numberOfListings should] receive:@selector(setText:) withArguments:sampleNumberString];
            
            KWCaptureSpy *spy = [viewController.etsyService captureArgument:@selector(getEtsyStore:) atIndex:0];
            [viewController viewDidLoad];
            void (^capturedSuccessBlock)(NSString *) = spy.argument;
            capturedSuccessBlock(sampleNumberString);
        });

        it(@"updates storeSummary with the correct store Summary from Etsy", ^{
            viewController.storeSummary = [UITextView nullMock];
            NSString *sampleSummary = @"This is a very short summary";
            
            [[viewController.storeSummary should] receive:@selector(setText:) withArguments:sampleSummary];
            
            KWCaptureSpy *spy = [viewController.etsyService captureArgument:@selector(getEtsyStore:) atIndex:0];
            [viewController viewDidLoad];
            void (^capturedSuccessBlock)(NSString *) = spy.argument;
            capturedSuccessBlock(sampleSummary);
        });
	});

SPEC_END
