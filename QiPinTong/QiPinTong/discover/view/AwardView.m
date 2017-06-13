//
//  AwardView.m
//  QiPinTong
//
//  Created by mac on 2017/3/14.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "AwardView.h"



@interface AwardView()

@property(nonatomic,strong) UIView *backgroundVi;
@property(nonatomic,strong) UIView *bgVc;
@property (nonatomic,strong) UITextField *textField;


@property (nonatomic,strong) UIImageView *popView;//弹窗view

//动画时长
@property (nonatomic ,assign) CGFloat keyAnimationDuration;
    
@property (nonatomic,strong) SKPopAnimationManage *animationManager;


@end

@implementation AwardView

-(instancetype)initWithHeaderImage:(NSURL *)imageUrl andName:(NSString *)name delegate:(id <AwardViewDelegate>)delegate completion:(SKPopViewChooseCompletion)completion
{
    self = [super init];
    if (self) {
        
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        
        self.delegate = delegate;
        
        self.completion = completion;
        
        [self createViewWithImageStr:imageUrl name:name];
        
        [KEYWINDOW addSubview:self];//把视图添加到当前的窗口；
        
        //检测键盘的弹出
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
        
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self.textField];
    }
    
    return self;
}




-(void)createViewWithImageStr:(NSURL *)imageStr name:(NSString *)name
{
    // 灰色背景
    UIImageView * grayBackground = [UIImageView new];
    [self addSubview:grayBackground];
    grayBackground.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.5];;
    grayBackground.userInteractionEnabled = YES;
    [grayBackground mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    UITapGestureRecognizer * dismissGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelAward)];
    [grayBackground addGestureRecognizer:dismissGesture];
    
    
    //弹出窗口
    UIImageView *imageV = [[UIImageView alloc]init];
    self.popView = imageV;
    [self insertSubview:self.popView aboveSubview:grayBackground];
    imageV.image = [UIImage imageNamed:@"awardBackbg"];
    imageV.userInteractionEnabled = YES;
    imageV.layer.masksToBounds = YES;
    imageV.layer.cornerRadius = 8.0f;
    [self addSubview:imageV];
    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.center.equalTo(self);
        
        make.left.equalTo(self).with.offset(60);
        make.right.equalTo(self).with.offset(-60);
        make.height.mas_offset(SCREEN_HEIGHT/3+40);
        
    }];
    
    
    //头像
    UIImageView *headerImg = [[UIImageView alloc]init];
    
    headerImg.layer.masksToBounds = YES;
    headerImg.layer.borderWidth = 1.0f;
    headerImg.layer.borderColor = [[UIColor redColor] CGColor];
    headerImg.layer.cornerRadius = 4.0f;
    
    [headerImg sd_setImageWithURL:imageStr placeholderImage:[UIImage imageNamed:@"zwListImage.jpg"]];
    [imageV addSubview:headerImg];
    [headerImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.mas_equalTo(16);
        
        make.width.mas_equalTo(66);
        make.height.mas_equalTo(60);
    }];
    
    
    //name
    
    if ([name isEqualToString:@""]) {
        name = @"企聘通粉丝";
    }
    UILabel *lab = [[UILabel alloc]init];
    lab.textColor = deepRed;
    lab.font = [UIFont systemFontOfSize:subTitleSize];
    lab.backgroundColor = clearC;
    lab.textAlignment = NSTextAlignmentCenter;
    lab.text = name;
    [imageV addSubview:lab];
    
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(self);
        make.top.equalTo(headerImg.mas_bottom).offset(10);
        make.width.mas_equalTo(SCREEN_WIDTH-160);
//        make.size.mas_equalTo(CGSizeMake(imageV.width-40, 30));
        
    }];
    
    
    
    //关闭按钮
    
    UIImageView *closeImg = [[UIImageView alloc]init];
    closeImg.image = [UIImage imageNamed:@"cancel_icon"];
    UITapGestureRecognizer *closeTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeTap:)];
    closeImg.userInteractionEnabled = YES;
    [closeImg addGestureRecognizer:closeTap];
    [imageV addSubview:closeImg];
    
    [closeImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageV).with.offset(5);
        
        make.right.equalTo(imageV).with.offset(-5);
        
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
        
        
    }];
    
    
    
    UITextField *textF = [[UITextField alloc]init];
    textF.text = @"10";
    textF.textAlignment = NSTextAlignmentCenter;
    textF.backgroundColor = clearC;
    textF.keyboardType = UIKeyboardTypeNumberPad;
    textF.font = [UIFont fontWithName:@"HiraKakuProN-W6" size:24];
    textF.textColor = grayOragin;
    //    textF.editing = NO;
    self.textField = textF;
    [imageV addSubview:textF];
    
    [textF mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.equalTo(imageV);
        make.topMargin.equalTo(lab).with.offset(30);
        
        make.left.equalTo(headerImg);
        make.right.equalTo(headerImg);
        make.height.mas_equalTo(40);
        
        
    }];
    
    
    
    UILabel *numLab = [[UILabel alloc]initWithFrame:CGRectMake(textF.right, textF.botoom-25, 20, 20) andTextColor:grayOragin andTextFont:MTitleSize];
    numLab.backgroundColor = clearC;
    numLab.text = @"个";
    numLab.font = [UIFont fontWithName:@"TrebuchetMS-Italic" size:15];
    [imageV addSubview:numLab];
    [numLab mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(textF).with.offset(66);
        
        make.centerY.equalTo(textF).with.offset(5);
        
        make.width.mas_equalTo(20);
        
        
    }];
    //修改数量
    UIButton *changeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [changeBtn setTitle:@"修改数量" forState:UIControlStateNormal];
    changeBtn.frame = CGRectMake(headerImg.left, textF.botoom+5, headerImg.width, 20);
    changeBtn.titleLabel.font = [UIFont systemFontOfSize:MTitleSize];
    [changeBtn setTitleColor:deepRed forState:UIControlStateNormal];
    [changeBtn addTarget:self action:@selector(changeClick) forControlEvents:UIControlEventTouchUpInside];
    [imageV addSubview:changeBtn];
    
    
    [changeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(imageV);
        
        make.bottomMargin.equalTo(imageV).with.offset(-90);
        make.width.equalTo(headerImg);
        make.height.mas_equalTo(20);
        
        
        
    }];
    
    
    
    //赏通币233,70,88
    UIButton *awardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [awardBtn setTitle:@"赏通币" forState:UIControlStateNormal];
    [awardBtn setTitleColor:HWColor(233, 70, 88) forState:UIControlStateNormal];
    awardBtn.backgroundColor = grayOragin;
    awardBtn.layer.masksToBounds = YES;
    awardBtn.layer.cornerRadius = 4;
    awardBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [awardBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [awardBtn addTarget:self action:@selector(awardClick) forControlEvents:UIControlEventTouchUpInside];
    [imageV addSubview:awardBtn];
    
    [awardBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(imageV);
        make.bottomMargin.equalTo(imageV).with.offset(-20);
        
        make.right.equalTo(imageV).with.offset(-20);
        make.left.equalTo(imageV).with.offset(20);
        
        make.height.mas_equalTo(45);
        
    }];
    
    
}

