//
//  HomeViewModel.m
//  Ultimaterugby
//
//  Created by Lucas Correa on 01/10/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

#import "HomeViewModel.h"

@interface HomeViewModel()


@property (nonatomic) int minutes;
@property (strong, nonatomic) ReturnValueBlock returnValueBlock;

@end


@implementation HomeViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.minutes = 0;
    }
    return self;
}

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

- (void)startTimerAndUpdateChronometer:(ReturnValueBlock)block {
    self.returnValueBlock = block;
    
    self.mainGameTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.mainGameTimer forMode:NSRunLoopCommonModes];
    [self updateTimer];
}

- (void)pauseTimer {
    [self.mainGameTimer invalidate];
    self.mainGameTimer = nil;
}

- (void)resetTimer {
    [self.mainGameTimer invalidate];
    self.mainGameTimer = nil;
    self.minutes = 0;
}

- (void)updateTimer {

    self.minutes++;
    
    int seconds = ((int)self.minutes)%60;
    int minutes = ((int)self.minutes)/60;
    
    NSString *timeString = [NSString stringWithFormat:@"%02d:%02d", minutes, seconds];
    
    if (self.returnValueBlock != nil) {
        self.returnValueBlock(timeString);
    }
    
    if (self.minutes >= kMainMinutes) {
        if (self.mainGameTimer) {
            [self.mainGameTimer invalidate];
            self.mainGameTimer = nil;
        }
        self.minutes = 0;
    }    
}

@end
