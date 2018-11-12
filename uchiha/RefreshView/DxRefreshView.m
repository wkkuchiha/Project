//
//  DxRefreshView.m
//  DxRefreshView_OC
//
//  Created by dx on 2016/9/13.
//  Copyright © 2016年 dx. All rights reserved.
//

#import "DxRefreshView.h"


const static CGFloat HEADER_VIEW_HEIGHT = 64.0;

#define PULL_TEXT       @"下拉刷新数据..."
#define RELEASR_TEXT    @"释放刷新数据..."
#define REFESHING_TEXT  @"正在刷新数据..."

@interface DxRefreshView()

@property(nonatomic,strong) UILabel *textLabel;
@property(nonatomic,assign) CGFloat originInsetTop;
@property(nonatomic,strong) DxRefreshLayer *refreshLayer;

@end


@implementation DxRefreshView

-(instancetype)init
{
    CGRect frame = CGRectMake(0, -HEADER_VIEW_HEIGHT, [UIScreen mainScreen].bounds.size.width, 0);
    self = [super initWithFrame:frame];
    if(self){
        _color = [UIColor darkGrayColor];
        _originInsetTop = -1;
        [self initSubViews];
    }
    return self;
}

-(void)beginRefreshing
{
    [_refreshLayer beginRefreshing];
    [self setRefreshingStateText];
    [self setScrollViewContentInsetForLoading:(UIScrollView*)self.superview];
    self.frame = CGRectMake(0, -HEADER_VIEW_HEIGHT, self.frame.size.width, HEADER_VIEW_HEIGHT);
    _textLabel.frame = CGRectMake(_textLabel.frame.origin.x, (HEADER_VIEW_HEIGHT-14)/2, _textLabel.frame.size.width, 14);
    _textLabel.layer.opacity = 1.0;
    if(_actionHandler){
        _actionHandler();
    }
}


-(void)endRefreshing
{
    if(_refreshLayer.state != LOADING){
        return;
    }
    UIScrollView *scrollView = (UIScrollView*)self.superview;
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0, -HEADER_VIEW_HEIGHT,self.frame.size.width, 0);
        _textLabel.layer.opacity = 0.0;
        UIEdgeInsets inset = scrollView.contentInset;
        inset.top = _originInsetTop;
        scrollView.contentInset = inset;
    }completion:^(BOOL finished) {
        [_refreshLayer removeAllAnimations];
        [_refreshLayer reset];
        [self setPullStateText];
    }];
}


-(void)initSubViews
{
    _refreshLayer = [DxRefreshLayer layer];
    _refreshLayer.contentsScale = [UIScreen mainScreen].scale;
    _refreshLayer.color = _color;
    [self.layer addSublayer:_refreshLayer];
    
    _textLabel = [[UILabel alloc] init];
    _textLabel.font = [UIFont systemFontOfSize:13];
    _textLabel.layer.opacity = 0.0;
    _textLabel.textColor = _color;
    [self addSubview:_textLabel];
    
    [self setPullStateText];
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:_textLabel.font forKey:NSFontAttributeName];
    CGFloat textWidth = [_textLabel.text boundingRectWithSize:CGSizeMake(0, HEADER_VIEW_HEIGHT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size.width;
    CGFloat left = (self.frame.size.width - 26 - textWidth)/2;
    _refreshLayer.frame = CGRectMake(left, 0, 24, HEADER_VIEW_HEIGHT);
    _textLabel.frame = CGRectMake(left+26, 0, textWidth, 14);
}

-(void)setPullStateText
{
    if(![_textLabel.text isEqualToString:PULL_TEXT]){
        _textLabel.text = PULL_TEXT;
    }
}

-(void)setRefreshingStateText
{
    _textLabel.text = REFESHING_TEXT;
}

-(void)setReleaseStateText
{
    if(![_textLabel.text isEqualToString:RELEASR_TEXT]){
        _textLabel.text = RELEASR_TEXT;
    }
}

-(void)setColor:(UIColor *)color
{
    _refreshLayer.color = color;
    _textLabel.textColor = color;
}


-(void)startLoadingAniamtion
{
    if(_refreshLayer.state == LOADING){
        return;
    }
    [_refreshLayer startLoaingAnimation];
    [self setRefreshingStateText];
    if(_actionHandler){
        _actionHandler();
    }
}

- (void)didScrollWithScrollView:(UIScrollView*)scrollView
{
    if(_refreshLayer.state == LOADING || _originInsetTop == -1){
        return;
    }
    
    if(-scrollView.contentOffset.y >= _originInsetTop + HEADER_VIEW_HEIGHT && !scrollView.isDragging){
        [self setScrollViewContentInsetForLoading:scrollView];
        [self startLoadingAniamtion];
        return;
    }
    
    if(scrollView.isDragging){
        CGFloat contentOffsetY = -scrollView.contentOffset.y - _originInsetTop;
        _refreshLayer.contentOffsetY = contentOffsetY;
        if(contentOffsetY < HEADER_VIEW_HEIGHT){
            [self setPullStateText];
        }else{
            [self setReleaseStateText];
        }
        if(contentOffsetY > HEADER_VIEW_HEIGHT) contentOffsetY = HEADER_VIEW_HEIGHT;
        self.frame = CGRectMake(0, -contentOffsetY, CGRectGetMaxX(scrollView.bounds), contentOffsetY);
        _textLabel.frame = CGRectMake(_textLabel.frame.origin.x, contentOffsetY/2-7, _textLabel.frame.size.width, 14);
        _refreshLayer.frame = CGRectMake(_refreshLayer.frame.origin.x, contentOffsetY/2-HEADER_VIEW_HEIGHT/2, _refreshLayer.frame.size.width, _refreshLayer.frame.size.height);
        _textLabel.layer.opacity = contentOffsetY / HEADER_VIEW_HEIGHT;
    }
}

- (void)setScrollViewContentInsetForLoading:(UIScrollView*)scrollView {
    UIEdgeInsets currentInsets = scrollView.contentInset;
    currentInsets.top = _originInsetTop + HEADER_VIEW_HEIGHT;
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         scrollView.contentInset = currentInsets;
                     }
                     completion:NULL];
}

#pragma mark -----observer
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    UIScrollView *scrollView = (UIScrollView*)object;
    if([keyPath isEqualToString:@"contentOffset"]){
        [self didScrollWithScrollView:scrollView];
    }
    
    if([@"contentInset" isEqualToString:keyPath]){
        id edge = [change objectForKey:NSKeyValueChangeNewKey];
        if (edge && _originInsetTop == -1){
            UIEdgeInsets inserts = [edge UIEdgeInsetsValue];
            _originInsetTop = inserts.top;
        }
    }
}

@end
