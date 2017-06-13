//
//  AddFriendsViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/6/6.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "AddFriendsViewController.h"
#import "SGQRCode.h"
#import "LWActionSheetView.h"

@interface AddFriendsViewController ()<LWActionSheetViewDelegate>

@property (strong,nonatomic) UIView *backView;
@property (nonatomic ,strong) UIImageView *codeImage;

@property (strong,nonatomic) UIView *coverView;
@property (strong,nonatomic) UIView *ruleView;

@end

@implementation AddFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我的二维码";
    self.view.backgroundColor = HWColor(100, 100, 100);
    [self.view addSubview:self.backView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(saveCodePhoto)];
    
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : whiteC} forState:UIControlStateNormal];
    
    [self.ruleView addSubview:({
        UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        closeBtn.frame = CGRectMake(self.ruleView.width-35, 10, 25, 25);
        closeBtn.adjustsImageWhenHighlighted = NO;
        [closeBtn setImage:[UIImage imageNamed:@"rClose_gray"] forState:UIControlStateNormal];
        [closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
        closeBtn;
    })];
}

#pragma mark - LWActionSheetViewDelegate

-(void)saveCodePhoto
{
    
    LWActionSheetView* actionSheet = [[LWActionSheetView alloc]
                                      initTilesArray:@[@"保存到本地",@"取消"]
                                      delegate:self];
    [actionSheet show];
}

-(void)lwActionSheet:(LWActionSheetView *)actionSheet didSelectedButtonWithIndex:(NSInteger)index
{
    if (index == 0) {
        [self saveImageToPhotos:[self getImageFromView:self.backView]];
    }
}


#pragma mark - Save Photo

