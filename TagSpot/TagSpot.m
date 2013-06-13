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

@end
