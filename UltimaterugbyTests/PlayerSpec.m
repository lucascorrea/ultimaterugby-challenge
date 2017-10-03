//
//  PlayerSpec.m
//  Ultimaterugby
//
//  Created by Lucas Correa on 02/10/2017.
//  Copyright 2017 SiriusCode. All rights reserved.
//

#import "Specta.h"
#import "Player.h"
#import <Expecta/Expecta.h>

SpecBegin(Player)

describe(@"Player", ^{
    
    beforeAll(^{
        
    });
    
    beforeEach(^{
        
    });
    
    it(@"should create a new player with name Player", ^{
        Player *player = [[Player alloc] initWithName:@"Player"];
        expect(player.name).to.equal(@"Player");
    });
    
    it(@"should test description", ^{
        Player *player = [[Player alloc] initWithName:@"Player"];
        expect(player.description).to.equal([NSString stringWithFormat:@"Player - %i", kPlayerMinutes]);
    });
    
    afterEach(^{
        
    });
    
    afterAll(^{
        
    });
});

SpecEnd
