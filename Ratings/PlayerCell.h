//
//  PlayerCell.h
//  Ratings
//
//  Created by Brian Crider on 2/3/13.
//  Copyright (c) 2013 Brian Crider. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) IBOutlet UILabel *gameLabel;
@property (nonatomic, strong) IBOutlet UIImageView *ratingImageView;

@end