- (void)saveImageToPhotos:(UIImage*)savedImage {
    UIImageWriteToSavedPhotosAlbum(savedImage,
                                   self,
                                   @selector(image:didFinishSavingWithError:contextInfo:),
                                   NULL);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error
  contextInfo:(void *)contextInfo {
    NSString* msg = @"";
    msg = @"图片已保存到本地";
    [LWAlertView shoWithMessage:msg];
}

//将当前的view变成image
-(UIImage *)getImageFromView:(UIView *)vc
{
    //    UIGraphicsBeginImageContext(vc.bounds.size);
    UIGraphicsBeginImageContextWithOptions(vc.bounds.size, YES, vc.layer.contentsScale);
    [vc.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

-(UIView *)backView{
    if (!_backView) {
        _backView = [[UIView alloc]initWithFrame:CGRectMake(20, SCREEN_HEIGHT*0.14-32, SCREEN_WIDTH-40, SCREEN_HEIGHT*0.72)];
        _backView.backgroundColor = whiteC;
        
        [self initWithFrame];
    }
    return _backView;
}


//布局
-(void)initWithFrame{
    
    CGFloat distanceH = self.backView.width/12;
    
    //图像
    UIImageView *imgView = [UIImageView new];
    imgView.image = [UIImage imageNamed:@"classics.jpg"];
    [self.backView addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(25);
        make.top.mas_equalTo(distanceH);
        make.size.mas_equalTo(SubImageSize);
    }];
    
    //名字
    UILabel *nameLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self.backView];
    nameLab.text = @"大话西游";
    [nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imgView.mas_right).offset(leftToMargin);
        make.bottom.equalTo(imgView.mas_centerY).offset(-leftToMargin);
    }];
    
    //性别
    UIImageView *sexImg = [UIImageView new];
    sexImg.image = [UIImage imageNamed:@"femaleIcon"];
    [self.backView addSubview:sexImg];
    [sexImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLab.mas_right).offset(3);
        make.centerY.equalTo(nameLab);
        make.size.mas_equalTo(CGSizeMake(MTitleSize, MTitleSize));
    }];
    
    //使用细则
    UIButton *ruleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [ruleBtn setTitle:@"使用细则" forState:UIControlStateNormal];
    ruleBtn.titleLabel.font = [UIFont systemFontOfSize:subTitleSize];
    [ruleBtn setTitleColor:SecondTitleColor forState:UIControlStateNormal];
    [ruleBtn addTarget:self action:@selector(ruleBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.backView addSubview:ruleBtn];
    [ruleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(nameLab);
        make.right.mas_equalTo(-topToMargin);
    }];
    
    //地址
    UILabel *addressLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:MTitleSize Sview:self.backView];
    addressLab.text = @"西安市";
    [addressLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLab);
        make.top.equalTo(imgView.mas_centerY).offset(leftToMargin);
    }];
    
    // 1、借助UIImageView显示二维码
    UIImageView *codeView = [[UIImageView alloc] init];
    [self.backView addSubview:codeView];
    [codeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.backView);
        make.top.equalTo(imgView.mas_bottom).offset(distanceH);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.5, SCREEN_WIDTH*0.5));
    }];
    
    // 2、将最终合得的图片显示在UIImageView上
    codeView.image = [SGQRCodeTool SG_generateWithLogoQRCodeData:@"http://weixin.qipintong.com" logoImageName:@"codeLogo" logoScaleToSuperView:0.3];
    
    UILabel *subLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:MTitleSize Sview:self.backView];
    subLab.text = @"扫一扫企聘通二维码,加我好友";
    [subLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.backView);
        make.top.mas_equalTo(codeView.mas_bottom).offset(distanceH);
    }];
    
    //三条灰线
    UIView *fv = [UIView new];
    fv.backgroundColor = grayC;
    [self.backView addSubview:fv];
    [fv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView);
        make.top.equalTo(subLab.mas_bottom).offset(distanceH);
        make.size.mas_equalTo(CGSizeMake(self.backView.width, 1));
    }];
    UIView *vv = [UIView new];
    vv.backgroundColor = grayC;
    [self.backView addSubview:vv];
    [vv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.backView);
        make.top.equalTo(fv).offset(leftToMargin);
        make.size.mas_equalTo(CGSizeMake(1, 60));
    }];
    UIView *sv = [UIView new];
    sv.backgroundColor = grayC;
    [self.backView addSubview:sv];
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(vv.mas_bottom).offset(leftToMargin);
        make.left.equalTo(self.backView);
        make.size.mas_equalTo(fv);
    }];
    
    //人气
    UIImageView *eyeIcon = [UIImageView new];
    eyeIcon.image = [UIImage imageNamed:@"eyeIcon"];
    [self.backView addSubview:eyeIcon];
    [eyeIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(vv.mas_centerY).offset(-5);
        make.centerX.mas_equalTo(-self.backView.width/4);
        make.size.mas_equalTo(CGSizeMake(MTitleSize, MTitleSize));
    }];
    UILabel *popular = [UILabel labelWithTextColor:MainColor FontSize:subTitleSize Sview:self.backView];
    popular.text = @"人气 : 12";
    [popular mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(eyeIcon.mas_bottom).offset(5);
        make.centerX.equalTo(eyeIcon);
    }];
    
    //粉丝
    UIImageView *funsIcon = [UIImageView new];
    funsIcon.image = [UIImage imageNamed:@"gFans"];
    [self.backView addSubview:funsIcon];
    [funsIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(vv.mas_centerY).offset(-5);
        make.centerX.mas_equalTo(self.backView.width/4);
        make.size.equalTo(eyeIcon);
    }];
    UILabel *funsLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self.backView];
    funsLab.text = @"粉丝 : 3";
    [funsLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(funsIcon.mas_bottom).offset(5);
        make.centerX.equalTo(funsIcon);
    }];
}

//细则
-(void)ruleBtnClick{
    [UIView animateWithDuration:0.3 animations:^{
        [self.view addSubview:self.coverView];
    }];
}

-(void)closeBtnClick{
    [UIView animateWithDuration:0.3 animations:^{
        [self.coverView removeFromSuperview];
    }];
}

