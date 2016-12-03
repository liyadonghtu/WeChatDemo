//
//  LYDPopMenuView.m
//  WeChat
//
//  Created by 李亚东 on 16/12/1.
//  Copyright © 2016年 李亚东. All rights reserved.
//

#import "LYDPopMenuView.h"

@interface LYDPopMenuView () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *titleTableView;
@property (nonatomic, assign) CGRect tableFrame;
@property (nonatomic, assign) NSArray *dataSourceArray;


@end

@implementation LYDPopMenuView

- (LYDPopMenuView *)initPopMenuViewWithTitleArray:(NSArray *)titleArray iconNameArray:(NSArray *)iconNameArray viewFrame:(CGRect)viewFrame {
    self.tableFrame = viewFrame;
    LYDPopMenuView *popView = [self initWithFrame:[UIScreen mainScreen].bounds];
    self.dataSourceArray = titleArray;
    
    return popView;
}


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIView *backView = [[UIView alloc] initWithFrame:frame];
        backView.backgroundColor = [UIColor grayColor];
        backView.alpha = 0.3;
        [self addSubview:backView];
        [self addSubview:self.titleTableView];
    }
    return self;
}

#pragma mark - lazyload
- (UITableView *)titleTableView {
    if (!_titleTableView) {
        self.titleTableView = [[UITableView alloc] initWithFrame:self.tableFrame];
        self.titleTableView.delegate = self;
        self.titleTableView.dataSource = self;
    }
    return _titleTableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
 
    return self.dataSourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifer = @"menueCell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    
    cell.textLabel.text = self.dataSourceArray[indexPath.row];
    
    
    return cell;
}



@end
