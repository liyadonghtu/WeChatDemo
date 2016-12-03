//
//  MineMainViewController.m
//  WeChat
//
//  Created by 李亚东 on 16/11/26.
//  Copyright © 2016年 李亚东. All rights reserved.
//

#import "MineMainViewController.h"
#import "MineFirstTableViewCell.h"
#import "DiscoverTableViewCell.h"

@interface MineMainViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSDictionary  *myDataSourceDic;

@end

@implementation MineMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.myTableView];
    
    self.myDataSourceDic = @{@0:@[@"相册",@"收藏",@"钱包",@"卡包"],@1:@[@"表情"],@2:@[@"设置"]};
    
    
    
    // Do any additional setup after loading the view.
}
- (UIImage *)creatRandomImage {
    NSString *headerImage = [NSString stringWithFormat:@"headImage_%d",arc4random() % 11 + 1];
    return [UIImage imageNamed:headerImage];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - lazyload
- (UITableView *)myTableView {
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
    }
    return _myTableView;
}
- (NSDictionary *)myDataSourceDic {
    if (!_myDataSourceDic) {
        _myDataSourceDic = [NSDictionary dictionary];
    }
    return _myDataSourceDic;
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    
    return [self.myDataSourceDic[[NSNumber numberWithInteger:section - 1]] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        static NSString *CellIdentifier = @"mineCell";
        MineFirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier]; //出列可重用的cell
        if (cell == nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"MineFirstTableViewCell" owner:self options:nil] lastObject];
        }
        return cell;
        
    } else {
    
    static NSString *CellIdentifier = @"discoverCell";
    DiscoverTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier]; //出列可重用的cell
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"DiscoverTableViewCell" owner:self options:nil] lastObject];
    }
    NSArray *currentData = self.myDataSourceDic[[NSNumber numberWithInteger:indexPath.section - 1]];
    cell.discoverLabel.text = currentData[indexPath.row];
        cell.discoverImageView.image = [self creatRandomImage];
    return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 80;
    }
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 15;
}


@end
