//
//  TEMViewControllerSpec.m
//  Etsy
//
//  Created by Taylor McGregor on 6/16/14.
//  Copyright (c) 2014 Taylor McGregor. All rights reserved.
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
            
            NSDictionary *dictionary = @{@"shop_name":sampleTitle};
            NSArray *anArray = @[dictionary];
            NSString *capturedString = [[anArray firstObject] valueForKeyPath:@"shop_name"];
            
            [[viewController.storeTitle should] receive:@selector(setText:) withArguments:capturedString];
            
            KWCaptureSpy *spy = [viewController.etsyService captureArgument:@selector(getEtsyStore:) atIndex:0];
            [viewController viewDidLoad];
            void (^capturedSuccessBlock)(NSArray *) = spy.argument;
            capturedSuccessBlock(anArray);
        });

        it(@"updates numberOfListings Label with the number of active listings on Etsy", ^{
            viewController.numberOfListings = [UILabel nullMock];
            NSInteger sampleNumber = 12;
            NSString *sampleNumberString = [@(sampleNumber) stringValue];
            
            NSDictionary *dictionary = @{@"listing_active_count":sampleNumberString};
            NSArray *anArray = @[dictionary];
            NSString *capturedString = [[anArray firstObject] valueForKeyPath:@"listing_active_count"];
            
            [[viewController.numberOfListings should] receive:@selector(setText:) withArguments:capturedString];
            
            KWCaptureSpy *spy = [viewController.etsyService captureArgument:@selector(getEtsyStore:) atIndex:0];
            [viewController viewDidLoad];
            void (^capturedSuccessBlock)(NSArray *) = spy.argument;
            capturedSuccessBlock(anArray);
        });

        it(@"updates storeSummary with the correct store Summary from Etsy", ^{
            viewController.storeSummary = [UITextView nullMock];
            NSString *sampleSummary = @"This is a very short summary";
            
            NSDictionary *dictionary = @{@"announcement":sampleSummary};
            NSArray *anArray = @[dictionary];
            NSString *capturedString = [[anArray firstObject] valueForKeyPath:@"announcement"];

            
            [[viewController.storeSummary should] receive:@selector(setText:) withArguments:capturedString];
            
            KWCaptureSpy *spy = [viewController.etsyService captureArgument:@selector(getEtsyStore:) atIndex:0];
            [viewController viewDidLoad];
            void (^capturedSuccessBlock)(NSArray *) = spy.argument;
            capturedSuccessBlock(anArray);
        });
	});

SPEC_END
