//
//  TEMEtsyService.h
//  Etsy
//
//  Created by DL Admin on 6/13/14.
//  Copyright (c) 2014 Detroit Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface TEMEtsyService : NSObject

@property (nonatomic) AFHTTPRequestOperationManager *operationManager;
@property (nonatomic) NSArray *etsyStoreItems;

//Network Call Methods for Main View
- (void)getEtsyStore:(void (^)(NSString *))successBlock;
- (void)getEtsyListingNumber: (void (^)(NSInteger))successBlock;
- (void)getEtsyStoreSummary: (void (^)(NSString *))successBlock;

//Network Call Methods for Collection View
- (void)getEtsyStoreItems: (void (^)(NSArray *))successBlock;
- (void)getEtsyProductNames: (void (^)(NSString *))successBlock;

@end
