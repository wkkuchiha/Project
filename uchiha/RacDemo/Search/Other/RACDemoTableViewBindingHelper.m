//
//  RACDemoTableViewBindingHelper.m
//  uchiha
//
//  Created by 王鹏 on 2018/10/12.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import "RACDemoTableViewBindingHelper.h"
#import <ReactiveCocoa/RACEXTScope.h>
#import "RACDemoSearchTbViewCell.h"
#import "RACDemoBindViewModelProtocol.h"
@interface RACDemoTableViewBindingHelper()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tbView;
@property(nonatomic,copy)NSArray *dataSource;
@property(nonatomic,strong)RACCommand *selection;
@property(nonatomic,strong)UITableViewCell *tbViewCell;
@end

@implementation RACDemoTableViewBindingHelper

+ (instancetype)bindingViewModel:(UITableView *)tableView sourceSignal:(RACSignal *)source selectionCommand:(RACCommand *)selection {
    return [[RACDemoTableViewBindingHelper alloc]initWithTableView:tableView sourceSignal:source selectionCommand:selection];
}

- (instancetype)initWithTableView:(UITableView *)tableView sourceSignal:(RACSignal *)source selectionCommand:(RACCommand *)selection {
    if (self = [super init]) {
        _tbView = tableView;
        _selection = selection;
        _dataSource = [NSArray array];
        [source subscribeNext:^(id x) {
            self -> _dataSource = x;
            [self -> _tbView reloadData];
        }];
        _tbViewCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseIdentifier"];
        _tbView.rowHeight = _tbViewCell.size.height;
        _tbView.dataSource = self;
        _tbView.delegate = self;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<RACDemoBindViewModelProtocol>cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
    [cell bindViewModel:_dataSource[indexPath.row]];
    return (UITableViewCell *)cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_selection execute:@(indexPath.row)];
    if ([self.delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        [self.delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([self.delegate respondsToSelector:@selector(scrollViewDidScroll:)]) {
        [self.delegate respondsToSelector:@selector(scrollViewDidScroll:)];
    }
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    if ([self.delegate respondsToSelector:@selector(respondsToSelector:)]) {
        return YES;
    }
    return [super respondsToSelector:aSelector];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if ([self.delegate respondsToSelector:@selector(forwardingTargetForSelector:)]) {
        return self.delegate;
    }
    return [super forwardingTargetForSelector:aSelector];
}
@end
