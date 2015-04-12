//
//  ViewController.m
//  CustomCellWithVFLDemo
//
//  Created by Qin Yuxiang on 4/6/15.
//  Copyright (c) 2015 YuxiangQ. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"

@interface ViewController ()

/**
 *  原型cell
 */
@property (strong,nonatomic) CustomCell *prototypeCustomCell;

/**
 *  数据源
 */
@property (strong,nonatomic) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.dataArray=@[@"很多时候旅客会因为本场天气正常，阳光明媚，而不解为何延误原因是天气问题，而在实际情况当中，由天气原因导致的延误，有可能为以下各种情况,"
                     ,@"例如：航路天气不好 航路天气不好及备降场关闭 目的地机场天气不好"
                     ,@"假如航班因为天气原因延误了，而你连飞机的影子还没看到，也有可能因为飞机上一个出发机场的天气不好，或上一个机场到本场的航路天气不好形成了飞机晚到的情况从而造成延误，也属于由于天气问题造成的航班延误。"
                     ,@"因此题主的问题中，本场有其他的飞机已经飞了，并不能否定你所搭乘的航班并不是由于天气原因造成延误。"
                     ,@"另外关于机场工作人员不清楚情况的相关疑问，通常来说地勤人员并非飞机是否满足足够条件可以起飞的决策者，他们一般会提前根据空管和机组给出的预计时间通知旅客，也就是平时我们搭乘飞机遇到延误的时候，值机柜台或登机口，以及机场的各个大屏幕上，都会给出航班延误至几点这样的公开信息。但由于天气，空中管制等原因，偶尔会出现进一步延误，这个时候地勤人员也确实很难获得确切时间，在这一点上，连大多数飞行员们也只能在飞机上坐等空管哥哥们给出的指令不是么？就像遇上大堵车的时候交警叔叔也说不上来你几点能走吖！╮(╯▽╰)╭"];
    [self.tableView registerClass:[CustomCell class] forCellReuseIdentifier:kCustomCellIdentifier];
    self.prototypeCustomCell=[self.tableView dequeueReusableCellWithIdentifier:kCustomCellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark UITableViewDelegate Methods
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.prototypeCustomCell configurationCell:self.dataArray[indexPath.row]];
    [self.prototypeCustomCell setNeedsLayout];
    [self.prototypeCustomCell layoutIfNeeded];
     CGFloat height=[self.prototypeCustomCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height+1;
    return height;
}

#pragma mark -
#pragma mark UITableViewDataSource Methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomCell *cell=[tableView dequeueReusableCellWithIdentifier:kCustomCellIdentifier forIndexPath:indexPath];
    [cell configurationCell:self.dataArray[indexPath.row]];
    return cell;
}

@end
