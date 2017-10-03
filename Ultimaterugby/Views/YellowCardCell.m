//
//  YellowCardCell.m
//  Ultimaterugby
//
//  Created by Lucas Correa on 01/10/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

#import "YellowCardCell.h"

@interface YellowCardCell()
@property (strong, nonatomic) NSTimer *yellowCardTimer;
@end

@implementation YellowCardCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

#pragma mark -
#pragma mark - Methods public

- (void)configureCellWithPlayer:(Player *)player {
    self.player = player;
    self.playerLabel.text = player.name;
    
    //Check that the timer has been created and invalidate the timer
    if (self.yellowCardTimer) {
        [self.yellowCardTimer invalidate];
        self.yellowCardTimer = nil;
    }
    
    self.timerLabel.hidden = (self.player.periodToYellowCard < 0);
    
    if (self.player.periodToYellowCard >= 0) {
        
        //This timer is use to update label
        self.yellowCardTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:self.yellowCardTimer forMode:NSRunLoopCommonModes];
        [self updateTimer];
    }
}

#pragma mark -
#pragma mark - Private

- (void)updateTimer {

    if (self.player.periodToYellowCard == 0) {
        if (self.yellowCardTimer) {
            [self.yellowCardTimer invalidate];
            self.yellowCardTimer = nil;
        }
        self.timerLabel.hidden = YES;
    }

    int seconds = ((int)self.player.periodToYellowCard)%60;
    int minutes = ((int)self.player.periodToYellowCard)/60;

    self.timerLabel.text = [NSString stringWithFormat:@"%02d:%02d", minutes, seconds];
    NSLog(@"%@", self.player);
}


@end
