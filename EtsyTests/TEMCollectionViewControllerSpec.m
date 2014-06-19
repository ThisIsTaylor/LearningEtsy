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

SPEC_BEGIN(TEMCollectionViewControllerSpec)

	describe(@"TEMCollectionViewController", ^{
		__block TEMCollectionViewController *collectionViewController;
        
        beforeEach(^{
            collectionViewController = [[TEMCollectionViewController alloc] init];
        });
        
        it(@"should have an etsyService property", ^{
            [[collectionViewController.etsyService shouldNot] beNil];
        });
        
        xit(@"should update cell productLabel with the product names", ^{
            [collectionViewController.productCollecionView registerNib:[UINib nibWithNibName:@"TEMProductCell" bundle:nil] forCellWithReuseIdentifier:@"EtsyProductCell"];
            
            TEMProductCell *cell = [[TEMProductCell alloc] init];
            cell.productLabel = [UILabel nullMock];
            NSString *sampleProduct = @"A Product Title";
            
            [[cell.productLabel should] receive:@selector(setText:) withArguments:sampleProduct];
            
            KWCaptureSpy *spy = [collectionViewController.etsyService captureArgument:@selector(getEtsyStoreItems:) atIndex:0];
            [collectionViewController viewDidLoad];
            void (^capturedSuccessBlock)(NSString *) = spy.argument;
            capturedSuccessBlock(sampleProduct);

        });
	});
	
SPEC_END
