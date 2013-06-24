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
static NSString* resourcePath = @"people/tyler/tags";

+ (void)initialize
{
  session = [Stretchr sharedInstanceWithProject:@"tagspot.demo" publicKey:@"KflksDr2j2BGU04WyiuZk6LPIbIJWpcH" privateKey:@"1J6q8JFIgDsgVaUs55J7uDSI2aSnIupd"];
}

+ (void)fetchTagSpots:(void(^)(NSArray*))callback {
  
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    
    __block NSMutableArray* tagSpots = [NSMutableArray array];
    
    StretchrResourceCollection* collection = [StretchrResourceCollection resourceCollectionWithBasePath:resourcePath];
    [session readResourceCollection:collection withCompletionBlock:^(StretchrResourceCollection *resourceCollection, NSError *error) {
      if (error == nil)
      {        
        for (StretchrResource* resource in [resourceCollection resources]) {
          [tagSpots addObject:[[TagSpot alloc] initWithDictionaryRepresentation:[resource data]]];
        }
      }
    }];
    
    callback([NSArray arrayWithArray:tagSpots]);
    
  });
}

+ (void)persistTagSpot:(TagSpot*)tagSpot {
  
  
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
    [session createResourceWithPath:resourcePath data:tagSpot completionBlock:nil];
    
  });
}

@end
