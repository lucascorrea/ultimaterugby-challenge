//
//  HomeViewModel.h
//  Ultimaterugby
//
//  Created by Lucas Correa on 01/10/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface HomeViewModel : NSObject

#pragma mark -
#pragma mark - Property Variables

@property (strong, nonatomic) NSMutableArray *yellowCardsArray;

#pragma mark -
#pragma mark - Methods

- (void)addYellowCardToPlayer:(Player *)player;

@end
