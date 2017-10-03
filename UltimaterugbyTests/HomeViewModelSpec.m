//
//  HomeViewModelSpec.m
//  Ultimaterugby
//
//  Created by Lucas Correa on 02/10/2017.
//  Copyright 2017 SiriusCode. All rights reserved.
//

#import "Specta.h"
#import "HomeViewModel.h"
#import <Expecta/Expecta.h>

SpecBegin(HomeViewModel)

describe(@"HomeViewModel", ^{
    __block HomeViewModel *homeViewModel;
    beforeAll(^{

    });
    
    beforeEach(^{
        homeViewModel = [[HomeViewModel alloc] init];
    });
    
    it(@"should add yellow card to a player", ^{
        Player *player = [[Player alloc] initWithName:@"Player"];
        [homeViewModel addYellowCardToPlayer:player];
        expect(homeViewModel.yellowCardsArray).to.haveCount(1);
    });
    
    it(@"should add yellow card to a player", ^{
        [homeViewModel startTimerAndUpdateChronometer:^(NSString *returnValue) {
            expect(returnValue).to.equal(@"00:01");
        }];
    });
    
    it(@"should pause to timer", ^{
        [homeViewModel startTimerAndUpdateChronometer:^(NSString *returnValue) {
            
            NSLog(@"%@",homeViewModel.mainGameTimer);
            expect(homeViewModel.mainGameTimer).toNot.beNil();
            [homeViewModel pauseTimer];
            expect(homeViewModel.mainGameTimer).to.beNil();
        }];
    });
    
    it(@"should reset to timer", ^{
        [homeViewModel startTimerAndUpdateChronometer:^(NSString *returnValue) {
            [homeViewModel resetTimer];
            expect(homeViewModel.mainGameTimer).to.beNil();
        }];
    });
    
    afterEach(^{

    });
    
    afterAll(^{

    });
});

SpecEnd
