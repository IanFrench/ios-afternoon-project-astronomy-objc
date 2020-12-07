//
//  IGFPhotoFetcher.m
//  OCAstronomy
//
//  Created by Ian French on 12/2/20.
//

#import "IGFPhotoFetcher.h"
#import "IGFPhoto.h"
#import "IGFPhotoResult.h"
#import "LSIErrors.h"
#import "LSILog.h"


////https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=DEMO_KEY
static NSString *baseURLString = @"https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?";
static NSString *APIKey = @"af1ezzviBt2eSfdvcG7WpFv6bRFovnuLziB6aJMO";


@implementation IGFPhotoFetcher

- (void)fetchPhotosFromSol:(NSNumber *)sol completion:(IGFPhotoFetcherCompletion)completion

{
    NSURLComponents *urlComponents = [NSURLComponents componentsWithString:baseURLString];
    urlComponents.queryItems = @[
        [NSURLQueryItem queryItemWithName:@"sol" value:[NSString stringWithFormat:@"%@", sol]],
        [NSURLQueryItem queryItemWithName:@"api_key" value:APIKey]
    ];

    NSURL *url = urlComponents.URL;

    if (url) {
        NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (error) {
                completion(nil, error);
                return;
            }

            if (data == nil) {
                NSError *dataError = errorWithMessage(@"Unable to retrieve data", LSIDataNilError);
                completion(nil, dataError);
                return;
            }

            NSError *jsonError = nil;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];

            if (jsonError) {
                completion(nil, jsonError);
                return;
            }

            IGFPhotoResult *photoResults = [[IGFPhotoResult alloc] initWithDictionary:json];
            completion(photoResults.photos, nil);
        }];

        [task resume];
    } else {
        NSLog(@"Invalid URL");
    }
}

@end
