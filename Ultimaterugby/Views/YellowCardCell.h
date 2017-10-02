//
//  YellowCardCell.h
//  Ultimaterugby
//
//  Created by Lucas Correa on 01/10/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"
#import "ManagerTime.h"

@interface YellowCardCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *playerLabel;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (strong, nonatomic) Player *player;
@property (strong, nonatomic) ManagerTime *managerTime;

- (void)configureCellWithPlayer:(Player *)player;

@end
