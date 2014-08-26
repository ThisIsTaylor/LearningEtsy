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

- (void)getEtsyStore: (void (^)(NSArray *))successBlock {
    void (^newSuccessBlock)(AFHTTPRequestOperation *, id) = ^(AFHTTPRequestOperation *operation, id responseObject){
        
        self.etsyStore = [responseObject valueForKeyPath:@"results"];
        successBlock(self.etsyStore);
        
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


@end
