//
//  CustomCell.h
//  CustomCellWithVFLDemo
//
//  Created by Qin Yuxiang on 4/6/15.
//  Copyright (c) 2015 YuxiangQ. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *const kCustomCellIdentifier;
@interface CustomCell : UITableViewCell

@property (strong,nonatomic,readonly) UILabel *contentLabel;

-(void)configurationCell:(NSString*)content;

@end
