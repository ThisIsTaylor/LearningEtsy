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
    
    void (^successBlock)(NSString *) = ^(NSString *etsyStoreName){
        NSString *shopNameAsString = etsyStoreName;
        UILabel *shopName = self.storeTitle;
        [shopName setText:shopNameAsString];
    };
    
    [self.etsyService getEtsyStore:successBlock];
    
    void (^secondSuccessBlock)(NSInteger) = ^(NSInteger currentListingNumber){
        NSString *listingString = [@(currentListingNumber) stringValue];
        UILabel *listingNumberLabel = self.numberOfListings;
        [listingNumberLabel setText:listingString];
    };
    
    [self.etsyService getEtsyListingNumber:secondSuccessBlock];
    
    void (^thirdSuccessBlock)(NSString *) = ^(NSString *etsyStoreSummary){
        NSString *storeSummaryAsString = etsyStoreSummary;
        UITextView *storeSummaryTextView = self.storeSummary;
        [storeSummaryTextView setText:storeSummaryAsString];
    };
    
    [self.etsyService getEtsyStoreSummary:thirdSuccessBlock];
    
}

- (IBAction)productButtonPressed:(id)sender {
    
    TEMCollectionViewController *productCollectionView = productCollectionView = [[TEMCollectionViewController alloc] initWithNibName:@"TEMCollectionViewController" bundle:nil];
    [self.navigationController pushViewController:productCollectionView animated:YES];
    
//    self.eventsViewController =[[EventsViewController alloc]initWithNibName:@"EventsViewController" bundle:nil];
//    [self.navigationController pushViewController:eventsViewController animated:YES];
}


@end
