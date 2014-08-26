//
//  TEMViewController.h
//  Etsy
//
//  Created by DL Admin on 6/13/14.
//  Copyright (c) 2014 Detroit Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TEMEtsyService.h"

@interface TEMViewController : UIViewController

@property (nonatomic) TEMEtsyService *etsyService;
@property (nonatomic, weak) IBOutlet UILabel *storeTitle;
@property (nonatomic, weak) IBOutlet UILabel *numberOfListings;
@property (nonatomic, weak) IBOutlet UITextView *storeSummary;
@property (nonatomic) NSArray *etsyStore;

- (void)populatesStoreTextFromEtsy;

@end
