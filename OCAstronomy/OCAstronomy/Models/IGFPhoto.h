//
//  IGFPhoto.h
//  OCAstronomy
//
//  Created by Ian French on 12/2/20.
//

#import <Foundation/Foundation.h>


@class Rover;


NS_ASSUME_NONNULL_BEGIN
NS_SWIFT_NAME(Photo)


@interface IGFPhoto : NSObject
@property (nonatomic) NSNumber *photoId;
@property (nonatomic) NSNumber *sol;
@property (nonatomic) NSURL *imgURL;
@property (nonatomic) NSDate *earthDate;
@property (nonatomic) NSString *camera;
@property (nonatomic) Rover *rover;

- (instancetype)initWithPhotoId:(NSNumber *)photoId sol:(NSNumber *)sol imgURL:(NSURL *)imgURL earthDate:(NSDate *)earthDate camera:(NSString *)camera rover:(Rover *)rover;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
