//
//  PlayerTableViewControllerSpec.m
//  Ultimaterugby
//
//  Created by Lucas Correa on 03/10/2017.
//  Copyright 2017 SiriusCode. All rights reserved.
//

#import "Specta.h"
#import "PlayerTableViewController.h"
#import <Expecta/Expecta.h>

SpecBegin(PlayerTableViewController)

describe(@"PlayerTableViewController", ^{
    
    __block PlayerTableViewController *vc;
    
    beforeAll(^{
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UINavigationController *navigationController = [mainStoryboard instantiateViewControllerWithIdentifier:@"PlayerNavigationController"];
        vc = (PlayerTableViewController *)(navigationController.viewControllers.firstObject);
        
        [vc view];
    });
    
    beforeEach(^{

    });
    
    it(@"should exists", ^{
        expect(vc).toNot.beNil();
    });
    
    
    it(@"should be delegate nil", ^{
        [vc selectedPlayer];
        expect(vc.delegate).to.beNil();
    });
    
    
    
    afterEach(^{

    });
    
    afterAll(^{

    });
});

SpecEnd
