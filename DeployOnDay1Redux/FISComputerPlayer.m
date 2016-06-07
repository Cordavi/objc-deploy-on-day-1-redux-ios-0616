//
//  FISComputerPlayer.m
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISComputerPlayer.h"

@implementation FISComputerPlayer

+(BOOL)isEnabled
{
    return YES;
}


-(FISTicTacToePosition)nextPlay
{
    NSUInteger randomRow = arc4random() % 3;
    NSUInteger randomColumn = arc4random() % 3;
    
    while ([self.game canPlayAtColumn:randomColumn row:randomRow] == 0) {
        randomColumn = arc4random() % 3;
        randomRow = arc4random() % 3;
    }

    return FISTicTacToePositionMake(randomColumn, randomRow);
}

@end
