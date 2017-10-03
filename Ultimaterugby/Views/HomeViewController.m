//
//  HomeViewController.m
//  Ultimaterugby
//
//  Created by Lucas Correa on 30/09/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

#import "HomeViewController.h"
#import "YellowCardCell.h"

@implementation NSObject (PerformBlockAfterDelay)

- (void)performBlock:(void (^)(void))block
          afterDelay:(NSTimeInterval)delay {
    block = [block copy];
    [self performSelector:@selector(fireBlockAfterDelay:)
               withObject:block
               afterDelay:delay];
}

- (void)fireBlockAfterDelay:(void (^)(void))block {
    block();
}

@end

@interface HomeViewController () <PlayerDelegate>

@property (strong, nonatomic) HomeViewModel *homeViewModel;
@property (strong, nonatomic) ManagerTimer *managerTimer;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.mainTimerSlider setThumbImage:[UIImage imageNamed:@"MainTimerSlider"] forState:UIControlStateNormal];
    
    self.homeViewModel = [[HomeViewModel alloc] init];
    self.managerTimer = [[ManagerTimer alloc] init];
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
    
    if (enabled) {
        [self start];
    } else {
        [self pause];
    }
    
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

- (void)start {
    
    [self.managerTimer startAllTimers];
    
    //Start and Update minutes to chronometer
    [self.homeViewModel startTimerAndUpdateChronometer:^(NSString *time) {
        self.chronometerLabel.text = time;
    }];
    
    self.chronometerLabel.textColor = [UIColor colorWithRed:0.0/255.0 green:167.0/255.0 blue:4.0/255.0 alpha:1.0];
}

- (void)pause {
    [self.homeViewModel pauseTimer];
    [self.managerTimer pauseAllTimers];
    self.chronometerLabel.textColor = [UIColor lightGrayColor];
    
}

#pragma mark -
#pragma mark - Actions

- (IBAction)startOrPauseAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    
    [self startGame:sender.selected];
}

- (IBAction)htAction:(id)sender {
    [self.homeViewModel resetTimer];
    [self.managerTimer resetTimer];
    self.chronometerLabel.text = @"00:00";
    self.startOrPauseButton.selected = NO;
    [self startGame:self.startOrPauseButton.selected];
}

- (IBAction)yellowCardAction:(UIButton *)sender {
    //If button enabled, do action
    if (sender.selected) {
        [self performSegueWithIdentifier:@"seguePlayers" sender:nil];
    }
}

#pragma mark -
#pragma mark - UITableView data source

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
    [cell configureCellWithPlayer:player];
    
    return cell;
}

#pragma mark -
#pragma mark - UITableView delegates

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
    
    self.yellowTableView.hidden = NO;

    [self.yellowTableView setContentOffset:CGPointZero animated:YES];
    
    //added a delay in the insertion because the insertion animation looks strange.
    [self performBlock:^{
        [self.homeViewModel addYellowCardToPlayer:player];
        [self.managerTimer startTimerToPlayer:player];
        [self.yellowTableView beginUpdates];
        [self.yellowTableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationLeft];
        [self.yellowTableView endUpdates];
    } afterDelay:.3];
}

@end
