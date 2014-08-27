//
//  TEMEtsyService.h
//  Etsy
//
//  Created by Taylor McGregor on 6/13/14.
//  Copyright (c) 2014 Taylor McGregor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface TEMEtsyService : NSObject

@property (nonatomic) AFHTTPRequestOperationManager *operationManager;
@property (nonatomic) NSArray *etsyStoreItems;
@property (nonatomic) NSArray *etsyStore;

//Network Call Methods for Main View
- (void)getEtsyStore: (void (^)(NSArray *))successBlock;

//Network Call Methods for Collection View
- (void)getEtsyStoreItems: (void (^)(NSArray *))successBlock;

@end
