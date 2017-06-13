//
//  WorkExperViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/2/22.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "WorkExperViewController.h"

@interface WorkExperViewController ()<UITableViewDelegate,UITableViewDataSource,EditingControllerBackStringDelegate>
{
    DateSelectView *dateView;
    UILabel *leftLab;
    UILabel *rightLab;
}

@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) UIView *footerView;

@property (strong,nonatomic) NSMutableArray *titleArr;
@property (strong,nonatomic) NSMutableArray *sLabelArr;

@end

@implementation WorkExperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"工作经历";

    self.titleArr = [NSMutableArray arrayWithObjects:@"   行业类别",@"企业名称",@"   职位类别",@"职位名称",@"时间段",@"   职位月薪",@"   企业性质",@"   人员规模",@"   工作描述", nil];
    self.sLabelArr = [NSMutableArray arrayWithObjects:@"请选择",@"请填写",@"请选择",@"请填写",@"",@"请选择",@"请选择",@"请选择",@"请填写",nil];
    
    [self.view addSubview:self.tableView];
}

#pragma mark /-------懒加载---------/
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
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        _tableView.tableFooterView = self.footerView;
        _tableView.tableFooterView.height = self.footerView.height;
        
        _tableView.sectionFooterHeight = 0;
        _tableView.backgroundColor = whiteC;
        
        _tableView.separatorStyle = NO;
        
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.titleArr.count;
}

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
    YCYMFormTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"c"];
    cell = [[YCYMFormTableViewCell alloc]initWithFrame:cell.bounds];
    cell.selectLabel.text = self.sLabelArr[indexPath.row];
    
    if (indexPath.row == 4) {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.selectLabel.text = self.sLabelArr[indexPath.row];
        
        cell.rightLab.text = @"请选择";
        rightLab = cell.rightLab;
        cell.rightLab.userInteractionEnabled = YES;
        [cell.rightLab addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(chooseRightClick)]];
        
        cell.leftLab.text = @"请选择";
        leftLab = cell.leftLab;
        cell.leftLab.userInteractionEnabled = YES;
       [cell.leftLab addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(chooseLeftClick)]];
        
        cell.lab.text = @"至";
    }
    if (indexPath.row==1||indexPath.row==3||indexPath.row==4) {
        cell.titleLabel.attributedText = [self attributedStr:self.titleArr[indexPath.row]];
    }else{
        cell.titleLabel.text = self.titleArr[indexPath.row];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSArray *salaryAry = @[@"1k-2k",@"2k-3k",@"3k-4k",@"4k-5k",@"5k-6k",@"不限"];
    NSArray *typeAry = @[@"事业单位",@"国企",@"外商独资",@"合资",@"民营",@"股份制企业",@"上市公司",@"其他"];
    NSArray *numAry = @[@"20人以下",@"20-99人",@"100-499人",@"500-999人",@"1000-9999人",@"10000人以上"];
    NSArray *array = [NSArray arrayWithObjects:salaryAry,typeAry,numAry, nil];
    if (indexPath.row==5||indexPath.row==6||indexPath.row==7) {
        SingleSelectView *single = [[SingleSelectView alloc]initWithFrame:SCREEN_BOUNDS SelectTtitle:self.titleArr[indexPath.row] TitleArr:array[indexPath.row-5]];
        [single showView:^(NSString *singleStr) {
            [self.sLabelArr replaceObjectAtIndex:indexPath.row withObject:singleStr];
            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:indexPath.row inSection:0], nil] withRowAnimation:UITableViewRowAnimationNone];
        }];
    }
    
    if (indexPath.row==1||indexPath.row==3||indexPath.row==8) {
        EditingController *editVC = [[EditingController alloc]init];
        editVC.kindTitle = self.titleArr[indexPath.row];
        editVC.selectIndex = indexPath.row;
        editVC.delegate = self;
        
        MainNavigationController *vc = [[MainNavigationController alloc]initWithRootViewController:editVC];
        [self presentViewController:vc animated:YES completion:nil];

    }
    
}

-(void)backStringToComeViewWith:(EditingController *)editVc andTag:(NSInteger)index{
//    if (![editVc.editText isEqualToString:@""]) {
//        if (index==1||index==3||index==8) {
//            [self.sLabelArr replaceObjectAtIndex:index withObject:editVc.editText];
//            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:index inSection:0], nil] withRowAnimation:UITableViewRowAnimationNone];
//        }
//    }
}

-(void)chooseRightClick{
    dateView = [[DateSelectView alloc]initWithFrame:SCREEN_BOUNDS SelectDateTtitle:@"时间"];
    [dateView showDateView:^(NSString *selectStr) {
        rightLab.text = selectStr;
    }];
}
-(void)chooseLeftClick{
    dateView = [[DateSelectView alloc]initWithFrame:SCREEN_BOUNDS SelectDateTtitle:@"时间"];
    [dateView showDateView:^(NSString *selectStr) {
        leftLab.text = selectStr;
    }];
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
