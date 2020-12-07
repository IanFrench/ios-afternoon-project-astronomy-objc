//
//  IGFCache.h
//  OCAstronomy
//
//  Created by Ian French on 12/6/20.
//

#import <Foundation/Foundation.h>


NS_SWIFT_NAME(Cache)



@interface IGFCache<Key, Value> : NSObject

- (void)cacheValue:(id)value key:(id)key;
- (id)value:(id)key;
- (void)clear;

@end


