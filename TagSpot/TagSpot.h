//
//  TagSpot.h
//  TagSpot
//
//  Created by Mat Ryer on 12/06/2013.
//  Copyright (c) 2013 Stretchr LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface TagSpot : NSObject <MKAnnotation>

@property (strong, nonatomic) CLLocation *location;
@property (copy, nonatomic) NSString *tagText;

- (CLLocationCoordinate2D) coordinate;
- (NSString *)title;

@end
