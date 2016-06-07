//
//  FISTicTacToeGame.m
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISTicTacToeGame.h"

@interface FISTicTacToeGame ()

@property (nonatomic, strong) NSMutableArray *board;

@end


@implementation FISTicTacToeGame

-(instancetype)init
{
    self = [super init];
    if(self) {
        // Do initialization of your game here, inside this if statement.
        // Leave the rest of this method alone :)
        
        //Clears game board
        [self resetBoard];
        

    }

    return self;
}

-(void)resetBoard
{
    [self.board removeAllObjects];
    self.board = [@[@"", @"", @"", @"", @"", @"", @"", @"", @""] mutableCopy];

}

-(NSString *)playerAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    return self.board[column * 3 + row];
}

-(BOOL)canPlayAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    if (!([self.board[column * 3 + row]  isEqualToString:@""])) {
        return NO;
    }
    
    return YES;
}

-(void)playXAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    self.board[column * 3 + row] = @"X";
}

-(void)playOAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    self.board[column * 3 + row] = @"O";
}


-(NSString *)horizontalWin {
    
    if ([self.board[0] isEqualToString:self.board[3]] && [self.board[3] isEqualToString:self.board[6]]) {
        return self.board[0];
    }
    
    else if ([self.board[1] isEqualToString:self.board[4]] && [self.board[4] isEqualToString:self.board[7]]) {
        return self.board[1];
    }
    
    else if ([self.board[2] isEqualToString:self.board[5]] && [self.board[5] isEqualToString:self.board[8]]) {
        return self.board[2];
    }
    
    return @"";
}

-(NSString *)verticalWin {
    if ([self.board[0] isEqualToString:self.board[1]] && [self.board[1] isEqualToString:self.board[2]]) {
        return self.board[0];
    }
    
    else if ([self.board[3] isEqualToString:self.board[4]] && [self.board[4] isEqualToString:self.board[5]]) {
        return self.board[3];
    }
    
    else if ([self.board[6] isEqualToString:self.board[7]] && [self.board[7] isEqualToString:self.board[8]]) {
        return self.board[6];
    }
    
    return @"";
}

-(NSString *)diagonalWin {
    if ([self.board[0] isEqualToString:self.board[4]] && [self.board[4] isEqualToString:self.board[8]]) {
        return self.board[0];
    }
    
    else if ([self.board[6] isEqualToString:self.board[4]] && [self.board[4] isEqualToString:self.board[2]]) {
        return self.board[6];
    }
    
    return @"";
}

-(NSString *)winningPlayer {
    
    NSString *win;
    win = [self horizontalWin];
    if ([win length]) {
        return win;
    }
    
    win = [self verticalWin];
    if ([win length]) {
        return win;
    }
    
    win = [self diagonalWin];
    if ([win length]) {
        return win;
    }
    
    return win;

}

-(BOOL)isADraw
{
    for (NSString *currentBoardString in self.board) {
        if ([currentBoardString length] == 0) {
            return NO;
        }
    }
    
    return YES;
}

@end
