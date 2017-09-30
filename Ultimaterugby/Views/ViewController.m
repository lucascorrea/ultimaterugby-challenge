//
//  ViewController.m
//  Ultimaterugby
//
//  Created by Lucas Correa on 30/09/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISlider *mainTimerSlider;

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


@end
