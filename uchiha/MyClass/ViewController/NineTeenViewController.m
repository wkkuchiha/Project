//
//  NineTeenViewController.m
//  控件系数-03
//
//  Created by 张玺 on 16/3/24.
//  Copyright © 2016年 张玺. All rights reserved.
//

#import "NineTeenViewController.h"
#import "UIView+Extension.h"

#define UIControlXLength(control) CGRectGetMaxX(control.frame)
#define UIControlYLength(control) CGRectGetMaxY(control.frame)

#define UIViewOriginX(control) (control.frame.origin.x)
#define UIViewOriginY(control) (control.frame.origin.y)


@interface NineTeenViewController ()<UIScrollViewDelegate>
{
    UIView    *  _headerView;
    UIScrollView  *  _contenView;
    UIImageView  *  _imaView;
}
@end

@implementation NineTeenViewController
- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"UIScrollView的滑动事件";
    self.view.backgroundColor = [UIColor  whiteColor];
    
    self.edgesForExtendedLayout = UIRectEdgeAll;
    [self  setUpView];
}

- (void)setUpView
{
//    _headerView = [[UIView  alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height/3)];
//    _headerView.backgroundColor = [UIColor cyanColor];
//    [self.view addSubview:_headerView];
    
    _imaView = [[UIImageView  alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height/3)];
    _imaView.image = [UIImage  imageNamed:@"dd.jpg"];
    [self.view addSubview:_imaView];
    
    
    _contenView = [[UIScrollView  alloc]initWithFrame:CGRectMake(_imaView.x, UIControlYLength(_imaView), _imaView.width, self.view.height/3*2)];
    _contenView.showsHorizontalScrollIndicator = NO;
    _contenView.showsVerticalScrollIndicator = YES;
    _contenView.backgroundColor = [UIColor  whiteColor];
    [self.view  addSubview:_contenView];
    _contenView.delegate = self;
    _contenView.contentSize = CGSizeMake(_contenView.width, 800);
    _contenView.backgroundColor = [UIColor  cyanColor];
    _contenView.alpha = 1;
    UIButton   *  btn = [UIButton  buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(0, 0, 50, 50);
    btn.center = CGPointMake(_contenView.centerX, 150);
    btn.backgroundColor = [UIColor  redColor];
    btn.layer.cornerRadius = 25;
    [_contenView  addSubview:btn];
    
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == _contenView) {
        CGFloat  offsetY = scrollView.contentOffset.y;
        [self  updateHeaddViewStyleWith:offsetY];
    }
}
#pragma mark - Private  Method
- (void)updateHeaddViewStyleWith:(CGFloat)offsetY
{
    if (offsetY<0) {
        CGRect  defaultRect = CGRectMake(0, 0, self.view.width, self.view.height/3);
        CGFloat  delta = 0.0f;
        delta  = fabs(MIN(0.0, offsetY));
        defaultRect.origin.y -= delta;
        defaultRect.size.height += 2*delta;
        _imaView.frame = defaultRect;
        /*
        CGRect  scrollViewRect  = CGRectMake(0, self.view.height/3, self.view.width, self.view.height/3*2);
        
        scrollViewRect.origin.y += 2*delta;
        _contenView.frame = scrollViewRect;
         */
        _contenView.alpha = delta/(offsetY*2);
        //_imaView.clipsToBounds = YES;
    }
}
//- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
//{
// _contenView.alpha = 1;
//}


@end
