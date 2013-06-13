//
//  TagSpot.m
//  TagSpot
//
//  Created by Mat Ryer on 12/06/2013.
//  Copyright (c) 2013 Stretchr LLC. All rights reserved.
//

#import "TagSpot.h"

@implementation TagSpot

- (CLLocationCoordinate2D) coordinate {
  return self.location.coordinate;
}

- (NSString *)title {
  return self.tagText;
}


// initWithDictionaryRepresentation builds an instance of this object
// from the dictionary representation we store in stretchr
- (id)initWithDictionaryRepresentation:(NSDictionary*) dictionary {
  if (!(self = [super init]))
    return nil;
  
  self.location = [[CLLocation alloc] initWithLatitude:[dictionary[@"lat"] doubleValue] longitude:[dictionary[@"lng"] doubleValue]];
  self.tagText = dictionary[@"tagText"];
  
  return self;
}


// dictionaryRepresentation serializes this object to a dictionary to be sent
// to stretchr
- (NSDictionary *)dictionaryRepresentation {
  return @{@"lat":[NSNumber numberWithDouble:self.location.coordinate.latitude],
           @"lng":[NSNumber numberWithDouble:self.location.coordinate.longitude],
           @"tagText":self.tagText};
}

@end
