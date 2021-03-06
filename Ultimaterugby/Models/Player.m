//
//  Player.m
//  Ultimaterugby
//
//  Created by Lucas Correa on 01/10/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

#import "Player.h"

@implementation Player

#pragma mark -
#pragma mark - Methods

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        self.name = name;
        self.periodToYellowCard = kPlayerMinutes;
    }
    return self;
}


- (NSString *)description {
    return [NSString stringWithFormat:@"%@ - %i", self.name, self.periodToYellowCard];
}

@end
