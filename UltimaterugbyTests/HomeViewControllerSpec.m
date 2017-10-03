//
//  HomeViewControllerSpec.m
//  Ultimaterugby
//
//  Created by Lucas Correa on 03/10/2017.
//  Copyright 2017 SiriusCode. All rights reserved.
//

#import "Specta.h"
#import "HomeViewController.h"
#import <Expecta/Expecta.h>

SpecBegin(HomeViewController)

describe(@"HomeViewController", ^{
    
    __block HomeViewController *vc;
    
    beforeAll(^{
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UINavigationController *navigationController = [mainStoryboard instantiateInitialViewController];
        vc = (HomeViewController *)(navigationController.viewControllers.firstObject);
        
        [vc view];
    });
    
    beforeEach(^{

    });
    
    it(@"should exists", ^{
        expect(vc).toNot.beNil();
    });
    
    it(@"should start game and enable buttons", ^{
        [vc startGame:YES];
        expect(vc.tryButton.selected).to.equal(YES);
    });
    
    it(@"should pause game and disable buttons", ^{
        [vc startGame:NO];
        expect(vc.tryButton.selected).to.equal(NO);
    });
    
    afterEach(^{

    });
    
    afterAll(^{

    });
});

SpecEnd
