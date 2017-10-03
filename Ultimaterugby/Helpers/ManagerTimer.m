//
//  ManagerTimer.m
//  Ultimaterugby
//
//  Created by Lucas Correa on 01/10/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

#import "ManagerTimer.h"
#import <objc/runtime.h>

@interface ManagerTimer()

@end


@implementation ManagerTimer

#pragma mark -
#pragma mark - Override Init

- (instancetype)init {
    self = [super init];
    if (self) {
        self.timerArray = [[NSMutableArray alloc] init];
        self.playerArray = [[NSMutableArray alloc] init];
    }
    return self;
}

#pragma mark -
#pragma mark - Methods

- (void)startTimerToPlayer:(Player *)player {
    [self.playerArray addObject:player];
    
    NSTimer *playerTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTimer:) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:playerTimer forMode:NSRunLoopCommonModes];
    
    objc_setAssociatedObject(playerTimer, "player", player, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    [self.timerArray addObject:playerTimer];
}

- (void)startAllTimers {
    for (Player *player in self.playerArray) {
        
        if (player.periodToYellowCard > 0) {
            NSTimer *playerTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTimer:) userInfo:nil repeats:YES];
            [[NSRunLoop mainRunLoop] addTimer:playerTimer forMode:NSRunLoopCommonModes];
            
            objc_setAssociatedObject(playerTimer, "player", player, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            
            [self.timerArray addObject:playerTimer];
        }
    }
}

- (void)pauseAllTimers {
    for (NSTimer *timer in self.timerArray) {
        [timer invalidate];
    }
    [self.timerArray removeAllObjects];
}

- (void)resetTimer {
    for (NSTimer *timer in self.timerArray) {
        [timer invalidate];
    }
    
    for (Player *player in self.playerArray) {
        player.periodToYellowCard = 0;
    }
    
    [self.timerArray removeAllObjects];
}

- (void)updateTimer:(NSTimer *)timer {
    Player *player = objc_getAssociatedObject(timer, "player");
    
    if (player.periodToYellowCard == 0) {
        if (timer) {
            [timer invalidate];
            timer = nil;
        }
    }
    
    player.periodToYellowCard--;
}

@end