//关闭视图

#pragma mark  -----取消打赏&&打赏

-(void)closeTap:(UITapGestureRecognizer *)tap
{
    HWLog(@"关闭");
    [self dismissAnimation];
    
}

//打赏
-(void)awardClick
{
    
    HWLog(@"打赏");
    
    if (_delegate && [_delegate respondsToSelector:@selector(didAwardCoinNum:)]) {
        
        [_delegate didAwardCoinNum:[self.textField.text integerValue]];
    }
    
}

//修改数量

-(void)changeClick
{
    HWLog(@"修改数量");
    
    [self.textField becomeFirstResponder];
    self.textField.text = @"";
    
}




#pragma mark -----取消手势
-(void)cancelAward
{
    
    HWLog(@"取消");
    [self dismissAnimation];
}

#pragma mark-----外部调用
//消失
-(void)dismiss
{
    if (self.enableAnimation == YES) {
        
        [self dismissAnimation];
    }else
    {
        [self removeFromSuperview];
    }
    
    
}
//展示
-(void)show
{
    if (self.enableAnimation == YES) {
        [self displayAnimation];
    }
}

//取消打赏
-(void) dismissAnimation
{
    if (self.enableAnimation == YES) {
        
        [self.animationManager dismissAnimationForRootView:self];
        
    }else
    {
        [self removeFromSuperview];
    }
}

#pragma mark ----动画配置
- (void)displayAnimation
{
    self.animationManager = [[SKPopAnimationManage alloc] init];
    switch (self.animationType) {
        case SK_TYPE_SPRING:
            self.animationManager.type = SK_ANIMATION_TYPE_SPRING;
            break;
        case SK_TYPE_ROTATION:
            self.animationManager.type = SK_ANIMATION_TYPE_ROTATION;
            break;
        case SK_TYPE_FADE:
            self.animationManager.type = SK_ANIMATION_TYPE_FADE;
            break;
        case SK_TYPE_LARGEN:
            self.animationManager.type = SK_ANIMATION_TYPE_LARGEN;
            break;
        case SK_TYPE_ROTATION_LARGEN:
            self.animationManager.type = SK_ANIMATION_TYPE_ROTATION_LARGEN;
            break;
        case SK_TYPE_TRANSFORMATION:
            self.animationManager.type = SK_ANIMATION_TYPE_TRANSFORMATION;
            break;
    }
    
    switch (self.animationDirection) {
        case SK_SUBTYPE_FROMRIGHT:
            self.animationManager.animationDirection = SK_ANIMATION_SUBTYPE_FROMRIGHT;
            break;
        case SK_SUBTYPE_FROMLEFT:
            self.animationManager.animationDirection = SK_ANIMATION_SUBTYPE_FROMLEFT;
            break;
        case SK_SUBTYPE_FROMTOP:
            self.animationManager.animationDirection = SK_ANIMATION_SUBTYPE_FROMTOP;
            break;
            
        case SK_SUBTYPE_FROMBOTTOM:
            self.animationManager.animationDirection = SK_ANIMATION_SUBTYPE_FROMBOTTOM;
            break;
            
        case SK_SUBTYPE_FROMCENTER:
            self.animationManager.animationDirection = SK_ANIMATION_SUBTYPE_FROMCENTER;
            break;
            
            
        default:
            break;
    }
    
    [self.animationManager animateWithView:self.popView Duration:self.animationDuration animationType:self.animationManager.type animationDirection:self.animationManager.animationDirection];
}



#pragma mark --------监听收键盘的动作

-(void)keyBoardWillChangeFrame:(NSNotification *)notification
{
    //获取键盘的frame
//    CGRect keyboardFrame = [notification.userInfo [UIKeyboardIsLocalUserInfoKey] CGRectValue];
    
//    CGFloat keyBoardHeight = keyboardFrame.size.height;
    
    CGFloat keyboardAnimationDuration = [notification.userInfo [UIKeyboardAnimationCurveUserInfoKey] floatValue];
    
    self.keyAnimationDuration = keyboardAnimationDuration;
    
    NSInteger option = [notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue];
    
    
    [UIView animateWithDuration:self.keyAnimationDuration delay:0 options:option animations:^{
        
        self.popView.y = self.centerY-200;
        
        
        
    } completion:nil];
    
    
    
    
}


@end
