//
//  ManagerTimerSpec.m
//  Ultimaterugby
//
//  Created by Lucas Correa on 02/10/2017.
//  Copyright 2017 SiriusCode. All rights reserved.
//

#import "Specta.h"
#import "ManagerTimer.h"
#import "Constants.h"
#import <Expecta/Expecta.h>
#import <objc/runtime.h>

SpecBegin(ManagerTimer)

describe(@"ManagerTimer", ^{
    __block ManagerTimer *managerTimer;
    beforeAll(^{
        
    });
    
    beforeEach(^{
        managerTimer = [[ManagerTimer alloc] init];
    });
    
    it(@"should start timer to player", ^{
        Player *player = [[Player alloc] initWithName:@"Player"];
        [managerTimer startTimerToPlayer:player];
        expect(managerTimer.playerArray).to.haveCount(1);
        expect(managerTimer.timerArray).to.haveCount(1);
    });
    
    it(@"should start all timers but no have objects", ^{
        [managerTimer startAllTimers];
        expect(managerTimer.playerArray).to.haveCount(0);
        expect(managerTimer.timerArray).to.haveCount(0);
    });

    it(@"should pause all timers", ^{
        Player *player = [[Player alloc] initWithName:@"Player"];
        [managerTimer.playerArray addObject:player];
        [managerTimer startAllTimers];
        [managerTimer pauseAllTimers];
        expect(managerTimer.timerArray).to.beEmpty();
    });
    
    it(@"should reset all timers", ^{
        Player *player = [[Player alloc] initWithName:@"Player"];
        [managerTimer.playerArray addObject:player];
        [managerTimer startAllTimers];
        [managerTimer resetTimer];
        expect(managerTimer.timerArray).to.beEmpty();
    });
    
    afterEach(^{
        
    });
    
    afterAll(^{
        
    });
});

SpecEnd
