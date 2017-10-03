//
//  YellowCardCellSpec.m
//  Ultimaterugby
//
//  Created by Lucas Correa on 03/10/2017.
//  Copyright 2017 SiriusCode. All rights reserved.
//

#import "Specta.h"
#import "YellowCardCell.h"
#import "Player.h"
#import <Expecta/Expecta.h>

SpecBegin(YellowCardCell)

describe(@"YellowCardCell", ^{
    
    __block YellowCardCell *yellowCardCell;
    
    beforeAll(^{

    });
    
    beforeEach(^{
        yellowCardCell = [[YellowCardCell alloc] init];
    });
    
    it(@"should exists", ^{
        expect(yellowCardCell).toNot.beNil();
    });
    
    it(@"should exists", ^{
        
        Player *player = [[Player alloc] initWithName:@"Player"];
        [yellowCardCell configureCellWithPlayer:player];
        
        expect(yellowCardCell.player).toNot.beNil();
    });
    
    afterEach(^{

    });
    
    afterAll(^{

    });
});

SpecEnd
