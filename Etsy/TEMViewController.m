//
//  TEMViewController.m
//  Etsy
//
//  Created by DL Admin on 6/13/14.
//  Copyright (c) 2014 Detroit Labs. All rights reserved.
//

#import "TEMViewController.h"
#import "TEMCollectionViewController.h"

@interface TEMViewController ()

@end

@implementation TEMViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.etsyService = [[TEMEtsyService alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self populatesStoreTextFromEtsy];
    
}

- (void)populatesStoreTextFromEtsy {
    
    void (^successBlock)(NSArray *) = ^(NSArray *etsyStore){
        self.etsyStore = etsyStore;
        
        NSString *shopNameAsString = [[etsyStore firstObject] valueForKeyPath: @"shop_name"];
        UILabel *shopName = self.storeTitle;
        [shopName setText:shopNameAsString];
        
        NSNumber *listingCount = [[etsyStore firstObject] valueForKeyPath:@"listing_active_count"];
        NSInteger listingNumber = [listingCount integerValue];
        NSString *listingString = [@(listingNumber) stringValue];
        UILabel *listingNumberLabel = self.numberOfListings;
        [listingNumberLabel setText:listingString];
        
        NSString *storeSummaryAsString = [[etsyStore firstObject] valueForKeyPath:@"announcement"];
        UITextView *storeSummaryTextView = self.storeSummary;
        [storeSummaryTextView setText:storeSummaryAsString];
    };
    
    [self.etsyService getEtsyStore:successBlock];

}

- (IBAction)productButtonPressed:(id)sender {
    
    TEMCollectionViewController *productCollectionView = productCollectionView = [[TEMCollectionViewController alloc] initWithNibName:@"TEMCollectionViewController" bundle:nil];
    [self.navigationController pushViewController:productCollectionView animated:YES];
    
}


@end
