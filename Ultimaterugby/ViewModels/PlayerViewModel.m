//
//  PlayerViewModel.m
//  Ultimaterugby
//
//  Created by Lucas Correa on 01/10/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

#import "PlayerViewModel.h"



@implementation PlayerViewModel


#pragma mark -
#pragma mark - Methods

- (void)listPlayersWithCompletion:(void (^)(NSMutableArray* playersArray))completion failure:(void (^)(NSError *error))failure {
    
    //If we use AFNetworking to request webservice we can implement block completion and failure
    
    self.playersArray = [[NSMutableArray alloc] initWithCapacity:25];
    
    for (int i = 0; i < 25; i++) {
        Player *player = [[Player alloc] initWithName:[NSString stringWithFormat:@"Player %i", i+1]];
        [self.playersArray addObject:player];
    }
    
    completion(self.playersArray);
}

@end
