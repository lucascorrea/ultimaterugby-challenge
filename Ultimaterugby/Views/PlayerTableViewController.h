//
//  PlayerTableViewController.h
//  Ultimaterugby
//
//  Created by Lucas Correa on 01/10/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerViewModel.h"

@protocol PlayerDelegate <NSObject>

- (void)playerDidSelectedPlayer:(Player *)player;

@end

@interface PlayerTableViewController : UITableViewController

@property (strong, nonatomic) id<PlayerDelegate> delegate;

- (void)selectedPlayer;

@end
