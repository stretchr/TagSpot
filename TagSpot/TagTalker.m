//
//  TagTalker.m
//  TagSpot
//
//  Created by Tyler Bunnell on 6/13/13.
//  Copyright (c) 2013 Stretchr LLC. All rights reserved.
//

#import <Stretchr/Stretchr.h>
#import <AudioToolbox/AudioToolbox.h>

#import "TagTalker.h"
#import "TagSpot.h"

@implementation TagTalker

static Stretchr* session = nil;

+ (void)initialize
{
  session = [Stretchr sharedInstanceWithProject:@"tagspot.demo" publicKey:@"KflksDr2j2BGU04WyiuZk6LPIbIJWpcH" privateKey:@"1J6q8JFIgDsgVaUs55J7uDSI2aSnIupd"];
}

+ (void)fetchTagSpots:(void(^)(NSArray*))callback {
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    __block NSMutableArray* tagSpots = [NSMutableArray array];
    StretchrResourceCollection* collection = [StretchrResourceCollection resourceCollectionWithBasePath:@"tags"];
    [session readResourceCollection:collection withCompletionBlock:^(StretchrResourceCollection *resourceCollection, NSError *error) {
      if (error == nil)
      {
        NSLog(@"load successful");
        for (StretchrResource* dict in [resourceCollection resources]) {
          [tagSpots addObject:[[TagSpot alloc] initWithDictionaryRepresentation:[dict data]]];
        }
      }
    }];
    callback([NSArray arrayWithArray:tagSpots]);
  });
}

+ (void)persistTagSpot:(TagSpot*)tagSpot {
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    [session createResourceWithPath:@"tags" data:tagSpot completionBlock:^(StretchrResource *resource, NSError *error) {
      if (error == nil) {
        NSLog(@"push successful");
      }
    }];
  });
}

@end
