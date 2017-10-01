//
//  HomeViewModel.m
//  Ultimaterugby
//
//  Created by Lucas Correa on 01/10/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

#import "HomeViewModel.h"

@implementation HomeViewModel


#pragma mark -
#pragma mark - Custom Accessors

- (NSMutableArray *)yellowCardsArray {
    if (_yellowCardsArray == nil) {
        _yellowCardsArray = [[NSMutableArray alloc] init];
    }
    return _yellowCardsArray;
}

#pragma mark -
#pragma mark - Methods

- (void)addYellowCardToPlayer:(Player *)player {
    [self.yellowCardsArray insertObject:player atIndex:0];
}

@end
