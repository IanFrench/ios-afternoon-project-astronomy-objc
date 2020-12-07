//
//  IGFPhoto.m
//  OCAstronomy
//
//  Created by Ian French on 12/2/20.
//

#import "IGFPhoto.h"
#import "OCAstronomy-Swift.h"
@implementation IGFPhoto

- (instancetype) initWithPhotoId:(NSNumber *)photoId sol:(NSNumber *)sol imgURL:(NSURL *)imgURL earthDate:(NSDate *)earthDate camera:(NSString *)camera rover:(Rover *)rover
{
    self = [super init];

    if(self)
    {
        _photoId = photoId;
        _sol = sol;
        _imgURL = imgURL;
        _earthDate = earthDate;
        _camera = camera;
        _rover = rover;
    }

    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];

    NSNumber *photoID = dictionary[@"id"];
    NSNumber *sol = dictionary[@"sol"];
    NSURL *imgURL = [NSURL URLWithString:dictionary[@"img_src"]];
    NSDate *earthDate = [formatter dateFromString:dictionary[@"earth_date"]];

    NSDictionary *cameraDictionary = dictionary[@"camera"];
    NSString *camera = cameraDictionary[@"full_name"];

    NSDictionary *roverDictionary = dictionary[@"rover"];

    NSNumber *roverId = roverDictionary[@"id"];
    NSString *name = roverDictionary[@"name"];
    NSDate *landingDate = [formatter dateFromString:roverDictionary[@"landing_date"]];
    NSDate *launchDate = [formatter dateFromString:roverDictionary[@"launch_date"]];
    NSString *status = roverDictionary[@"status"];


    Rover *rover = [[Rover alloc] initWithId:roverId.intValue name:name landingDate:landingDate launchDate:launchDate status:status];

    self = [self initWithPhotoId:photoID sol:sol imgURL:imgURL earthDate:earthDate camera:camera rover:rover];
    return self;
}

@end

