//
//  Player.h
//  Ultimaterugby
//
//  Created by Lucas Correa on 01/10/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface Player : NSObject

#pragma mark -
#pragma mark - Property Variables

@property (strong, nonatomic) NSString *name;
@property (nonatomic) int periodToYellowCard;

#pragma mark -
#pragma mark - Methods

- (instancetype)initWithName:(NSString *)name;

@end
