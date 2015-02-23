//
//  Deck.m
//  NotSoRandomShuffle
//
//  Created by Paul Agron on 2/19/15.
//  Copyright (c) 2015 Paul Agron. All rights reserved.
//

#import "Deck.h"
#import <iso646.h>

@implementation Deck {
  NSMutableArray* _cards;
}

- (NSUInteger) size { return [_cards count]; }
- (NSArray*) cards { return _cards; }

- (instancetype)initWithSize:(NSUInteger)size
{
  self = [super init];
  if (self) {
    _cards = [[NSMutableArray alloc] initWithCapacity:size];
    for (NSUInteger j=0;j<size;j++) {
      [_cards addObject:@(j)];
    }
    
  }
  return self;
}

//
// Removes the top element and returns it; otherwise retunrs nil
//
- (NSNumber*) pop {
  NSNumber* res = nil;
  if ([_cards count] > 0) {
    res = _cards.lastObject;
    [_cards removeLastObject];
  }
  
  return res;
}

- (void) push:(NSNumber*)elem {
  [_cards addObject:elem];
}



- (void) moveTopElementBack {
  if ([_cards count] > 1) {
    NSNumber* top = _cards.lastObject;
    [_cards removeLastObject];
    [_cards insertObject:top atIndex:0];
  }
}

- (BOOL) isEmpty {
  return 0 == self.size;
}


//
// Might have implemented equality like this but tests show unnecessary
//
//-(BOOL) isEqual:(Deck*)object {
//  __block BOOL res = NO;
//  if (nil != object and [object isKindOfClass:[self class]]) {
//    if (object.size == self.size) {
//      res = YES;
//      [_cards enumerateObjectsUsingBlock:^(NSNumber* elem, NSUInteger idx, BOOL* stop) {
//        // Breaking encapsulatio is OK since operating within own class
//        res = res and (elem == object->_cards[idx]);
//        *stop = not res;
//      }];
//    }
//  }
//  
//  return res;
//}


-(BOOL) isEqual:(Deck*)object {
  BOOL res = NO;
  if (nil != object and [object isKindOfClass:[self class]] and object.size == self.size) {
    // ``Breaking`` encapsulatio is OK since operating within own class
    res = [_cards isEqual:object->_cards];
  }
  
  return res;
}

-(id) copyWithZone:(NSZone *)zone {
  Deck* copy = [[Deck allocWithZone:zone] initWithSize:0];
  for (id n in _cards) [copy push:n];
  return copy;
}




@end
