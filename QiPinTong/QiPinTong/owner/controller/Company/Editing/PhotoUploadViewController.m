//
//  PhotoUploadViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/4/8.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "PhotoUploadViewController.h"

@interface PhotoUploadViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *tableView;

@property (strong,nonatomic) UIView *headerView;
@property (strong,nonatomic) UIView *footerView;

@property (strong,nonatomic) UIImageView *imgViewF;
@property (strong,nonatomic) UIImageView *imgViewS;

@end

@implementation PhotoUploadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"基础资料";

    [self.view addSubview:self.tableView];
    
}

#pragma mark /--------headerView--------/
-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
        _headerView.backgroundColor = blueC;
        
        UILabel *title = [UILabel labelWithTextColor:whiteC FontSize:MTitleSize Sview:_headerView];
        title.text = @"图片上传";
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(leftToMargin);
            make.centerY.equalTo(_headerView);
        }];
        
        UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [closeBtn setImage:[UIImage imageNamed:@"error_white"] forState:UIControlStateNormal];
        [closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_headerView addSubview:closeBtn];
        [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-leftToMargin);
            make.centerY.equalTo(title);
            make.size.mas_equalTo(CGSizeMake(MTitleSize, MTitleSize));
        }];
    }
    return _headerView;
}

-(void)closeBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark ---------footerView-----------
-(UIView *)footerView{
    if (!_footerView) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"确定" forState:UIControlStateNormal];
        btn.backgroundColor = blueC;
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 3;
        [btn addTarget:self action:@selector(confirmBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [_footerView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.and.centerX.equalTo(_footerView);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, formBtnHeight));
        }];
    }
    return _footerView;
}

-(void)confirmBtnAction{
    HWLog(@"确定");
    
}

#pragma mark /--------tableView--------/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height = self.headerView.height;
        _tableView.tableFooterView = self.footerView;
        _tableView.tableFooterView.height = self.footerView.height;
        _tableView.separatorStyle = NO;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SubCellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PhotoUploadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cia"];
    if (cell == nil) {
        cell = [[PhotoUploadTableViewCell alloc]initWithFrame:cell.bounds];
        cell.titleLab.attributedText = [self attributedStr:indexPath.row==0?@"企业LOGO":@"形象墙"];
        cell.imgView.image = [UIImage imageNamed: @"camera_icon"];
        if (indexPath.row==0) {
            self.imgViewF = cell.imgView;
        }else{
            self.imgViewS = cell.imgView;
        }
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [BDImagePicker showImagePickerFromViewController:self allowsEditing:YES finishAction:^(UIImage *image) {
        if (image) {
//            NSData *data = UIImageJPEGRepresentation(image, 1.0f);
//            NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
            if (indexPath.row==0) {
                self.imgViewF.image = image;
            }else{
                self.imgViewS.image = image;
            }
        }
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
