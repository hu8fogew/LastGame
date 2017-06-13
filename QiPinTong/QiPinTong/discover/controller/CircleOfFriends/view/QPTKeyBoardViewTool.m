//
//  QPTKeyBoardViewTool.m
//  QiPinTong
//
//  Created by 企聘通 on 2017/5/5.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "QPTKeyBoardViewTool.h"

#import "QPTTextView.h"

#define kKeyboardViewToolBar_TextView_LimitHeight 65  // 默认键盘输入框的限制高度

#define kKeyboardViewToolBar_Horizontal_DefaultMargin 15  //水平方向默认间距
#define kKeyboardViewToolBar_Vertical_DefaultMargin 10  //垂直方向默认间距

@interface QPTKeyBoardViewTool ()<RCEmojiViewDelegate,QPTTextViewDelegate>


/**
 输入框输入字符串回调Blcok
 */
//@property (nonatomic, copy) void(^sendTextBlock)(NSString *text);

@property (nonatomic,strong) QPTTextView *inputTextView;//输入框

@property (nonatomic,strong) RCEmojiBoardView *faceView;//表情view

@property (nonatomic ,strong) UIButton *faceButton;

@property (nonatomic, strong) UIView *topLine;      // 顶部分割线
@property (nonatomic, strong) UIView *bottomLine;      // 底部分割线
@property (nonatomic, assign) CGFloat textHeight;   //输入文字高度
@property (nonatomic, assign) CGFloat animationDuration;  //动画时间
@property (nonatomic, strong) NSString *placeHolder;  //占位文字
@end


@implementation QPTKeyBoardViewTool


#pragma mark ----初始化

-(instancetype)initKeyBoradWithConfigToolBarHeight:(CGFloat)toolBarHeight sendTextCompletion:(SendBlock)sendTextBlock
{
    self = [super init];
    if (self) {
        
        self.backgroundColor = HWColor(247, 247, 247);
        
        if (toolBarHeight < 50.0f) {
            toolBarHeight = 50.0f;
        }
        self.frame = CGRectMake(0, SCREEN_HEIGHT - toolBarHeight, SCREEN_WIDTH, toolBarHeight);
        
        self.sendText = sendTextBlock;
        
        
    }
    return self;
}


+(QPTKeyBoardViewTool *)showKeyBoardWithConfigToolBarHeight:(CGFloat)toolBarHeight sendTextCompletion:(SendBlock)sendTextBlock
{
    
   
    
    QPTKeyBoardViewTool *toolBar = [[QPTKeyBoardViewTool alloc]init];
    
    toolBar.backgroundColor = HWColor(247, 247, 247);
    
    if (toolBarHeight < keyBoardTextViewToolHeight) {
        toolBarHeight = keyBoardTextViewToolHeight;
    }
    
    toolBar.frame = CGRectMake(0, SCREEN_HEIGHT - toolBarHeight - 64.0f, SCREEN_WIDTH, toolBarHeight);
    
    toolBar.sendText = sendTextBlock;
    
    return toolBar;
}




#pragma mark ---设置

-(void)setInputViewPlaceHolderText:(NSString *)placeText
{
    self.inputTextView.placeholder = placeText;
    self.placeHolder = placeText;
    
}



-(void)becomeFirstResponder
{
    
    [self.inputTextView becomeFirstResponder];
    self.hidden = NO;
    
}

-(void)resignFirstResponder
{
    [self.inputTextView resignFirstResponder];
    
}



#pragma mark ----内部封装

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupUI];
    }
    return self;
}




