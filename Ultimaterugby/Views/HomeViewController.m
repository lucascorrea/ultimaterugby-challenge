//
//  HomeViewController.m
//  Ultimaterugby
//
//  Created by Lucas Correa on 30/09/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

#import "HomeViewController.h"
#import "YellowCardCell.h"

@interface HomeViewController () <PlayerDelegate>

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
@property (strong, nonatomic) HomeViewModel *homeViewModel;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.mainTimerSlider setThumbImage:[UIImage imageNamed:@"MainTimerSlider"] forState:UIControlStateNormal];
    self.homeViewModel = [[HomeViewModel alloc] init];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (self.view.tag != 999) {
        self.startOrPauseButton.transform = CGAffineTransformMakeScale(0, 0);
        [UIView animateWithDuration:1 delay:.5 usingSpringWithDamping:0.5 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.startOrPauseButton.transform = CGAffineTransformMakeScale(1, 1);
            self.chronometerLabel.alpha = 1;
        } completion:^(BOOL finished) {
            
        }];
    }
    
    self.view.tag = 999;
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

- (IBAction)yellowCardAction:(UIButton *)sender {
    //If button enabled, do action
    if (sender.selected) {
        [self performSegueWithIdentifier:@"seguePlayers" sender:nil];
    }
}

#pragma mark
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.homeViewModel.yellowCardsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"YellowCardCell";
    YellowCardCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    Player *player = self.homeViewModel.yellowCardsArray[indexPath.row];
    cell.playerLabel.text = player.name;
    
    return cell;
}


#pragma mark
#pragma mark - Table view delegate

// - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//     return 51;
// }


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark -
#pragma mark - UIStoryboardSegue Methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"seguePlayers"]) {
        UINavigationController *navigationController = segue.destinationViewController;
         PlayerTableViewController *playerTableViewController = (PlayerTableViewController *)navigationController.viewControllers.firstObject;
        playerTableViewController.delegate = self;
    }
}

#pragma mark -
#pragma mark - PlayerDelegate Methods

- (void)playerDidSelectedPlayer:(Player *)player {
    NSLog(@"%@", player);
    [self.homeViewModel addYellowCardToPlayer:player];
    self.yellowTableView.hidden = NO;
    [self.yellowTableView reloadData];
}

@end
