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
            if (collectionViewController.storeItems){
            cell.productLabel = [UILabel nullMock];
            NSString *sampleProduct = @"A Product Title";
            
            [[cell.productLabel should] receive:@selector(setText:) withArguments:sampleProduct];
            
            KWCaptureSpy *spy = [collectionViewController.etsyService captureArgument:@selector(getEtsyStoreItems:) atIndex:0];
            [collectionViewController viewDidLoad];
            void (^capturedSuccessBlock)(NSString *) = spy.argument;
            capturedSuccessBlock(sampleProduct);
            }
        });
        
        it(@"should update cell productImageView to display product images", ^{
            if (collectionViewController.storeItems){
                cell.productImageView = [UIImageView nullMock];
                NSString *sampleImageURL = @"this is an image URL";
                
                [[cell.productImageView should] receive:@selector(setImageWithURL:) withArguments:sampleImageURL];
                
                KWCaptureSpy *spy = [collectionViewController.etsyService captureArgument:@selector(getEtsyStoreItems:) atIndex:0];
                [collectionViewController viewDidLoad];
                void (^capturedSuccessBlock)(NSString *) = spy.argument;
                capturedSuccessBlock(sampleImageURL);
            }
        });

	});

SPEC_END
