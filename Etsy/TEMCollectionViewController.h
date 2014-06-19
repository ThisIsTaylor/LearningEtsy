//
//  TEMCollectionViewController.h
//  Etsy
//
//  Created by DL Admin on 6/16/14.
//  Copyright (c) 2014 Detroit Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>
#import "TEMEtsyService.h"

@interface TEMCollectionViewController : UICollectionViewController <UITextFieldDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>


@property (nonatomic, weak) IBOutlet UICollectionView *productCollecionView;
@property (nonatomic) NSArray *storeItems;
@property (nonatomic) TEMEtsyService *etsyService;


@end
