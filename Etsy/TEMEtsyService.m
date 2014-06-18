//
//  TEMEtsyService.m
//  Etsy
//
//  Created by DL Admin on 6/13/14.
//  Copyright (c) 2014 Detroit Labs. All rights reserved.
//

#import "TEMEtsyService.h"

@implementation TEMEtsyService

- (instancetype) init {
    self = [super init];
    if (self) {
        self.operationManager = [[AFHTTPRequestOperationManager alloc] init];
    }
    return self;
}

#pragma mark - Main View Network Methods

- (void)getEtsyStore:(void (^)(NSString *))successBlock{
    
    void (^newSuccessBlock)(AFHTTPRequestOperation *, id) = ^(AFHTTPRequestOperation *operation, id responseObject){
        
        NSString *etsyStoreName = [[[responseObject valueForKeyPath:@"results"]firstObject] valueForKeyPath: @"shop_name"];
        successBlock(etsyStoreName);
        
    };
    
    [self.operationManager GET:@"https://openapi.etsy.com/v2/shops/BritzyThrifty?api_key=sit1ohd4fxo7ojty36trvuj9"
                    parameters:nil
                       success:newSuccessBlock
                       failure:nil];
}

- (void)getEtsyListingNumber: (void (^)(NSInteger))successBlock {
    void (^newSuccessBlock)(AFHTTPRequestOperation *, id) = ^(AFHTTPRequestOperation *operation, id responseObject){
        
        NSNumber *listingObject = [[[responseObject valueForKey:@"results"]firstObject]valueForKey:@"listing_active_count"];
        NSInteger currentListingNumber = [listingObject integerValue];
        successBlock(currentListingNumber);
    };
    
    [self.operationManager GET:@"https://openapi.etsy.com/v2/shops/BritzyThrifty?api_key=sit1ohd4fxo7ojty36trvuj9"
                    parameters:nil
                       success:newSuccessBlock
                       failure:nil];
    
}

- (void)getEtsyStoreSummary: (void (^)(NSString *))successBlock {
    void (^newSuccessBlock)(AFHTTPRequestOperation *, id) = ^(AFHTTPRequestOperation *operation, id responseObject){
        
        NSString *etsyStoreSummary = [[[responseObject valueForKeyPath:@"results"]firstObject] valueForKeyPath: @"announcement"];
        successBlock(etsyStoreSummary);
        
    };
    
    [self.operationManager GET:@"https://openapi.etsy.com/v2/shops/BritzyThrifty?api_key=sit1ohd4fxo7ojty36trvuj9"
                    parameters:nil
                       success:newSuccessBlock
                       failure:nil];
}


# pragma mark - Collection View Network Methods

- (void)getEtsyStoreItems: (void (^)(NSArray *))successBlock{
    void (^newSuccessBlock)(AFHTTPRequestOperation *, id) = ^(AFHTTPRequestOperation *operation, id responseObject){
        self.etsyStoreItems = [responseObject objectForKey:@"results"];
        successBlock(self.etsyStoreItems);
};

    [self.operationManager GET:@"https://openapi.etsy.com/v2/shops/BritzyThrifty/listings/active?api_key=sit1ohd4fxo7ojty36trvuj9&includes=MainImage"
                    parameters:nil
                       success:newSuccessBlock
                       failure:nil];
}

- (void)getEtsyProductNames: (void (^)(NSString *))successBlock{
    void (^newSuccessBlock)(AFHTTPRequestOperation *, id) = ^(AFHTTPRequestOperation *operation, id responseObject){
        NSString *etsyProductNames = [[[responseObject valueForKey:@"results"]allObjects] valueForKeyPath:@"title"];
        successBlock(etsyProductNames);
    };
    
    [self.operationManager GET:@"https://openapi.etsy.com/v2/shops/BritzyThrifty/listings/active?api_key=sit1ohd4fxo7ojty36trvuj9&includes=MainImage"
                    parameters:nil
                       success:newSuccessBlock
                       failure:nil];
}


@end
