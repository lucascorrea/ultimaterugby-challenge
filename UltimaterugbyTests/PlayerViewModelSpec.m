//
//  PlayerViewModelSpec.m
//  Ultimaterugby
//
//  Created by Lucas Correa on 02/10/2017.
//  Copyright 2017 SiriusCode. All rights reserved.
//

#import "Specta.h"
#import "PlayerViewModel.h"
#import <Expecta/Expecta.h>

SpecBegin(PlayerViewModel)

describe(@"PlayerViewModel", ^{
    __block PlayerViewModel *playerViewModel;
    
    beforeAll(^{
        
    });
    
    beforeEach(^{
        playerViewModel = [[PlayerViewModel alloc] init];
    });
    
    it(@"should return list of 25 players", ^{
        [playerViewModel listPlayersWithCompletion:^(NSMutableArray *playersArray) {
            
            expect(playersArray).to.haveCountOf(25);
        } failure:^(NSError *error) {
            
        }];
    });
    
    afterEach(^{
        
    });
    
    afterAll(^{
        
    });
});

SpecEnd
