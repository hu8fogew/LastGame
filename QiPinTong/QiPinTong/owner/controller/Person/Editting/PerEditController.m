//
//  PersonEditController.m
//  QiPinTong
//
//  Created by mac on 2017/2/15.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "PerEditController.h"

@interface PerEditController ()<UITableViewDelegate,UITableViewDataSource,EditingControllerBackStringDelegate,UIGestureRecognizerDelegate>

@property (nonatomic,strong) UITableView *tableView;


@property (strong,nonatomic) UIView *footerView;

//图像
@property (strong,nonatomic) UIImageView *imgView;

@end

@implementation PerEditController

id editCell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"编辑";
    self.view.backgroundColor = whiteC;
    [self.view addSubview:self.tableView];
    
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


#pragma mark --------*footerView*----------
-(UIView *)footerView{
    if (!_footerView) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
        
        UIButton *scanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        scanBtn.backgroundColor = HWColor(245, 245, 245);
        [scanBtn setTitle:@"简历预览" forState:UIControlStateNormal];
        [scanBtn setTitleColor:MainColor forState:UIControlStateNormal];
        scanBtn.layer.masksToBounds = YES;
        scanBtn.layer.cornerRadius = 3;
        scanBtn.layer.borderColor = HWColor(225, 225, 225).CGColor;
        scanBtn.layer.borderWidth = 1;
        [scanBtn addTarget:self action:@selector(scanBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_footerView addSubview:scanBtn];
        [scanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.and.bottom.equalTo(_footerView);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, formBtnHeight));
        }];
    }
    return _footerView;
}
//简历预览按钮跳转
-(void)scanBtnClick{
    ResumeScanViewController *vc = [ResumeScanViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark 、--------tableView----------、
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = NO;
        _tableView.backgroundColor = whiteC;
        
        _tableView.tableFooterView = self.footerView;
        _tableView.tableFooterView.height = self.footerView.height;
    }
    return _tableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
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
    return 5;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, leftToMargin)];
    vi.backgroundColor = grayC;
    
    return vi;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 2) {
        return leftToMargin;
        
    }
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
        
        return SubCellHeight;
    }
    else{
        return formCellHeight;
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EditFirstTableViewCell *fCell = [tableView dequeueReusableCellWithIdentifier:@"cia"];
    YCYMFormTableViewCell *sCell = [tableView dequeueReusableCellWithIdentifier:@"ca"];
    if (indexPath.section == 0) {
        fCell = [[EditFirstTableViewCell alloc]initWithFrame:fCell.bounds];
        editCell = fCell;
        [fCell.imgView sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"classics.jpg"]];
        self.imgView = fCell.imgView;
        fCell.nameLabel.text = @"苗仔";
        fCell.changeLab.text = @"更换头像";
        fCell.sexImage.image = [UIImage imageNamed:@"femaleIcon"];
    }
    else{
        sCell = [[YCYMFormTableViewCell alloc]initWithFrame:sCell.bounds];
        editCell = sCell;
        sCell.titleLabel.text = indexPath.section==1?@"基础资料":@"编辑简历";;
    }
    
    return editCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section==0) {
        [BDImagePicker showImagePickerFromViewController:self allowsEditing:YES finishAction:^(UIImage *image) {
            if (image) {
                self.imgView.image = image;
            }
        }];
    }
    else{
        BasicDataViewController *basicVC = [BasicDataViewController new];
        EditResumeViewController *editVC = [EditResumeViewController new];
        [self.navigationController pushViewController:indexPath.section==1?basicVC:editVC animated:YES];
    }
    
}

-(void)backStringToComeViewWith:(EditingController *)editVc andTag:(NSInteger)index{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
