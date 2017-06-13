//
//  DiscoverHeaderView.m
//  QiPinTong
//
//  Created by mac on 2017/3/14.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "DiscoverHeaderView.h"
#import "NSString+Extension.h"

@interface DiscoverHeaderView()<LWAsyncDisplayViewDelegate>
@property(nonatomic,strong)LWAsyncDisplayView *asyncView;
@property (strong ,nonatomic) UIImageView *loadingView;

//@property (nonatomic,strong) UIButton *editButton;

@end

@implementation DiscoverHeaderView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = whiteC;
        
        [self createHeaderView];
        
    }
    return self;
}



-(void)lwAsyncDisplayView:(LWAsyncDisplayView *)asyncDisplayView didCilickedImageStorage:(LWImageStorage *)imageStorage touch:(UITouch *)touch
{
    NSInteger tag = imageStorage.tag;
    if (imageStorage.tag == 1001) {
        if (self.clickedImageCallback) {
            self.clickedImageCallback(self,tag);
            
        }
        [LWAlertView shoWithMessage:@"背景图"];
    }
    if (imageStorage.tag == 1002) {
        
        [LWAlertView shoWithMessage:@"头像"];
    }
    
    
}


-(void)createHeaderView
{
    
    
    
    UITapGestureRecognizer *tapGest = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickImageAction:)];
    
    UITapGestureRecognizer *tapBgGest = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickBgImageAction:)];
    
    //背景
    UIImageView *bg = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, - 100.0f, SCREEN_WIDTH, 350)];
    self.bgImageVc = bg;
    bg.userInteractionEnabled = YES;
    bg.tag = 105;
    [bg sd_setImageWithURL:[NSURL URLWithString:@"http://ww2.sinaimg.cn/mw690/5f13f24ajw1f2hc1r6j47j20dc0dc0t4.jpg"] placeholderImage:[UIImage imageNamed:@"Qpt_icon"]];
    [bg addGestureRecognizer:tapBgGest];
    [self addSubview:bg];
    
    
    //头像
    
    UIImageView *avtar = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 90.0f, 250.0f - 55.0f, 78.0f, 78.0f)];
    
    
    
    avtar.layer.cornerRadius = 39.0f;
    
    avtar.layer.borderColor = [whiteC CGColor];
    
    avtar.layer.borderWidth = 2.0f;
    avtar.layer.masksToBounds = YES;
    
    [avtar sd_setImageWithURL:[NSURL URLWithString:@"http://tp2.sinaimg.cn/2185608961/50/5714822219/0"] placeholderImage:[UIImage imageNamed:@"Qpt_icon"]];
    
    avtar.tag = 102;
    
    avtar.userInteractionEnabled = YES;
    
    [avtar addGestureRecognizer:tapGest];
    
    [self addSubview:avtar];
    
    
    
    NSString *strName = @"会飞的毛毛虫";
    CGSize size = [strName sizeWithFont:[UIFont systemFontOfSize:mainTitleSize] maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
    
    
    
    UILabel *labName = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-110.0f-size.width, 250-15-size.height, size.width, size.height) andTextColor:whiteC andTextFont:mainTitleSize];
    
    labName.shadowColor = SecondTitleColor;
    
    labName.shadowOffset = CGSizeMake(0, 1.0);
    
    labName.font = [UIFont systemFontOfSize:mainTitleSize weight:UIFontWeightBold];
    
    labName.text = strName;
    labName.backgroundColor = clearC;
    [self addSubview:labName];
    
    [self addSubview:self.loadingView];
    
}


#pragma mark ______action

-(void)clickImageAction:(UITapGestureRecognizer *)tap
{
    
//    [LWAlertView shoWithMessage:@"会飞的毛毛虫"];
    
    if (_delegate && [_delegate respondsToSelector:@selector(clickHeaderImageAction)]) {
        [_delegate clickHeaderImageAction];
    }
    
}


-(void)clickBgImageAction:(UITapGestureRecognizer *)tap
{
//    [LWAlertView shoWithMessage:@"背景"];
    if (_delegate && [_delegate respondsToSelector:@selector(changeBackViewImage)]) {
        [_delegate changeBackViewImage];
    }
    
}



- (UIImageView *)loadingView {
    if (_loadingView) {
        return _loadingView;
    }
    _loadingView = [[UIImageView alloc] initWithFrame:CGRectMake(20.0f,-70.0f,25.0f,25.0f)];
    _loadingView.contentMode = UIViewContentModeScaleAspectFill;
    _loadingView.image = [UIImage imageNamed:@"loading"];
    _loadingView.clipsToBounds = YES;
    _loadingView.backgroundColor = [UIColor clearColor];
    return _loadingView;
}

- (void)loadingViewAnimateWithScrollViewContentOffset:(CGFloat)offset {
    if (offset <= 0 && offset > - 200.0f) {
        self.loadingView.transform = CGAffineTransformMakeRotation(offset* 0.1);
    }
}

- (void)refreshingAnimateBegin {
    CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.duration = 0.5f;
    rotationAnimation.autoreverses = NO;
    rotationAnimation.repeatCount = HUGE_VALF;
    rotationAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    rotationAnimation.toValue = [NSNumber numberWithFloat:2 * M_PI];
    [self.loadingView.layer addAnimation:rotationAnimation forKey:@"rotationAnimations"];
}

- (void)refreshingAnimateStop {
    [self.loadingView.layer removeAllAnimations];
}



@end
