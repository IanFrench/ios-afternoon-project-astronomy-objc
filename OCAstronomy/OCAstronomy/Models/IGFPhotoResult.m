//
//  IGFPhotoResult.m
//  OCAstronomy
//
//  Created by Ian French on 12/2/20.
//

#import "IGFPhotoResult.h"
#import "IGFPhoto.h"

@implementation IGFPhotoResult

-(instancetype)initWithPhotos:(NSArray<IGFPhoto *> *)photos
{
    self = [super init];

    if(self)
    {
        _photos = [photos copy];
    }

    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSArray *photoDictionaries = dictionary[@"photos"];
    NSMutableArray *photos = [[NSMutableArray alloc] init];

    for (NSDictionary *photoDictionary in photoDictionaries) {
        IGFPhoto *photo = [[IGFPhoto alloc] initWithDictionary:photoDictionary];
        if (photo) {
            [photos addObject:photo];
        } else {
            NSLog(@"Unable to parse photo dictionary: %@", photoDictionary);
        }
    }

    self = [self initWithPhotos:photos];
    return self;
}

@end
