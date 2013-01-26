//
//  Player.h
//  Ratings
//
//  Created by Brian Crider on 1/25/13.
//  Copyright (c) 2013 Brian Crider. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *game;
@property (nonatomic, assign) int rating;

@end
