//
//  HomeViewModel.h
//  Ultimaterugby
//
//  Created by Lucas Correa on 01/10/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "Constants.h"

typedef void (^ReturnValueBlock) (NSString *returnValue);

@interface HomeViewModel : NSObject

#pragma mark -
#pragma mark - Property Variables

@property (strong, nonatomic) NSMutableArray *yellowCardsArray;

#pragma mark -
#pragma mark - Methods

- (void)addYellowCardToPlayer:(Player *)player;
- (void)startTimerAndUpdateChronometer:(ReturnValueBlock)block;
- (void)pauseTimer;
- (void)resetTimer;

@end
