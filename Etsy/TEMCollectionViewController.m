//
//  TEMCollectionViewController.m
//  Etsy
//
//  Created by DL Admin on 6/16/14.
//  Copyright (c) 2014 Detroit Labs. All rights reserved.
//

#import "TEMCollectionViewController.h"
#import "TEMProductCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>



@interface TEMCollectionViewController () 

@end

@implementation TEMCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.etsyService = [[TEMEtsyService alloc]init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.productCollecionView registerNib:[UINib nibWithNibName:@"TEMProductCell" bundle:nil] forCellWithReuseIdentifier:@"EtsyProductCell"];
    self.productCollecionView.backgroundColor = [UIColor whiteColor];
    
    void (^successBlock)(NSArray *) = ^(NSArray *etsyStoreItems){
        self.storeItems = etsyStoreItems;
        
        [self.productCollecionView reloadData];
    };
    
    [self.etsyService getEtsyStoreItems:successBlock];
    
}


#pragma mark - Collection View Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [self.storeItems count];
};

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
};

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    TEMProductCell *cell = [self.productCollecionView dequeueReusableCellWithReuseIdentifier:@"EtsyProductCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.productLabel.numberOfLines = 2;
    
    NSURL *imageURL = [NSURL URLWithString:[[[self.storeItems objectAtIndex:indexPath.row] valueForKeyPath:@"MainImage"] valueForKeyPath:@"url_170x135"]];
    
    
    if (self.storeItems) {
        NSString *productName = [[self.storeItems objectAtIndex:indexPath.row] valueForKey:@"title"];
        [cell.productLabel setText:productName];
        
        [cell.productImageView setImageWithURL:imageURL];
    }
    
    return cell;
};

@end
