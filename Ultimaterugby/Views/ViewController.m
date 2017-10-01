//
//  ViewController.m
//  Ultimaterugby
//
//  Created by Lucas Correa on 30/09/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.mainTimerSlider setThumbImage:[UIImage imageNamed:@"MainTimerSlider"] forState:UIControlStateNormal];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.startOrPauseButton.transform = CGAffineTransformMakeScale(0, 0);
    [UIView animateWithDuration:1 delay:.5 usingSpringWithDamping:0.5 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.startOrPauseButton.transform = CGAffineTransformMakeScale(1, 1);
        self.chronometerLabel.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
}


#pragma mark -
#pragma mark - Methods

- (void)startGame:(BOOL)enabled {
    self.tryButton.selected = enabled;
    self.kickButton.selected = enabled;
    self.redButton.selected = enabled;
    self.yellowButton.selected = enabled;
    self.conversionButton.selected = enabled;
    self.htButton.hidden = !enabled;
    self.htButton.transform = CGAffineTransformMakeScale(0, 0);
    
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.htButton.transform = CGAffineTransformMakeScale(1, 1);
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark -
#pragma mark - Actions

- (IBAction)startOrPauseAction:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    
    [self startGame:sender.selected];
}

- (IBAction)htAction:(id)sender {
    
}

@end
