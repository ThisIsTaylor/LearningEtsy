//
//  TEMEtsyServiceSpec.m
//  Etsy
//
//  Created by DL Admin on 6/13/14.
//  Copyright (c) 2014 Detroit Labs. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "TEMEtsyService.h"
#import <AFNetworking/AFNetworking.h>
#import <OHHTTPStubs/OHHTTPStubs.h>

SPEC_BEGIN(TEMEtsyServiceSpec)

	describe(@"TEMEtsyService", ^{
        
        __block TEMEtsyService *etsyService;
        __block NSString *urlString;
        
        beforeEach(^{
            etsyService = [[TEMEtsyService alloc] init];
            urlString = @"https://openapi.etsy.com/v2/shops/BritzyThrifty?api_key=sit1ohd4fxo7ojty36trvuj9";
        });
        
		it(@"should have a getEtsyStore method", ^{
            [[etsyService should] respondToSelector:@selector(getEtsyStore:)];
        });
        
        it(@"should have a getEtsyListingNumber method", ^{
            [[etsyService should] respondToSelector:@selector(getEtsyListingNumber:)];
        });
        
        it(@"should have a getEtsyStoreSummary method", ^{
            [[etsyService should] respondToSelector:@selector(getEtsyStoreSummary:)];
        });
        
        it(@"it should have an operationManager property", ^{
            [[etsyService.operationManager should] beKindOfClass:[AFHTTPRequestOperationManager class]];
        });
        
        context(@"When getEtsyStore method is called", ^{
            it(@"Should grab the correct store name", ^{
                [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                    return [[request.URL absoluteString] isEqualToString:urlString];
                } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
                    return [OHHTTPStubsResponse responseWithFileAtPath:OHPathForFileInBundle(@"sampleEtsy.json", nil) statusCode:200 headers:@{@"Content-Type":@"text/json"}];
                }];
                
                __block NSString *reportedStoreName;
                
                void (^blockThatGetsEtsyStoreName)(NSString *) = ^(NSString *etsyStoreName){
                    reportedStoreName = etsyStoreName;
                };
                
                [etsyService getEtsyStore:blockThatGetsEtsyStoreName];
                NSString *storeNameReportedByOHHTTPStubs = @"BritzyThrifty";
                
                [[expectFutureValue(reportedStoreName) shouldEventuallyBeforeTimingOutAfter(1.0)] equal:storeNameReportedByOHHTTPStubs];
            });
        });
        
        context(@"When getEtsyListingNumber method is called", ^{
            it(@"Should grab the correct listing number", ^{
                [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                    return  [[request.URL absoluteString] isEqualToString:urlString];
                } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
                    return [OHHTTPStubsResponse responseWithFileAtPath:OHPathForFileInBundle(@"sampleEtsy.json", nil) statusCode:200 headers:@{@"Content-Type":@"text/json"}];
                }];
                
                __block NSInteger reportedListingNumber;
                
                void (^blockThatGetsListingNumber)(NSInteger) = ^(NSInteger listingNumber){
                    reportedListingNumber = listingNumber;
                };
                [etsyService getEtsyListingNumber:blockThatGetsListingNumber];
                NSInteger listingNumberReportedByOHHTTPStubs = 21;
                
                [[expectFutureValue(theValue(reportedListingNumber)) shouldEventuallyBeforeTimingOutAfter(1.0)] equal:theValue(listingNumberReportedByOHHTTPStubs)];
            });
        });
        
        context(@"When getEtsyStoreSummary method is called", ^{
            it(@"Should grab the correct store summary", ^{
                [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                    return [[request.URL absoluteString] isEqualToString:urlString];
                } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
                    return [OHHTTPStubsResponse responseWithFileAtPath:OHPathForFileInBundle(@"sampleEtsy.json", nil) statusCode:200 headers:@{@"Content-Type":@"text/json"}];
                    __block NSString *reportedSummary;
                    
                    void (^blockThatGetsStoreSummary)(NSString *) = ^(NSString *storeSummary){
                        reportedSummary = storeSummary;
                    };
                    [etsyService getEtsyStoreSummary:blockThatGetsStoreSummary];
                    NSString *summaryReportedByOHHTTPStubs = @"Britzy Thrifty began with a love of thrifting & vintage finds that resulted in a closet bursting at the seams, & ended up as a Michigan based Etsy shop.\r\n\r\nVisit frequently for the latest finds in unique vintage fashions. Shopping for vintage clothing is a great way to live a greener lifestyle. \r\n\r\nWhile you're at it... come check out @BritzyThrifty on Instagram, Pinterest & Twitter for photos of our latest #thriftscores & thrifting tips.";
                    
                    [[expectFutureValue(reportedSummary) shouldEventuallyBeforeTimingOutAfter(1.0)] equal:summaryReportedByOHHTTPStubs];
                }];
            });
        });
	});
	
SPEC_END
