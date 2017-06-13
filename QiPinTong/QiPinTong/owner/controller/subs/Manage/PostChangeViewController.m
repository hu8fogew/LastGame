//
//  PostChangeViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/5/27.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "PostChangeViewController.h"

@interface PostChangeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) UIView *footerView;

@property (strong,nonatomic) NSMutableArray *titleAry;
@property (strong,nonatomic) NSMutableArray *showAry;

@end

@implementation PostChangeViewController
id changeCell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"岗位调整";
    
    [self.view addSubview:self.tableView];
    
    self.titleAry = [NSMutableArray arrayWithObjects:@"所属地区",@"职位性质",@"所属部门",@"部门职位", nil];
    self.showAry = [NSMutableArray arrayWithObjects:@"陕西省 西安市",@"全职",@"运营管理部",@"部长", nil];
}

#pragma mark ------footerView-------
-(UIView *)footerView{
    if (!_footerView) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"确定" forState:UIControlStateNormal];
        btn.backgroundColor = blueC;
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 3;
        [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
        [_footerView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_footerView);
            make.bottom.mas_equalTo(-topToMargin);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, formBtnHeight));
        }];
    }
    return _footerView;
}

//按钮跳转
-(void)btnAction{
    HWLog(@"保存");
}

#pragma mark /------tableView-------/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.sectionFooterHeight = 0;
        _tableView.separatorStyle = NO;
        _tableView.backgroundColor = grayC;
        _tableView.tableFooterView = self.footerView;
        _tableView.tableFooterView.height = self.footerView.height;
    }
    return _tableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return section==0?1:4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return leftToMargin;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return indexPath.section==0?DeCellHeight:formCellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        TAddDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cc"];
        cell = [[TAddDetailTableViewCell alloc]initWithFrame:cell.bounds isSelect:YES];
        cell.selectionStyle = NO;
        changeCell = cell;
        cell.addressIcon.image = [UIImage imageNamed:@""];
        cell.dateIcon.image = [UIImage imageNamed:@""];
        [cell.imgView sd_setImageWithURL:nil placeholderImage: [UIImage imageNamed:@"classics.jpg"]];
        cell.nameLab.text = @"小青蛙";
    }
    else{
        YCYMFormTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ce"];
        cell = [[YCYMFormTableViewCell alloc]initWithFrame:cell.bounds];
        changeCell = cell;
        cell.titleLabel.text = self.titleAry[indexPath.row];
        cell.showLab.text = self.showAry[indexPath.row];
        if (indexPath.row==0) {
            cell.arrowIcon.image = [UIImage imageNamed:@""];
        }
    }
    return changeCell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==1) {
        if (indexPath.row==1||indexPath.row==2||indexPath.row==3) {
            NSArray *typeAry = @[@"全职",@"兼职"];
            NSArray *sectionAry = @[@"商户事业部",@"招聘事业部",@"校招事业部",@"运营管理部"];
            NSArray *postAry = @[@"CEO",@"总监",@"部长",@"主管",@"专员"];
            NSArray *arr = [NSArray arrayWithObjects:typeAry,sectionAry,postAry, nil];
            SingleSelectView *single = [[SingleSelectView alloc]initWithFrame:SCREEN_BOUNDS SelectTtitle:self.titleAry[indexPath.row] TitleArr:arr[indexPath.row-1]];
            [single showView:^(NSString *singleStr) {
                [self.showAry replaceObjectAtIndex:indexPath.row withObject:singleStr];
                [self.tableView reloadData];
            }];
        }
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
