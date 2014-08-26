//
//  TEMCollectionViewControllerSpec.m
//  Etsy
//
//  Created by DL Admin on 6/19/14.
//  Copyright (c) 2014 Detroit Labs. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "TEMCollectionViewController.h"
#import "TEMProductCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

SPEC_BEGIN(TEMCollectionViewControllerSpec)

	describe(@"TEMCollectionViewController", ^{
		__block TEMCollectionViewController *collectionViewController;
        __block TEMProductCell *cell;
        
        beforeEach(^{
            collectionViewController = [[TEMCollectionViewController alloc] init];
            cell = [[TEMProductCell alloc] init];
        });
        
        it(@"should have an etsyService property", ^{
            [[collectionViewController.etsyService shouldNot] beNil];
        });
        
        it(@"should update cell productLabel with the product names", ^{
            cell.productLabel = [UILabel nullMock];
            NSString *sampleProduct = @"Bright & Bubbly Cardigan";
            
            NSDictionary *dictionary = @{@"title":sampleProduct};
            NSArray *anArray = @[dictionary];
            collectionViewController.storeItems = anArray;
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
            NSString *capturedString = [[collectionViewController.storeItems objectAtIndex:indexPath.row] valueForKey:@"title"];
            
            [[cell.productLabel should] receive:@selector(setText:) withArguments:capturedString];
            
            KWCaptureSpy *spy = [collectionViewController.etsyService captureArgument:@selector(getEtsyStoreItems:) atIndex:0];
            
            [cell.productLabel setText:sampleProduct];
            [collectionViewController viewDidLoad];
            
            void (^capturedSuccessBlock)(NSArray *) = spy.argument;
            capturedSuccessBlock(anArray);
        });
        
        it(@"should update cell productImageView to display product images", ^{
            cell.productImageView = [UIImageView nullMock];
            
            NSString *anImageURLString = @"https://www.etsy.com/listing/128812026/bright-bubbly-cardigan?utm_source=practiceapp&utm_medium=api&utm_campaign=api";
            NSURL *sampleImageURL = [[NSURL alloc] initWithString: anImageURLString];
            
            NSDictionary *dictionary = @{@"MainImage":@{@"url_170x135":sampleImageURL}};
            NSArray *anArray = @[dictionary];
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
            NSString *capturedString = [[[anArray objectAtIndex:indexPath.row] valueForKeyPath:@"MainImage"] valueForKeyPath:@"url_170x135"];
            
            [[cell.productImageView should] receive:@selector(setImageWithURL:) withArguments:capturedString];
            
            KWCaptureSpy *spy = [collectionViewController.etsyService captureArgument:@selector(getEtsyStoreItems:) atIndex:0];
            
            [cell.productImageView setImageWithURL:sampleImageURL];
            [collectionViewController viewDidLoad];
            
            void (^capturedSuccessBlock)(NSArray *) = spy.argument;
            capturedSuccessBlock(anArray);

        });

	});

SPEC_END
