//
//  Shuffler.m
//  NotSoRandomShuffle
//
//  Created by Paul Agron on 2/19/15.
//  Copyright (c) 2015 Paul Agron. All rights reserved.
//

#import "Shuffler.h"
#import <iso646.h>

@interface Shuffler()
@property (nonatomic,readwrite) typeof(Deck*) deckInHand, deckOnTable;
@end

@implementation Shuffler

- (instancetype) initWithDeckSize:(NSUInteger)size
{
  self = [super init];
  if (self) {
    _deckInHand = [[Deck alloc] initWithSize:size];
    _deckOnTable = [[Deck alloc] initWithSize:0];
  }
  return self;
}

-(void) swap {
  id tmp = _deckInHand;
  _deckInHand = _deckOnTable;
  _deckOnTable = tmp;
}

-(void) shuffle {
  while (not _deckInHand.isEmpty) {
    [_deckOnTable push:[_deckInHand pop]];
    [_deckInHand moveTopElementBack];
  }
  [self swap];
}

@end


NSUInteger countRoundsToRecompose(Shuffler* shuffler) {
  NSUInteger res = 0;
  Deck* originalDeck = [shuffler.deckInHand copy];
  do {
    [shuffler shuffle];
    res += 1;
  } while (not [shuffler.deckInHand isEqual:originalDeck]);
  
  return res;
}

