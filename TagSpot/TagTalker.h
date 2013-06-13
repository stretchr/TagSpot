//
//  TagTalker.h
//  TagSpot
//
//  Created by Tyler Bunnell on 6/13/13.
//  Copyright (c) 2013 Stretchr LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TagSpot;

@interface TagTalker : NSObject

+ (void)fetchTagSpots:(void(^)(NSArray*))callback;
+ (void)persistTagSpot:(TagSpot*)tagSpot;

@end
