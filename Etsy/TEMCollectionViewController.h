//
//  TEMCollectionViewController.h
//  Etsy
//
//  Created by Taylor McGregor on 6/16/14.
//  Copyright (c) 2014 Taylor McGregor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>
#import "TEMEtsyService.h"

@interface TEMCollectionViewController : UICollectionViewController <UITextFieldDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>


@property (nonatomic, weak) IBOutlet UICollectionView *productCollecionView;
@property (nonatomic) NSArray *storeItems;
@property (nonatomic) TEMEtsyService *etsyService;


@end
