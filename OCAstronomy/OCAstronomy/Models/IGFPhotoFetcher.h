//
//  IGFPhotoFetcher.h
//  OCAstronomy
//
//  Created by Ian French on 12/2/20.
//

#import <Foundation/Foundation.h>

@class IGFPhoto;

typedef void (^IGFPhotoFetcherCompletion)(NSArray<IGFPhoto *> * _Nullable photos, NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN
NS_SWIFT_NAME(PhotoFetcher)

@interface IGFPhotoFetcher : NSOperation

- (void)fetchPhotosFromSol:(NSNumber *)sol completion:(IGFPhotoFetcherCompletion)completion;

@end
NS_ASSUME_NONNULL_END
