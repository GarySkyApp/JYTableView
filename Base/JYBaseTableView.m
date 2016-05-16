//
//  JYBaseTableView.m
//  JYTableView
//
//  Created by Gary on 16/5/16.
//  Copyright © 2016年 JY. All rights reserved.
//

#import "JYBaseTableView.h"
#import "MJRefreshNormalHeader.h"
#import "MJRefreshAutoNormalFooter.h"

#import "JYTableViewDelegate.h"

@interface JYBaseTableView ()

@property (nonatomic, strong) JYTableViewDelegate *tableDelegate;
@end

@implementation JYBaseTableView

#pragma mark - init
-(instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self configerTableViewDelegate];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self configerTableViewDelegate];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self configerTableViewDelegate];
    }
    return self;
}


#pragma mark - configer
-(void) configerTableViewDelegate{
    self.tableDelegate = [self getjyDelegate];
}

-(void) configerRefresh{
    MJRefreshNormalHeader *mjheader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self postNetData];
    }];
    
    MJRefreshAutoNormalFooter *mjfooter = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self postMoreData];
    }];
    
    self.mj_header = mjheader;
    self.mj_footer = mjfooter;
}

#pragma mark - post data
-(void)postNetData{

}
-(void)postMoreData{

}

#pragma mark - action
-(void)stopHeaderRush{
    [self.mj_header endRefreshing];
}
-(void)stopFooterRush{
    [self.mj_footer endRefreshing];
}
-(void)nomoreData{
    [self.mj_footer endRefreshingWithNoMoreData];
}
-(void)moreData{
    [self.mj_footer resetNoMoreData];
}

#pragma mark - delegate
//注意，不能使用super
-(id) getjyDelegate{
    return nil;
};

@end
