//
//  AddressMainViewController.m
//  WeChat
//
//  Created by 李亚东 on 16/11/26.
//  Copyright © 2016年 李亚东. All rights reserved.
//

#import "AddressMainViewController.h"
#import "AddressMainTableViewCell.h"

@interface AddressMainViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;

@property (nonatomic, strong) NSArray  *myDataSourceArray;

@end

@implementation AddressMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.myTableView];
    
    UIButton *myButton = [UIButton buttonWithType:UIButtonTypeCustom];
    myButton.frame = CGRectMake(0, 0, 30, 30);
    [myButton setImage:[UIImage imageNamed:@"add_Friend_image"] forState:UIControlStateNormal];
    [self.navigationController.navigationBar addSubview:myButton];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:myButton];
    

    NSMutableArray *finaNameArray = [NSMutableArray array];
    for (int i = 0; i < 100; i++) {
        [finaNameArray addObject:[self createRandomName]];
    }
    self.myDataSourceArray = finaNameArray;
    
//    self.myDataSourceArray = @[@"李彦龙",@"李朵雯",@"李浩鹏",@"李雨杭",@"李铁刚",@"李贞荪",@"李君昊",@"李瑾宛",@"李国艳",@"李滢玉",@"李恩德",@"李美穆",@"李文雅",@"李姗芝",@"李文轩",@"李宛娇",@"李文博",@"李箐思",@"李文璇",@"李蕖姿",@"李文萱",@"李雨昕",@"李文渲",@"李若蕴",@"李美红",@"李些忆"];
    

    // Do any additional setup after loading the view.
}
- (NSString *)createRandomName{
    
    // 获取一个随机数范围在：[500,1000），包括500，包括1000
    //int y = (arc4random() % 501) + 500;
    NSArray *familyArray = @[@"赵", @"钱", @"孙", @"李", @"周", @"吴", @"郑" ,@"王",@"万俟", @"司马"];
    NSArray *nameArray = @[@"彦龙",@"朵雯",@"浩鹏",@"雨杭",@"铁刚",@"贞荪",@"君昊",@"瑾宛",@"国艳",@"滢玉",@"恩德",@"美穆",@"文雅",@"姗芝",@"文轩",@"宛娇",@"文博",@"箐思",@"文璇",@"蕖姿",@"文萱",@"雨昕",@"文渲",@"若蕴",@"美红",@"些忆"];
    
    NSInteger familyIndex = arc4random() % familyArray.count;
    NSInteger nameIndex = arc4random() % nameArray.count;
    
    NSString *finaName = [NSString stringWithFormat:@"%@%@",familyArray[familyIndex],nameArray[nameIndex]];
    
    return finaName;
    
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
- (NSArray *)myDataSourceArray {
    if (!_myDataSourceArray) {
        _myDataSourceArray = [NSArray array];
    }
    return _myDataSourceArray;
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.myDataSourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"addressCell";
    AddressMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier]; //出列可重用的cell
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"AddressMainTableViewCell" owner:self options:nil] lastObject];
    }
    cell.addressName.text = self.myDataSourceArray[indexPath.row];
    cell.addressIcon.image = [self creatRandomImage];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSArray *array = @[@"A", @"B", @"C", @"D", @"E"];
    return array[section];
}


@end
