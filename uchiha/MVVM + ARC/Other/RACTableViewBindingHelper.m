//
//  RACTableViewBindingHelper.m
//  uchiha
//
//  Created by uchiha on 2017/9/4.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import "RACTableViewBindingHelper.h"
#import "RACBindViewModelProtocol.h"

@interface  RACTableViewBindingHelper()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tbView;
@property(nonatomic,copy)NSArray *dataArray;
@property(nonatomic,strong)UITableViewCell *cell;
@property(nonatomic,strong)RACCommand *racCommand;
@property (weak, nonatomic) id<UITableViewDelegate> delegate;

@end

@implementation RACTableViewBindingHelper

+ (instancetype)bindingHelperForTableView:(UITableView *)tbView sourceSignal:(RACSignal *)source selectionCommand:(RACCommand *)section templateCell:(UINib *)templateCellNib {
    return [[RACTableViewBindingHelper alloc]initWithBindingHelperForTabView:tbView sourceSignal:source selectionCommand:section templateCell:templateCellNib];
}

- (instancetype)initWithBindingHelperForTabView:(UITableView *)tbView sourceSignal:(RACSignal *)source selectionCommand:(RACCommand *)section templateCell:(UINib *)nib{
    if (self = [super init]) {
        _tbView = tbView;
        _dataArray = [NSArray array];
        _racCommand = section;
        
        [source subscribeNext:^(id x) {
            self->_dataArray = x;
            [self->_tbView reloadData];
        }];
        _cell = [[nib instantiateWithOwner:nil options:nil] firstObject];
        [_tbView registerNib:nib forCellReuseIdentifier:_cell.reuseIdentifier];
        _tbView.rowHeight = _cell.bounds.size.height;
        _tbView.delegate = self;
        _tbView.dataSource = self;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id<RACBindViewModelProtocol>cell = [tableView dequeueReusableCellWithIdentifier:_cell.reuseIdentifier];
    [cell bindViewModel:[_dataArray objectAtIndex:indexPath.row]];
    UITableViewCell *tbViewCell = (UITableViewCell *)cell;
    return  tbViewCell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([self.delegate respondsToSelector:@selector(scrollViewDidScroll:)]) {
        [self.delegate scrollViewDidScroll:scrollView];
    }
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    if ([self.delegate respondsToSelector:aSelector]) {
        return YES;
    }
    return [super forwardingTargetForSelector:aSelector];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if ([_delegate respondsToSelector:aSelector]) {
        return self.delegate;
    }
    return [super forwardingTargetForSelector:aSelector];
}
@end

