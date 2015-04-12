//
//  CustomCell.m
//  CustomCellWithVFLDemo
//
//  Created by Qin Yuxiang on 4/6/15.
//  Copyright (c) 2015 YuxiangQ. All rights reserved.
//

#import "CustomCell.h"

NSString *const kCustomCellIdentifier=@"customCellIdentifier";
@implementation CustomCell

#pragma mark -
#pragma mark Init Methods
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCustomCellIdentifier]) {
        self.contentView.translatesAutoresizingMaskIntoConstraints=NO;
        [self initControls];
        [self p_updateConstraints];
    }
    return self;
}

-(void)initControls{
    _contentLabel=[UILabel new];
    _contentLabel.translatesAutoresizingMaskIntoConstraints=NO;
    _contentLabel.numberOfLines=0;
    _contentLabel.lineBreakMode=NSLineBreakByWordWrapping;
    [self.contentView addSubview:_contentLabel];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}


-(void)layoutSubviews{
    [super layoutSubviews];
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
    
#warning 这里的设置很重要
    self.contentLabel.preferredMaxLayoutWidth=CGRectGetWidth(self.frame);
}

-(void)configurationCell:(NSString*)content{
    self.contentLabel.text=content;
}

#pragma mark -
#pragma mark Private Methods
-(void)p_updateConstraints{
    [self.contentView removeConstraints:self.contentView.constraints];
    NSDictionary *views=@{@"contentLabel":self.contentLabel};
    NSMutableArray *constraints=[NSMutableArray array];
    
    //设置水平约束
    [constraints addObjectsFromArray:[NSLayoutConstraint
                                      constraintsWithVisualFormat:@"H:|-5-[contentLabel]-5-|"
                                      options:0
                                      metrics:nil
                                      views:views]];
    
    //设置垂直约束
    [constraints addObjectsFromArray:[NSLayoutConstraint
                                      constraintsWithVisualFormat:@"V:|-5-[contentLabel]-5-|"
                                      options:0
                                      metrics:nil
                                      views:views]];
    
    [self.contentView addConstraints:constraints];
}
@end
