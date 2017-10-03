//
//  ManagerTimer.h
//  Ultimaterugby
//
//  Created by Lucas Correa on 01/10/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface ManagerTimer : NSObject

#pragma mark -
#pragma mark - Property Variables

@property (strong, nonatomic) NSMutableArray *timerArray;
@property (strong, nonatomic) NSMutableArray *playerArray;

#pragma mark -
#pragma mark - Methods

- (void)startTimerToPlayer:(Player *)player;
- (void)startAllTimers;
- (void)pauseAllTimers;
- (void)resetTimer;
- (void)updateTimer:(NSTimer *)timer;

@end
