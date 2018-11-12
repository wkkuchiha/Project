//
//  AnimationViewController.m
//  uchiha
//
//  Created by uchiha on 2017/8/15.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import "AnimationViewController.h"
#import "CABasicAnimationController.h"
#import "CAKeyframeViewController.h"
#import "CAAnimationGroupController.h"
#import "TranSitionViewController.h"
#import "AffineTransformViewController.h"
#import "UIBezierPathController.h"
#import "CAShaplayerViewController.h"
#import "CAGradientLayerViewController.h"
#import "EarningsViewController.h"
#import "HUDViewController.h"

@interface AnimationViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tbView;
@property(nonatomic,copy)NSMutableArray *dataSource;

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"动画组件";
    [self setUpView];
}

- (void)setUpView {
    _tbView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, iphoneScreenWidth, iphoneScreenHeight) style:UITableViewStylePlain];
    _tbView.delegate = self;
    _tbView.dataSource = self;
    [self.view addSubview:_tbView];
    
    _dataSource = [NSMutableArray arrayWithObjects:@"基础动画",@"关键帧动画",@"组动画",@"过渡动画",@"仿射变换",@"UIBezierPath使用",@"CAShaplayer",@"CAGradientLayer",@"渐变收益",@"HUD动画", nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *mycell = @"mycell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:mycell];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:mycell];
    }
    cell.textLabel.text = [_dataSource objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        CABasicAnimationController *CABasic = [CABasicAnimationController new];
        [self.navigationController pushViewController:CABasic animated:NO];
    } else if (indexPath.row == 1) {
        CAKeyframeViewController *CAKey = [CAKeyframeViewController new];
        [self.navigationController pushViewController:CAKey animated:NO];
    } else if (indexPath.row == 2) {
        CAAnimationGroupController *GRoup = [CAAnimationGroupController new];
        [self.navigationController pushViewController:GRoup animated:NO];
    } else if (indexPath.row == 3) {
        TranSitionViewController *TranSition = [TranSitionViewController new];
        [self.navigationController pushViewController:TranSition animated:NO];
    } else if (indexPath.row == 4) {
        AffineTransformViewController *Affine = [AffineTransformViewController new];
        [self.navigationController pushViewController:Affine animated:NO];
    } else if (indexPath.row == 5) {
        UIBezierPathController * UIbezier = [UIBezierPathController new];
        [self.navigationController pushViewController:UIbezier animated:YES];
    } else if (indexPath.row == 6) {
        CAShaplayerViewController * shaplayer = [CAShaplayerViewController new];
        [self.navigationController pushViewController:shaplayer animated:YES];
    } else if (indexPath.row == 7) {
        CAGradientLayerViewController * gradient = [CAGradientLayerViewController new];
        [self.navigationController pushViewController:gradient animated:YES];
    } else if (indexPath.row == 8) {
        EarningsViewController * earnings = [EarningsViewController new];
        [self.navigationController pushViewController:earnings animated:YES];
    } else if (indexPath.row == 9){
        HUDViewController * hud = [HUDViewController new];
        [self.navigationController pushViewController:hud animated:YES];
    }
}
@end
