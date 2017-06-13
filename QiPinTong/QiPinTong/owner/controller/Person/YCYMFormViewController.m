//
//  YCYMFormViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/1/16.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "YCYMFormViewController.h"

@interface YCYMFormViewController ()<UITableViewDelegate,UITableViewDataSource,EditingControllerBackStringDelegate,UIGestureRecognizerDelegate>

@property (strong,nonatomic) UITableView *tableView;

@property (strong,nonatomic) NSMutableArray *titleArray;

@property (strong,nonatomic) NSMutableArray *sLabelArray;

@property (strong,nonatomic) UIView *footerView;

@end

@implementation YCYMFormViewController
id ycfCell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"有才有貌";
    
    [self.view addSubview:self.tableView];
    
    self.titleArray = [NSMutableArray arrayWithObjects:@"姓名",@"性别",@"身高",@"体型",@"出生年月",@"婚姻状况",@"个人相册",nil];
    
    self.sLabelArray = [NSMutableArray arrayWithObjects:@"请填写",@"",@"请填写",@"请选择",@"请选择",@"请选择",@"请上传职业照/生活照(不少于3张)", nil];
    
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

#pragma mark /--------footerView--------/
-(UIView *)footerView{
    if (!_footerView) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"保存" forState:UIControlStateNormal];
        btn.backgroundColor = blueC;
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 3;
        [btn addTarget:self action:@selector(ycymBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [_footerView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.and.centerX.equalTo(_footerView);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, formBtnHeight));
        }];
    }
    return _footerView;
}

//发布按钮跳转
-(void)ycymBtnAction{
    HWLog(@"发布");
    
}

#pragma mark /--------tableView--------/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = NO;
        _tableView.tableFooterView = self.footerView;
        _tableView.tableFooterView.height = self.footerView.height;
        _tableView.sectionFooterHeight = 0;
        _tableView.backgroundColor = whiteC;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.titleArray.count;
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
    
    YCYMFormTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ce"];
    cell = [[YCYMFormTableViewCell alloc]initWithFrame:cell.bounds];
    ycfCell = cell;
    cell.selectLabel.text = self.sLabelArray[indexPath.row];
    
    if (indexPath.row==1) {
        SexSelectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cia"];
        cell = [[SexSelectTableViewCell alloc]initWithFrame:cell.bounds];
        ycfCell = cell;
        cell.titleLab.text = @"   性别";
        [cell.switchBtn addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    }else{
        cell.titleLabel.attributedText = [self attributedStr: self.titleArray[indexPath.row]];
    }
    
    return ycfCell;
}

-(void)switchValueChanged:(UISwitch *)sender{
    if (sender.isOn) {
        HWLog(@"on");
    }else{
        HWLog(@"off");
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0||indexPath.row == 2) {
        EditingController *editVc = [[EditingController alloc]init];
        editVc.kindTitle = self.titleArray[indexPath.row];
        editVc.selectIndex = indexPath.row;
        editVc.delegate = self;
        
        MainNavigationController *vc = [[MainNavigationController alloc]initWithRootViewController:editVc];
        [self presentViewController:vc animated:YES completion:nil];
    }
    
    if (indexPath.row==4) {
        DateSelectView *date = [[DateSelectView alloc]initWithFrame:SCREEN_BOUNDS SelectDateTtitle:@"时间"];
        [date showDateView:^(NSString *selectStr) {
            [self.sLabelArray replaceObjectAtIndex:indexPath.row withObject:selectStr];
            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:indexPath.row inSection:0], nil] withRowAnimation:UITableViewRowAnimationNone];
        }];
    }
    if (indexPath.row==3||indexPath.row==5) {
        NSArray *bodyAry = @[@"胖子",@"匀称",@"瘦子",@"微胖",@"微瘦"];
        NSArray *stateAry = @[@"未婚",@"已婚",@"离异",@"再婚"];
        SingleSelectView *single = [[SingleSelectView alloc]initWithFrame:SCREEN_BOUNDS SelectTtitle:self.titleArray[indexPath.row] TitleArr:indexPath.row==3?bodyAry:stateAry];
        [single showView:^(NSString *singleStr) {
            [self.sLabelArray replaceObjectAtIndex:indexPath.row withObject:singleStr];
            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:indexPath.row inSection:0], nil] withRowAnimation:UITableViewRowAnimationNone];
        }];
        
    }
    
    else{
        
    }
    
}


-(void)backStringToComeViewWith:(EditingController *)editVc andTag:(NSInteger)index{
//    if (index==0||index==2) {
//        if (![editVc.editText isEqualToString:@""]) {
//            [self.sLabelArray replaceObjectAtIndex:index withObject:editVc.editText];
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
