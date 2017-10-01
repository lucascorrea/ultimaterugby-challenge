//
//  PlayerTableViewController.m
//  Ultimaterugby
//
//  Created by Lucas Correa on 01/10/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

#import "PlayerTableViewController.h"

@interface PlayerTableViewController ()

@property (strong, nonatomic) NSIndexPath *selectedIndexPath;
@property (strong, nonatomic) PlayerViewModel *playerViewModel;

@end

@implementation PlayerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.selectedIndexPath = [NSIndexPath indexPathForRow:-1 inSection:0];
    self.playerViewModel = [[PlayerViewModel alloc] init];
    
    [self.playerViewModel listPlayersWithCompletion:^(NSMutableArray *playersArray) {
        [self.tableView reloadData];
    } failure:^(NSError *error) {
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - Methods

- (void)selectedPlayer {
    if ([self.delegate respondsToSelector:@selector(playerDidSelectedPlayer:)]) {
        Player *player = self.playerViewModel.playersArray[self.selectedIndexPath.row];
        [self.delegate playerDidSelectedPlayer:player];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark - Actions

- (IBAction)closeAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.playerViewModel.playersArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlayerCell" forIndexPath:indexPath];
    
    // Configure the cell...
    Player *player = self.playerViewModel.playersArray[indexPath.row];
    cell.textLabel.text = player.name;
    
    cell.accessoryType = (indexPath.row == self.selectedIndexPath.row) ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath   *)indexPath {
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
    
    self.selectedIndexPath = indexPath;
    
    if (self.navigationItem.rightBarButtonItems.count == 0) {
        UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(selectedPlayer)];
        self.navigationItem.rightBarButtonItems = @[doneBarButton];
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
    self.selectedIndexPath = nil;
}


@end
