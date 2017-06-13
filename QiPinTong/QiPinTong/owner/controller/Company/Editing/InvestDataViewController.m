//
//  InvestDataViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/3/16.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "InvestDataViewController.h"

@interface InvestDataViewController ()<UITableViewDelegate,UITableViewDataSource,EditingControllerBackStringDelegate>

@property (strong,nonatomic) UITableView *tableView;

@property (strong,nonatomic) UIView *footerView;

@property (strong,nonatomic) NSMutableArray *titleAry;
@property (strong,nonatomic) NSMutableArray *sLabAry;

@end

@implementation InvestDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    self.navigationItem.title = @"投资机构资料";
    
   self.titleAry = [NSMutableArray arrayWithObjects:@"投资领域",@"投资轮次",@"投资区域",@"成功数量",@"机构简介", nil];
    self.sLabAry = [NSMutableArray arrayWithObjects:@"请选择",@"请选择",@"请选择",@"请填写",@"请填写", nil];
}

#pragma mark /--------footerView--------/
-(UIView *)footerView{
    if (!_footerView) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
        _footerView.backgroundColor = whiteC;
        
        UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [saveBtn setTitle:@"申请" forState:UIControlStateNormal];
        saveBtn.backgroundColor = blueC;
        saveBtn.layer.masksToBounds = YES;
        saveBtn.layer.cornerRadius = 3;
        [saveBtn addTarget:self action:@selector(saveBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_footerView addSubview:saveBtn];
        [saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.and.centerX.equalTo(_footerView);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, formBtnHeight));
        }];
    }
    return _footerView;
}

-(void)saveBtnClick{
    
}

#pragma mark /--------tableView--------/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = self.footerView;
        _tableView.tableFooterView.height = self.footerView.height;
        _tableView.sectionFooterHeight = 0;
        _tableView.backgroundColor = whiteC;
        
        _tableView.separatorStyle = NO;
    }
    return _tableView;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
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
        cell.titleLabel.attributedText = [self attributedStr:self.titleAry[indexPath.row]];
        cell.selectLabel.text = self.sLabAry[indexPath.row];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row==0||indexPath.row==1||indexPath.row==2) {
        NSArray *fieldAry = @[@"移动互联网",@"金融",@"企业服务",@"教育",@"医疗健康",@"旅游"];
        NSArray *modeAry = @[@"战略联盟",@"业务外包"];
        NSArray *zoneAry = @[@"北京",@"上海",@"广州",@"深圳",@"杭州",@"西安"];
        NSArray *arr = [NSArray arrayWithObjects:fieldAry,modeAry,zoneAry, nil];
        
        SingleSelectView *single = [[SingleSelectView alloc]initWithFrame:SCREEN_BOUNDS SelectTtitle:self.titleAry[indexPath.row] TitleArr:arr[indexPath.row]];
        [single showView:^(NSString *singleStr) {
            [self.sLabAry replaceObjectAtIndex:indexPath.row withObject:singleStr];
            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:indexPath.row inSection:0], nil] withRowAnimation:UITableViewRowAnimationNone];
        }];
    }
    else{
        EditingController *editVc = [[EditingController alloc]init];
        editVc.kindTitle = self.titleAry[indexPath.row];
        editVc.selectIndex = indexPath.row;
        editVc.delegate = self;
        MainNavigationController *vc = [[MainNavigationController alloc]initWithRootViewController:editVc];
        [self presentViewController:vc animated:YES completion:nil];
    }
}

-(void)backStringToComeViewWith:(EditingController *)editVc andTag:(NSInteger)index{
//    if (index==3||index==4) {
//        if (![editVc.editText isEqualToString:@""]) {
//            [self.sLabAry replaceObjectAtIndex:index withObject:editVc.editText];
//            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:index inSection:0], nil] withRowAnimation:UITableViewRowAnimationNone];
//        }
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
