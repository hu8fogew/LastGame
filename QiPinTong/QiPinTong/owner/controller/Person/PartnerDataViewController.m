//
//  PartnerDataViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/3/22.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "PartnerDataViewController.h"

@interface PartnerDataViewController ()<UITableViewDelegate,UITableViewDataSource,EditingControllerBackStringDelegate,UIGestureRecognizerDelegate>

@property (nonatomic,strong) UITableView *tableView;

@property (strong,nonatomic) UIView *footerView;

@property (strong,nonatomic) NSMutableArray *titleAry;
@property (strong,nonatomic) NSMutableArray *sLabAry;

@end

@implementation PartnerDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"合伙人资料";
    self.view.backgroundColor = whiteC;
    [self.view addSubview:self.tableView];
    
    self.titleAry = [NSMutableArray arrayWithObjects:@"投资领域",@"投资区域",@"合伙方式",@"投资额度",@"个人简介",@"合伙期望",nil];
    self.sLabAry = [NSMutableArray arrayWithObjects:@"请选择",@"请选择",@"请选择",@"请填写(单位万元)",@"请填写",@"请填写", nil];
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (self.navigationController.viewControllers.count == 1) {
        return NO;
    }
    else{
        return YES;
    }
}


#pragma mark /--------懒加载--------/
-(UIView *)footerView{
    if (!_footerView) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
        _footerView.backgroundColor = whiteC;
        
        UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
        saveBtn.backgroundColor = blueC;
        saveBtn.layer.masksToBounds = YES;
        saveBtn.layer.cornerRadius = 3;
        [saveBtn addTarget:self action:@selector(saveBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_footerView addSubview:saveBtn];
        [saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.and.bottom.equalTo(_footerView);
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
        _tableView.backgroundColor = whiteC;
        _tableView.sectionFooterHeight = 0;
        _tableView.separatorStyle = NO;
    }
    return _tableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return 6;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return formCellHeight;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, topToMargin)];
    headView.backgroundColor = grayC;
    
    return headView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return topToMargin;
    }
    return leftToMargin;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YCYMFormTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ca"];
    if (cell == nil) {
        cell = [[YCYMFormTableViewCell alloc]initWithFrame:cell.bounds];
        cell.selectLabel.text = indexPath.section==0?@"":self.sLabAry[indexPath.row];
        
        NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:indexPath.section==0?@"   我要创业":self.titleAry[indexPath.row]];
        [attributedStr addAttribute:NSForegroundColorAttributeName value:indexPath.section==0?MainColor:redC range:NSMakeRange(0, 1)];
        if (indexPath.section==0) {
            cell.titleLabel.text = @"   我要创业";
        }else{
            cell.titleLabel.attributedText = [self attributedStr:self.titleAry[indexPath.row]];
        }
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==0) {
        VtPersonFormViewController *vc = [VtPersonFormViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else{
        if (indexPath.row==0||indexPath.row==1||indexPath.row==2) {
            NSArray *fieldAry = @[@"移动互联网",@"金融",@"企业服务",@"教育",@"医疗健康",@"旅游"];
            NSArray *zoneAry = @[@"北京",@"上海",@"广州",@"深圳",@"杭州",@"西安"];
            NSArray *modeAry = @[@"战略联盟",@"业务外包"];
            NSArray *arr = [NSArray arrayWithObjects:fieldAry,zoneAry,modeAry, nil];
            
            SingleSelectView *single = [[SingleSelectView alloc]initWithFrame:SCREEN_BOUNDS SelectTtitle:self.titleAry[indexPath.row] TitleArr:arr[indexPath.row]];
            [single showView:^(NSString *singleStr) {
                [self.sLabAry replaceObjectAtIndex:indexPath.row withObject:singleStr];
                [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:indexPath.row inSection:1], nil] withRowAnimation:UITableViewRowAnimationNone];
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
}

-(void)backStringToComeViewWith:(EditingController *)editVc andTag:(NSInteger)index{
//    if (index==3||index==4||index==5) {
//        if (![editVc.editText isEqualToString:@""]) {
//            [self.sLabAry replaceObjectAtIndex:index withObject:editVc.editText];
//            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:index inSection:1], nil] withRowAnimation:UITableViewRowAnimationNone];
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
