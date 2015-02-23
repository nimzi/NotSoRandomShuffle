//
//  Deck.h
//  NotSoRandomShuffle
//
//  Created by Paul Agron on 2/19/15.
//  Copyright (c) 2015 Paul Agron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Deck : NSObject<NSCopying>

- (instancetype)initWithSize:(NSUInteger)size;
- (BOOL) isEmpty;
- (NSUInteger) size;
- (NSNumber*) pop;
- (void) push:(NSNumber*)elem;
- (void) moveTopElementBack;

@end
