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
    self.board = [@[[@[@"", @"", @""] mutableCopy],
                    [@[@"", @"", @""] mutableCopy],
                    [@[@"", @"", @""] mutableCopy]] mutableCopy];

}

-(NSString *)playerAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    return self.board[column][row];
}

-(BOOL)canPlayAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    if (!([self.board[column][row]  isEqualToString:@""])) {
        return NO;
    }
    
    return YES;
}

-(void)playXAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    [self.board[column] replaceObjectAtIndex:row withObject:@"X"];
}

-(void)playOAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    [self.board[column] replaceObjectAtIndex:row withObject:@"O"];
}

-(NSString *)winningPlayer {
    
    for (NSUInteger i = 0; i < [self.board count]; i++) {
        
        //vert win
        if (![self.board[i][1] isEqualToString:@""] && [self.board[i][1] isEqualToString:self.board[i][0]] && [self.board[i][1] isEqualToString:self.board[i][2]]) {
            return self.board[i][1] ;
        }
        
        //hori win
        if (![self.board[0][i] isEqualToString:@""] && [self.board[0][i] isEqualToString:self.board[1][i]] && [self.board[0][i] isEqualToString:self.board[2][i]]) {
            return self.board[0][i];
        }
    }
    
    //diag win
    if ([self.board[0][0] isEqualToString:self.board[1][1]] && [self.board[0][0] isEqualToString:self.board[2][2]] ) {
        return self.board[0][0];
    }
    
    if ([self.board[0][2] isEqualToString:self.board[1][1]] && [self.board[0][2] isEqualToString:self.board[2][0]] ) {
        return self.board[0][2];
    }
    

    return @"";

}

-(BOOL)isADraw
{
    for (NSUInteger i = 0; i < [self.board count]; i++) {
        
        for (NSUInteger j = 0; i < [self.board count]; j++) {
            if (![self.board[i][j] isEqualToString:@"@"]) {
                return YES;
            }
        }
    }
    return NO;
}

@end
