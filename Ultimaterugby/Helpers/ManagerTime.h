//
//  ManagerTime.h
//  Ultimaterugby
//
//  Created by Lucas Correa on 01/10/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

typedef void (^ReturnValueBlock) (NSString *returnValue);

@interface ManagerTime : NSObject

- (void)startTimerToPlayer:(Player *)player;
- (void)startAllTimers;
- (void)pauseAllTimers;
- (void)resetTimer;

@end
