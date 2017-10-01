//
//  PlayerViewModel.h
//  Ultimaterugby
//
//  Created by Lucas Correa on 01/10/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface PlayerViewModel : NSObject

#pragma mark -
#pragma mark - Property Variables

@property (strong, nonatomic) NSMutableArray *playersArray;


#pragma mark -
#pragma mark - Methods

- (void)listPlayersWithCompletion:(void (^)(NSMutableArray* playersArray))completion failure:(void (^)(NSError *error))failure;

@end
