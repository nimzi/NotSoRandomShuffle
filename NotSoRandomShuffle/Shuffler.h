//
//  Shuffler.h
//  NotSoRandomShuffle
//
//  Created by Paul Agron on 2/19/15.
//  Copyright (c) 2015 Paul Agron. All rights reserved.
//


#import "Deck.h"

//
// This class can be thought of as an algorithm's state where
// `shuffle` message followed by `swap` call forms a state transition
//
@interface Shuffler : NSObject
@property (nonatomic,readonly) typeof(Deck*) deckInHand, deckOnTable;
- (instancetype) initWithDeckSize:(NSUInteger)size;

//
// Executes a round of shuffling thereby producing next state
// of the algorithm
//
- (void) shuffle;

// Swaps decks
- (void) swap;
@end


//
// Counts the number of shuffling runds to reach the starting state.
// Returns a non-zero positive number; if deck size is 0 (degenerate case)
// returns 1 because doing nothing counts as a 1 round (of doing nothing).
//

NSUInteger countRoundsToRecompose(Shuffler* shuffler);

