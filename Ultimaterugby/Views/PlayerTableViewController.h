//
//  PlayerTableViewController.h
//  Ultimaterugby
//
//  Created by Lucas Correa on 01/10/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerViewModel.h"

#pragma mark -
#pragma mark - Protocol methods

@protocol PlayerDelegate <NSObject>

- (void)playerDidSelectedPlayer:(Player *)player;

@end

@interface PlayerTableViewController : UITableViewController

#pragma mark -
#pragma mark - Property Variables

@property (strong, nonatomic) id<PlayerDelegate> delegate;

#pragma mark -
#pragma mark - Methods

- (void)selectedPlayer;

@end
