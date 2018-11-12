//
//  RefreshView.m
//  MiuTrip
//
//  Created by Miutrip on 2016/9/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "RefreshView.h"

@interface RefreshView()
{
    RefreshLayer *_refreshLayer;
    UILabel *_textLabel;
}

@property(nonatomic,copy)ActionHandler actionHandler;

@end

@implementation RefreshView


-(instancetype)initWithActionHander:(ActionHandler)handler
{
    CGRect frame = CGRectMake(0, 0, appFrame.size.width, 0);
    self = [super initWithFrame:frame];
    if(self){
        _actionHandler = handler;
        [self initLayer];
    }
    return self;
}


-(void)initLayer
{
    CGFloat left = (appFrame.size.width-110.0)/2;
    _refreshLayer = [RefreshLayer layer];
    _refreshLayer.frame = CGRectMake(left, 0, 24, 48);
    _refreshLayer.contentsScale = [UIScreen mainScreen].scale;
    _refreshLayer.color = DarkGrayColor;
    [self.layer addSublayer:_refreshLayer];
    
    _textLabel = [[UILabel alloc] initWithFrame:CGRectMake(UIControlXLength(_refreshLayer), 0, 86, 48)];
    _textLabel.textColor = DarkGrayColor;
    _textLabel.font = CellHeaderFooterFont;
    _textLabel.textAlignment = NSTextAlignmentCenter;
    _textLabel.layer.opacity = 0.0;
    [self addSubview:_textLabel];
    
    [self setPullStateText];
}

-(void)setPullStateText
{
     _textLabel.text = @"下拉刷新数据...";
}

-(void)setRefreshingStateText
{
    _textLabel.text = @"正在刷新数据...";
}

-(void)setReleaseStateText
{
    _textLabel.text = @"释放刷新数据...";
}

-(void)setColor:(UIColor *)color
{
    _refreshLayer.color = color;
    _textLabel.textColor = color;
}


-(void)setProgress:(CGFloat)progress
{
    _refreshLayer.progress = progress;
}

-(void)startLoadingAniamtion
{
    [_refreshLayer startLoaingAnimation];
    [self setRefreshingStateText];
    if(_actionHandler){
        _actionHandler();
    }
}

-(void)beginRefreshing
{
    [_refreshLayer displayAndLoaing];
    [self setRefreshingStateText];
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0, 0, self.frame.size.width, 48);
        _textLabel.layer.opacity = 1.0;
    }];
    if(_actionHandler){
        _actionHandler();
    }
}


-(void)endRefreshing
{
    if(_refreshLayer.state != LOADING){
        return;
    }
    [UIView animateWithDuration:0.3 animations:^{
        self.transform = CGAffineTransformMakeTranslation(0, -48);
    }completion:^(BOOL finished) {
        [_refreshLayer removeAllAnimations];
        [_refreshLayer reset];
        _textLabel.layer.opacity = 0.0;
        [self setPullStateText];
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 0.3 * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
             self.transform = CGAffineTransformMakeTranslation(0, 0);
             self.frame = CGRectMake(0, 0,self.frame.size.width, 0);
        });
    }];
}

- (void)DidScrollWithScrollView:(UIScrollView*)scollView
{
    if(_refreshLayer.state == LOADING){
        return;
    }
    if(scollView.contentOffset.y < 0){
        CGFloat progress = -scollView.contentOffset.y/48.0;
        if(self.frame.size.height < 48){
            self.frame = CGRectMake(0, 0, CGRectGetMaxX(scollView.bounds), -scollView.contentOffset.y);
            _textLabel.layer.opacity = progress;
        }
        if(progress > 1){
            progress = 1;
            _textLabel.layer.opacity = progress;
            self.frame = CGRectMake(0, 0, CGRectGetMaxX(scollView.bounds), 48);
            [self setReleaseStateText];
        }
        [self setProgress:progress];
    }
    
    if(scollView.contentOffset.y == 0){
        [self startLoadingAniamtion];
    }
}

#pragma mark -----observer
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if([keyPath isEqualToString:@"contentOffset"]){
        [self DidScrollWithScrollView:(UIScrollView*)object];
    }
}


@end
