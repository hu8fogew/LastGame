//
//  YCYMDeHeadView.m
//  家长界
//
//  Created by taylor on 2016/12/19.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "YCYMDeHeadView.h"

@interface YCYMDeHeadView()<LWAsyncDisplayViewDelegate>
@property(nonatomic,strong)LWAsyncDisplayView *asyncView;
/*收藏*/
@property (strong,nonatomic) UIButton *loveIcon;
@property (strong ,nonatomic) UIImageView *loadingView;

@end

@implementation YCYMDeHeadView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.backImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.personLay.personViewHeight+15)];
        [self addSubview:self.backImageView];
        [self addSubview:self.loadingView];
        [self addSubview:self.asyncView];
        [self addSubview:self.loveIcon];
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
    }
    HWLog(@"点击了图片");
    
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    self.asyncView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.personLay.personViewHeight);
    //主线程runloop空闲时执行
    LWTransaction* layerAsyncTransaction = self.layer.lw_asyncTransaction;
    [layerAsyncTransaction
     addAsyncOperationWithTarget:self
     selector:@selector(_layouSubViews)
     object:nil
     completion:^(BOOL canceled) {}];
}

- (void)_layouSubViews {
    
    self.loveIcon.frame = self.personLay.enjoyButton;

    
}

-(LWAsyncDisplayView *)asyncView
{
    if (!_asyncView) {
        _asyncView = [[LWAsyncDisplayView alloc]initWithFrame:CGRectZero];
        _asyncView.delegate = self;
        _asyncView.backgroundColor = [UIColor clearColor];
    }
    return _asyncView;
}


-(PersonalLayout *)personLay
{
    if (!_personLay) {
        _personLay = [[PersonalLayout alloc]initOwnerDetailWithSrtId:@"公司"];
        self.asyncView.layout = self.personLay;
    }
    return _personLay;
}


//收藏
-(UIButton *)loveIcon
{
    if (!_loveIcon) {
        _loveIcon = [UIButton buttonWithType:UIButtonTypeCustom];
        _loveIcon.selected = NO;
        [_loveIcon setImage:[UIImage imageNamed:@"shoucangicon"] forState:UIControlStateNormal];
        [_loveIcon setImage:[UIImage imageNamed:@"shoucangiconed"] forState:UIControlStateSelected];
//        _loveIcon.backgroundColor = whiteC;
        _loveIcon.frame = CGRectZero;
        [_loveIcon addTarget:self action:@selector(loveIconClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _loveIcon;
}

//loveBtn
-(void)loveIconClick:(UIButton *)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(enjoyButton:)]) {
        [_delegate enjoyButton:sender];
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
