//
//  TEMCollectionViewController.m
//  Etsy
//
//  Created by DL Admin on 6/16/14.
//  Copyright (c) 2014 Detroit Labs. All rights reserved.
//

#import "TEMCollectionViewController.h"
#import "TEMEtsyService.h"
#import "TEMProductCell.h"


@interface TEMCollectionViewController () 

@end

@implementation TEMCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.productCollecionView registerNib:[UINib nibWithNibName:@"TEMProductCell" bundle:nil] forCellWithReuseIdentifier:@"EtsyProductCell"];
    self.productCollecionView.backgroundColor = [UIColor whiteColor];
    
    TEMEtsyService *etsyService = [[TEMEtsyService alloc] init];
    
    void (^successBlock)(NSArray *) = ^(NSArray *etsyStoreItems){
        self.storeItems = etsyService.etsyStoreItems;
        
        [self.productCollecionView reloadData];
    };
    
    [etsyService getEtsyStoreItems:successBlock];
    
}


#pragma mark - Collection View Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    NSLog(@"%lu", (unsigned long)[self.storeItems count]);
    return [self.storeItems count];
};

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
};

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    TEMProductCell *cell = [self.productCollecionView dequeueReusableCellWithReuseIdentifier:@"EtsyProductCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.productLabel.numberOfLines = 2;
    
    
    if (self.storeItems) {
        NSString *productName = [[self.storeItems objectAtIndex:indexPath.row] valueForKey:@"title"];
        [cell.productLabel setText:productName];
    }
    
    return cell;
};


#pragma mark - Collection View Delegate Methods

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO: Select Item
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    // TODO: Deselect item
}

@end
