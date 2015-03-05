//
//  GameState.h
//  DartWheel
//
//  Created by Sumit Ghosh on 31/05/14.
//
//

#import <Foundation/Foundation.h>
@interface GameState : NSObject

@property (nonatomic, assign) int levelNumber;
@property (nonatomic,assign)NSString *userId;

+(GameState*)sharedState;
@end
