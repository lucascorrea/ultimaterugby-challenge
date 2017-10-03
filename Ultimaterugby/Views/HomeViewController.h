//
//  HomeViewController.h
//  Ultimaterugby
//
//  Created by Lucas Correa on 30/09/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerTableViewController.h"
#import "HomeViewModel.h"
#import "ManagerTimer.h"
#import "Constants.h"

@interface HomeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UISlider *mainTimerSlider;
@property (weak, nonatomic) IBOutlet UILabel *chronometerLabel;
@property (weak, nonatomic) IBOutlet UIButton *startOrPauseButton;
@property (weak, nonatomic) IBOutlet UITableView *yellowTableView;
@property (weak, nonatomic) IBOutlet UIButton *tryButton;
@property (weak, nonatomic) IBOutlet UIButton *kickButton;
@property (weak, nonatomic) IBOutlet UIButton *redButton;
@property (weak, nonatomic) IBOutlet UIButton *yellowButton;
@property (weak, nonatomic) IBOutlet UIButton *conversionButton;
@property (weak, nonatomic) IBOutlet UIButton *htButton;

- (void)startGame:(BOOL)enabled;
- (void)start;
- (void)pause;

- (IBAction)startOrPauseAction:(UIButton *)sender;
- (IBAction)htAction:(id)sender;
- (IBAction)yellowCardAction:(UIButton *)sender;

@end


