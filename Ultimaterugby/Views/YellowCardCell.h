//
//  YellowCardCell.h
//  Ultimaterugby
//
//  Created by Lucas Correa on 01/10/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"
#import "ManagerTimer.h"

@interface YellowCardCell : UITableViewCell

#pragma mark -
#pragma mark - Property Variables

@property (weak, nonatomic) IBOutlet UILabel *playerLabel;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (strong, nonatomic) Player *player;
@property (strong, nonatomic) ManagerTimer *managerTime;

#pragma mark -
#pragma mark - Methods

- (void)configureCellWithPlayer:(Player *)player;

@end