-(void) setupUI
{
    //添加视图
    [self addSubview:self.inputTextView];
    
    [self addSubview:self.faceButton];
    
    [self addSubview:self.topLine];
    
    [self addSubview:self.bottomLine];
    
    
    //添加通知中心，监听键盘
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self.inputTextView];

    
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    __weak typeof(self) weakSelf = self;
    
    CGFloat height = (self.textHeight + keyBoardTextViewHeight) > keyBoardTextViewToolHeight ? (self.textHeight + keyBoardTextViewHeight) : keyBoardTextViewToolHeight;
    
    CGFloat offsetY = self.height - height;
    
    [UIView animateWithDuration:self.animationDuration animations:^{
        
        weakSelf.y += offsetY;
        weakSelf.height = height;
    }];
    
    self.topLine.width = self.width;
    self.bottomLine.width = self.width;
    
    CGSize sendButtonSize = CGSizeMake(30.0f, 30.0f);
    
    self.faceButton.width = 30.0f;
    
    self.faceButton.height = 30.0f;
    
    self.faceButton.x = self.width - sendButtonSize.width - kKeyboardViewToolBar_Horizontal_DefaultMargin;
    
    self.inputTextView.width = self.width - sendButtonSize.width - 3*kKeyboardViewToolBar_Horizontal_DefaultMargin;
    
    self.inputTextView.x = kKeyboardViewToolBar_Horizontal_DefaultMargin;
    
    [UIView animateWithDuration:self.animationDuration animations:^{
        
        weakSelf.inputTextView.height = weakSelf.height - 2*kKeyboardViewToolBar_Vertical_DefaultMargin;
        
        weakSelf.inputTextView.centerY = weakSelf.height *0.5;
        
        weakSelf.faceButton.y = weakSelf.height -sendButtonSize.height -kKeyboardViewToolBar_Vertical_DefaultMargin;
        
        weakSelf.bottomLine.y = weakSelf.height -weakSelf.bottomLine.height;
        
    }];
    
    [self.inputTextView setNeedsUpdateConstraints];
    
}







//弹出键盘
-(void)keyBoardWillChangeFrame:(NSNotification *)notification
{
    //获取键盘frame
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    
    CGFloat keyboardHeight = keyboardFrame.size.height;
    
    HWLog(@"=========%f",keyboardHeight);
    
    
    //获取弹出键盘动画时长
    CGFloat keyboardAnimaitonDuration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    self.animationDuration = keyboardAnimaitonDuration;
    
    NSInteger option = [notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue];
    
    
    //普通文字键盘与表情键盘切换时，过滤
    
    BOOL isEmojiKeyboard = !self.faceButton.selected && keyboardFrame.size.height == emojBoardViewHeight;
    
    BOOL isNormalKeyboard = self.faceButton.selected && keyboardFrame.size.height != emojBoardViewHeight;
    
    if (isEmojiKeyboard || isNormalKeyboard) return;
    
    //键盘出现
    BOOL isKeyBoardHidden = SCREEN_HEIGHT == keyboardFrame.origin.y;
    CGFloat offsetMarginY = isKeyBoardHidden ? SCREEN_HEIGHT - self.height - 64.0f : SCREEN_HEIGHT - self.height-keyboardHeight - 64.0f;
    
    
    [UIView animateKeyframesWithDuration:self.animationDuration delay:0 options:option animations:^{
        
        self.y = offsetMarginY;
        
    } completion:nil];
    
}

//编辑变化
-(void)textDidChange
{
    //注意：点击发送之后是先收到这个通知，收到通知的时候hasText = YES，让后再text = @"",所以在inputTextView里面的监听无效
    
    self.inputTextView.placeHolderHidden = self.inputTextView.hasText;
    if ([self.inputTextView.text containsString:@"\n"]) {
        
        [self emojitionDidSend];
        return;
    }
    
    CGFloat margin = self.inputTextView.textContainerInset.left + self.inputTextView.textContainerInset.right;
    
    CGFloat height = [self.inputTextView.text boundingRectWithSize:CGSizeMake(self.inputTextView.width - margin, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.inputTextView.font} context:nil].size.height;
    
    if(height == self.textHeight) return;
    
    // 确保输入框不会无限增高，控制在显示4行
    if (height > kKeyboardViewToolBar_TextView_LimitHeight) {
        return;
    }
    self.textHeight = height;
    
    [self setNeedsLayout];
    
}


#pragma mark ----sizeDelegate
-(void)textView:(QPTTextView *)textView heightChanged:(NSInteger)height
{
    
    if (height > kKeyboardViewToolBar_TextView_LimitHeight) {
        self.inputTextView.height = kKeyboardViewToolBar_TextView_LimitHeight;
    }
    
    [self setNeedsLayout];
    
}





-(void)faceButtonClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
    self.bottomLine.hidden = !sender.selected;
    
    [self.inputTextView resignFirstResponder];
    
    self.inputTextView.inputView = sender.selected ? self.faceView : nil;
    
    [self.inputTextView becomeFirstResponder];
    
    
    
}



-(void)emojitionDidSend
{
    NSString *text = self.inputTextView.text;
    
    if (self.sendText) {
        self.sendText(text);
    }
    
    [self resetInputView];
    [self textDidChange];
    
}

/**
 重置输入框
 */