#pragma mark -------细则视图----------
-(UIView *)coverView{
    if (!_coverView) {
        _coverView = [[UIView alloc]initWithFrame:self.view.bounds];
        
        [_coverView addSubview:self.ruleView];
    }
    return _coverView;
}
-(UIView *)ruleView{
    if (!_ruleView) {
        _ruleView = [[UIView alloc]initWithFrame:CGRectMake(20, SCREEN_HEIGHT*0.14-32, SCREEN_WIDTH-40, SCREEN_HEIGHT*0.72)];
        _ruleView.backgroundColor = whiteC;
        
        CGFloat distanceH = _ruleView.height/28;
        
        UILabel *title = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize+1 Sview:_ruleView];
        title.text = @"使用细则";
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_ruleView);
            make.top.mas_equalTo(distanceH*1.3);
        }];
        UIView *vv = [UIView new];
        vv.backgroundColor = grayC;
        [_ruleView addSubview:vv];
        [vv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_ruleView);
            make.top.equalTo(title.mas_bottom).offset(distanceH);
            make.size.mas_equalTo(CGSizeMake(_ruleView.width-20, 1));
        }];
        
        /////
        UILabel *first = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize+1 Sview:_ruleView];
        first.text = @"1、";
        [first mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(vv.mas_bottom).offset(distanceH*1.3);
            make.left.mas_equalTo(topToMargin);
        }];
        UILabel *firstLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize+1 Sview:_ruleView];
        firstLab.numberOfLines = 0;
        firstLab.attributedText = [self attributedString:@"请将企聘通“我的二维码”发送至微信好友或让好友微信扫一扫；"];
        [firstLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(first.mas_right);
            make.top.equalTo(first);
            make.width.mas_equalTo(_ruleView.width-45);
        }];
        
        //////
        UILabel *second = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize+1 Sview:_ruleView];
        second.text = @"2、";
        [second mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(firstLab.mas_bottom).offset(distanceH);
            make.left.equalTo(first);
        }];
        UILabel *secondLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize+1 Sview:_ruleView];
        secondLab.numberOfLines = 0;
        secondLab.attributedText = [self attributedString:@"请好友添加关注后，打开平台推送的助我升级邀请，即可获得10个通币；"];
        [secondLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(firstLab);
            make.top.equalTo(second);
            make.width.equalTo(firstLab);
        }];
        
        //////
        UILabel *three = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize+1 Sview:_ruleView];
        three.text = @"3、";
        [three mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(secondLab.mas_bottom).offset(distanceH);
            make.left.equalTo(second);
        }];
        UILabel *threeLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize+1 Sview:_ruleView];
        threeLab.numberOfLines = 0;
        threeLab.attributedText = [self attributedString:@"10个通币，即“钱包”收入1元；"];
        [threeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(firstLab);
            make.top.equalTo(three);
            make.width.equalTo(firstLab);
        }];
        
        //////
        UILabel *four = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize+1 Sview:_ruleView];
        four.text = @"4、";
        [four mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(threeLab.mas_bottom).offset(distanceH*0.5);
            make.left.equalTo(second);
        }];
        UILabel *fourLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize+1 Sview:_ruleView];
        fourLab.numberOfLines = 0;
        fourLab.attributedText = [self attributedString:@"添加好友的数量不限，通币送不停多加多赚;"];
        [fourLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(firstLab);
            make.top.equalTo(four);
            make.width.equalTo(firstLab);
        }];
        
        //////
        UILabel *five = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize+1 Sview:_ruleView];
        five.text = @"5、";
        [five mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(fourLab.mas_bottom).offset(distanceH*0.5);
            make.left.equalTo(second);
        }];
        UILabel *fiveLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize+1 Sview:_ruleView];
        fiveLab.numberOfLines = 0;
        fiveLab.attributedText = [self attributedString:@"“钱包”的收入可提现至微信零钱包；"];
        [fiveLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(firstLab);
            make.top.equalTo(five);
            make.width.equalTo(firstLab);
        }];
        
        //////
        UILabel *six = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize+1 Sview:_ruleView];
        six.text = @"6、";
        [six mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(fiveLab.mas_bottom).offset(distanceH*0.5);
            make.left.equalTo(second);
        }];
        UILabel *sixLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize+1 Sview:_ruleView];
        sixLab.numberOfLines = 0;
        sixLab.attributedText = [self attributedString:@"“钱包”的收入可直接转入“币斗”赚取收益，多存多收益；"];
        [sixLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(firstLab);
            make.top.equalTo(six);
            make.width.equalTo(firstLab);
        }];
        
        //////
        UILabel *seven = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize+1 Sview:_ruleView];
        seven.text = @"7、";
        [seven mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(sixLab.mas_bottom).offset(distanceH);
            make.left.equalTo(second);
        }];
        UILabel *sevenLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize+1 Sview:_ruleView];
        sevenLab.numberOfLines = 0;
        sevenLab.attributedText = [self attributedString:@"“钱包”的收入可在平台的商家消费支付；"];
        [sevenLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(firstLab);
            make.top.equalTo(seven);
            make.width.equalTo(firstLab);
        }];
        
        //////
        UILabel *eight = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize+1 Sview:_ruleView];
        eight.text = @"8、";
        [eight mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(sevenLab.mas_bottom).offset(distanceH*0.5);
            make.left.equalTo(second);
        }];
        UILabel *eightLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize+1 Sview:_ruleView];
        eightLab.numberOfLines = 0;
        eightLab.attributedText = [self attributedString:@"所有解释权归企聘通公司所有。"];
        [eightLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(firstLab);
            make.top.equalTo(eight);
            make.width.equalTo(firstLab);
        }];
        
    }
    return _ruleView;
}


//行间距
-(NSMutableAttributedString *)attributedString:(NSString *)testString{
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:testString];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:10];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [testString length])];
    
    return attributedString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
