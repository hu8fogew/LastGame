//
//  SendPostFormViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/3/4.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "SendPostFormViewController.h"

@interface SendPostFormViewController ()<UITableViewDataSource,UITableViewDelegate,EditingControllerBackStringDelegate>

@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) UIView *footerView;

@end

@implementation SendPostFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"职位管理";
    
    [self.view addSubview:self.tableView];
    
}

#pragma mark /--------footerView--------/
-(UIView *)footerView{
    if (!_footerView) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"保存" forState:UIControlStateNormal];
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

//发布按钮跳转
-(void)btnAction{
    HWLog(@"保存");
}

#pragma mark /--------tableView--------/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView= [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = NO;
        _tableView.backgroundColor = whiteC;
        _tableView.sectionFooterHeight = 0;
        _tableView.tableFooterView = self.footerView;
        _tableView.tableFooterView.height = self.footerView.height;
    }
    return _tableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 2;
            break;
        case 2:
            return 4;
            break;
        case 3:
            return 2;
            break;
        default:
            return 3;
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return formCellHeight;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, topToMargin)];
    vi.backgroundColor = grayC;
    
    return vi;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return topToMargin;
    }
    return leftToMargin;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YCYMFormTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cia"];
    cell = [[YCYMFormTableViewCell alloc]initWithFrame:cell.bounds];
    if (indexPath.section==0) {
        cell.selectLabel.text = @"请填写";
        cell.titleLabel.attributedText = [self attributedStr:@"职位名称"];
    }
    else if (indexPath.section==1) {
        cell.titleLabel.attributedText = [self attributedStr: @[@"职位性质",@"职位类别"][indexPath.row] ];
        cell.selectLabel.text = @[@"请选择",@"请选择"][indexPath.row];
    }
    else if (indexPath.section==2){
        if (indexPath.row==3) {
            cell.titleLabel.text = @"   福利待遇";
        }else{
            cell.titleLabel.attributedText = [self attributedStr:@[@"工作经验",@"学历要求",@"月薪范围"][indexPath.row]];
        }
        cell.selectLabel.text = @[@"请选择",@"请选择",@"请选择",@"请选择"][indexPath.row];
    }
    else if (indexPath.section==3){
        if (indexPath.row==0) {
            cell.titleLabel.attributedText = [self attributedStr:@"职位描述"];
        }else{
            cell.titleLabel.text = @"   任职要求";
        }
        cell.selectLabel.text = @[@"请填写",@"请填写"][indexPath.row];
    }
    else{
        if (indexPath.row==1) {
            cell.titleLabel.attributedText = [self attributedStr:@"工作城市"];
        }else{
            cell.titleLabel.text = indexPath.row==0?@"   招聘人数":@"   工作地点";
        }
        cell.selectLabel.text = @[@"请填写",@"请选择",@"请填写"][indexPath.row];
    }
    
    return cell;
}

//红色星星✨
-(NSMutableAttributedString *)attributedStr:(NSString *)str{
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:[@"* "stringByAppendingString:str]];
    [attributedStr addAttribute:NSForegroundColorAttributeName value:redC range:NSMakeRange(0, 1)];
    return attributedStr;
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    if (indexPath.row==0||indexPath.row==7||indexPath.row==8||indexPath.row==9||indexPath.row==11) {
//        EditingController *editVc = [[EditingController alloc]init];
//        editVc.kindTitle = self.titleAry[indexPath.row];
//        editVc.selectIndex = indexPath.row;
//        editVc.delegate = self;
//
//        MainNavigationController *vc = [[MainNavigationController alloc]initWithRootViewController:editVc];
//        [self presentViewController:vc animated:YES completion:nil];
//    }
//    if (indexPath.row==1||indexPath.row==3||indexPath.row==4||indexPath.row==5) {
//        NSArray *zwAry = @[@"全职",@"兼职",@"实习"];
//        NSArray *workAry = @[@"1年",@"2年",@"3-5年",@"5-8年",@"8-10年",@"10年以上"];
//        NSArray *eduAry = @[@"初中",@"高中",@"中专",@"大专",@"本科",@"硕士",@"MBA EMBA",@"博士",@"其他"];
//        NSArray *salaryAry = @[@"1-2k",@"2-3k",@"3-5k",@"5-8k",@"8-10k",@"10-12k",@"12-15k",@"15k以上"];
//        NSArray *array = [NSArray arrayWithObjects:zwAry,@[],workAry,eduAry,salaryAry, nil];
//        SingleSelectView *single = [[SingleSelectView alloc]initWithFrame:SCREEN_BOUNDS SelectTtitle:self.titleAry[indexPath.row] TitleArr:array[indexPath.row-1]];
//        [single showView:^(NSString *singleStr) {
//            [self.sLabAry replaceObjectAtIndex:indexPath.row withObject:[NSString stringWithFormat:@"%@",singleStr]];
//            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:indexPath.row inSection:0], nil] withRowAnimation:UITableViewRowAnimationNone];
//        }];
//    }
//
//}


-(void)backStringToComeViewWith:(EditingController *)editVc andTag:(NSInteger)index{
//    if (index==0||index==7||index==8||index==9||index==11){
//        if (![editVc.editText isEqualToString:@""]) {
//            [self.sLabAry replaceObjectAtIndex:index withObject:editVc.editText];
//            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:index inSection:0], nil] withRowAnimation:UITableViewRowAnimationNone];
//        }
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
