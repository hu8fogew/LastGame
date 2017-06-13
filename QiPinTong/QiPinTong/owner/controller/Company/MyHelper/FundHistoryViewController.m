//
//  FundHistoryViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/1/17.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "FundHistoryViewController.h"

@interface FundHistoryViewController()<UITableViewDelegate,UITableViewDataSource,EditingControllerBackStringDelegate>

@property (strong,nonatomic) UITableView *tableView;

@property (strong,nonatomic) NSMutableArray *titleArray;

@property (strong,nonatomic) NSMutableArray *sLabelArray;

@property (strong,nonatomic) UIView *footerView;

@end

@implementation FundHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
    self.titleArray = [NSMutableArray arrayWithObjects:@"时间",@"融资轮次",@"投资额度",@"投资机构", nil];
    
    self.sLabelArray = [NSMutableArray arrayWithObjects:@"请选择",@"请选择",@"请填写(单位万元)",@"请填写", nil];
    [self setupNavigationItem];
}


#pragma mark ---------setNavigation
- (void)setupNavigationItem {
    
    NSString *prefix = @"融资历史";
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:prefix];
    
    [string addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:MTitleSize+1]range:[prefix rangeOfString:prefix]];
    [string addAttribute:NSForegroundColorAttributeName value:whiteC range:[prefix rangeOfString:prefix]];
    
    //创建label
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.attributedText = string;
    titleLabel.numberOfLines = 0;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.width = 100;
    titleLabel.height = 44;
    self.navigationItem.titleView = titleLabel;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelClick)];
    
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
}
//取消编辑
-(void)cancelClick
{
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark ------footerView----------
-(UIView *)footerView{
    if (!_footerView) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"添加" forState:UIControlStateNormal];
        btn.backgroundColor = blueC;
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 3;
        [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
        [_footerView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_footerView);
            make.bottom.with.offset(-10);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, formBtnHeight));
            
        }];
    }
    return _footerView;
}

//发布按钮跳转
-(void)btnAction{
    HWLog(@"添加");
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -------tableView--------
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = NO;
        _tableView.sectionFooterHeight = 0;
        _tableView.backgroundColor = whiteC;
        
        _tableView.tableFooterView = self.footerView;
        _tableView.tableFooterView.height = self.footerView.height;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.titleArray.count;
}

//自定义分组头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, topToMargin)];
    headView.backgroundColor = grayC;
    
    return headView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return topToMargin;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return formCellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YCYMFormTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ce"];
    if (cell == nil) {
        cell = [[YCYMFormTableViewCell alloc]initWithFrame:cell.bounds];
        cell.titleLabel.attributedText = [self attributedStr: self.titleArray[indexPath.row]];
        cell.selectLabel.text = self.sLabelArray[indexPath.row];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    EditingController *editVC = [EditingController new];
    editVC.kindTitle = self.sLabelArray[indexPath.row];
    editVC.selectIndex = indexPath.row;
    editVC.delegate = self;
    
    MainNavigationController *vc = [[MainNavigationController alloc]initWithRootViewController:editVC];
    if (indexPath.row == 0) {
        DateSelectView *date = [[DateSelectView alloc]initWithFrame:SCREEN_BOUNDS SelectDateTtitle:@"时间"];
        [date showDateView:^(NSString *selectStr) {
            [self.sLabelArray replaceObjectAtIndex:0 withObject:selectStr];
            [self.tableView reloadData];
        }];
    }
    if (indexPath.row == 1) {
        SingleSelectView *single = [[SingleSelectView alloc]initWithFrame:SCREEN_BOUNDS SelectTtitle:@"融资轮次" TitleArr:@[@"天使轮",@"种子轮",@"A轮",@"B轮"]];
        [single showView:^(NSString *singleStr) {
            [self.sLabelArray replaceObjectAtIndex:1 withObject:singleStr];
            [self.tableView reloadData];
        }];
    }
    
    if (indexPath.row==2||indexPath.row==3) {
        [self presentViewController:vc animated:YES completion:nil];
    }
    
}

-(void)backStringToComeViewWith:(EditingController *)editVc andTag:(NSInteger)index{
//    if (![editVc.editText isEqualToString:@""]) {
//        [self.sLabelArray replaceObjectAtIndex:index withObject:editVc.editText];
//        [self.tableView reloadData];
//    }
}

//红色星星✨
-(NSMutableAttributedString *)attributedStr:(NSString *)str{
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:[@"* "stringByAppendingString:str]];
    [attributedStr addAttribute:NSForegroundColorAttributeName value:redC range:NSMakeRange(0, 1)];
    return attributedStr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
