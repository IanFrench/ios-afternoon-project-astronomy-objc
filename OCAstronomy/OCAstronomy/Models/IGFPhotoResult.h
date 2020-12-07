//
//  IGFPhotoResult.h
//  OCAstronomy
//
//  Created by Ian French on 12/2/20.
//

#import <Foundation/Foundation.h>

@class IGFPhoto;

NS_ASSUME_NONNULL_BEGIN
NS_SWIFT_NAME(PhotoResult)

@interface IGFPhotoResult : NSObject
@property (nonatomic, readonly, copy) NSArray<IGFPhoto *> *photos;

- (instancetype)initWithPhotos:(NSArray<IGFPhoto *> *)photos;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