-(void) resetInputView
{
    self.inputTextView.text = @"";
    
    [self setInputViewPlaceHolderText:self.placeHolder.length > 0 ? self.placeHolder : @""];
    
    
    [self.inputTextView resignFirstResponder];
    
    if (self.faceButton.selected) {
        
        self.faceButton.selected = !self.faceButton.isSelected;
        
        self.bottomLine.hidden = !self.faceButton.selected;
        
        self.inputTextView.inputView = self.faceButton.selected ? self.faceView : nil;
    }
    
    //布局的目的是布局textContainer 显示区域，显示区域回到初始位置
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self setNeedsLayout];
    });
}








#pragma mark ----RCEmojiViewDelegate


/*!
 点击发送按钮的回调
 
 @param emojiView  表情输入的View
 @param sendButton 发送按钮
 */

-(void)didSendButtonEvent:(RCEmojiBoardView *)emojiView sendButton:(UIButton *)sendButton
{
    
    [self emojitionDidSend];
    
}

/*!
 点击表情的回调
 
 @param emojiView 表情输入的View
 @param string    点击的表情对应的字符串编码
 */
-(void)didTouchEmojiView:(RCEmojiBoardView *)emojiView touchedEmoji:(NSString *)string
{
    
    
    
    if (string == NULL) {
        
        HWLog(@"空空如也%@",string);
        string = @"";
        [self.inputTextView deleteBackward];
        
    }
    
    NSMutableString *str = [NSMutableString stringWithFormat:@"%@",string];
    
    
    self.inputTextView.text = [self.inputTextView.text stringByAppendingString:str];
    
    
    
    
    [self textDidChange];
}





#pragma mark -----Lazy



- (UIButton *)faceButton {
    if (_faceButton) {
        return _faceButton;
    }
    _faceButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    _faceButton.selected = NO;
    
    [_faceButton setImage:[UIImage imageWithContentsOfFile:[[NSFileManager rongYunBundlePath] stringByAppendingPathComponent:@"chatting_biaoqing_btn_normal"]] forState:UIControlStateNormal];
    [_faceButton setImage:[UIImage imageWithContentsOfFile:[[NSFileManager rongYunBundlePath] stringByAppendingPathComponent:@"chat_setmode_key_btn_normal"]] forState:UIControlStateSelected];
    
    [_faceButton addTarget:self action:@selector(faceButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return _faceButton;
}

/*
 -(UIButton *)awardButton
 {
 if (!_awardButton) {
 _awardButton = [UIButton buttonWithType:UIButtonTypeCustom];
 
 [_awardButton setImage:[UIImage imageNamed:@"awardC"] forState:UIControlStateNormal];
 
 [_awardButton addTarget:self action:@selector(awardClickBtn:) forControlEvents:UIControlEventTouchUpInside];
 
 }
 return _awardButton;
 }
 
 */


//表情😊View
-(RCEmojiBoardView *)faceView
{
    if (!_faceView) {
        _faceView = [[RCEmojiBoardView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, emojBoardViewHeight) delegate:self];
        _faceView.backgroundColor = whiteC;
        
        [_faceView enableSendButton:YES];
        
    }
    return _faceView;
}




//输入框
-(QPTTextView *)inputTextView
{
    if (!_inputTextView) {
        
        _inputTextView = [[QPTTextView alloc]init];
        _inputTextView.layer.cornerRadius = 4.0f;
        _inputTextView.layer.borderColor = [HWColor(238, 238, 238) CGColor];
        _inputTextView.layer.borderWidth = 1.0f;
        
        _inputTextView.layer.masksToBounds = YES;
        
        _inputTextView.font = [UIFont systemFontOfSize:mainTitleSize];
        
        _inputTextView.textColor = MainColor;
        
        _inputTextView.tintColor = _inputTextView.textColor;
        
        _inputTextView.enablesReturnKeyAutomatically = YES;
        
        _inputTextView.returnKeyType = UIReturnKeySend;
        
        _inputTextView.placeholderColor = SecondTitleColor;
        
        _inputTextView.sizeDelegate = self;
        
    }
    return _inputTextView;
}



//上下边线
- (UIView *)topLine{
    if (_topLine == nil) {
        _topLine = [[UIView alloc] init];
        _topLine.height = 0.5;
        _topLine.backgroundColor = HWColor(214, 214, 214);
    }
    return _topLine;
}

- (UIView *)bottomLine{
    if (_bottomLine == nil) {
        _bottomLine = [[UIView alloc] init];
        _bottomLine.backgroundColor = HWColor(214, 214, 214);
        _bottomLine.height = 0.5;
        _bottomLine.hidden = YES;
    }
    return _bottomLine;
}
@end

