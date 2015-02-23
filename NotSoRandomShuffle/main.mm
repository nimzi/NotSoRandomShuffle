//
//  main.m
//  NotSoRandomShuffle
//
//  Created by Paul Agron on 2/19/15.
//  Copyright (c) 2015 Paul Agron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <iostream>

extern "C" {
  #import "Shuffler.h"
}



//
// Objective-C++ generally should be avoided :)
// Here, I use it for demo purposes !!!
//

int main(int argc, const char * argv[]) {
  using namespace std;
  
  @autoreleasepool {
    NSArray* args = [[NSProcessInfo processInfo] arguments];
    
    if (args and args.count == 2) {
      NSNumberFormatter* formatter = [[NSNumberFormatter alloc] init];
      formatter.numberStyle = NSNumberFormatterDecimalStyle;
      NSNumber* deckSize = [formatter numberFromString:args[1]];
      
      if (deckSize) {
        double d = [deckSize doubleValue];
        if (d >= 0 and (d - static_cast<long>(d)) == 0) {
          NSUInteger size = [deckSize unsignedIntegerValue];
          auto startState = [[Shuffler alloc] initWithDeckSize:size];
          
          cout << countRoundsToRecompose(startState) << endl;
          
        } else {
          cout << "Argument not a positive (or zero) integer number" << endl;
          return 1;
        }
      } else {
        cout << "Argument not a number" << endl;
        return 2;
      }
    } else {
      cout << "Wrong number of arguments" << endl;
      return 3;
    }
  }
  
  return 0;
}
