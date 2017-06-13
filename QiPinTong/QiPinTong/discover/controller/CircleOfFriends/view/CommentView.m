


/********************* 有任何问题欢迎反馈给我 liuweiself@126.com ****************************************/
/***************  https://github.com/waynezxcv/Gallop 持续更新 ***************************/
/******************** 正在不断完善中，谢谢~  Enjoy ******************************************************/










#import "CommentView.h"
#import "GallopDefine.h"
#import "QPTTextView.h"

@interface CommentView ()<UITextViewDelegate,RCEmojiViewDelegate>

@property (nonatomic,strong) UILabel* placeholderLabel;
@property (nonatomic,assign) CGFloat textViewHeight;
@property (nonatomic,strong) UIButton* emojiButton;
@property (nonatomic ,strong) UIButton *awardButton;
@property (nonatomic ,strong) RCEmojiBoardView *boradVc;


@end

@implementation CommentView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpUI];

    }
    return self;
}

- (id)initWithFrame:(CGRect)frame sendBlock:(PressSendBlock)sendBlock {
    self = [super initWithFrame:frame];
    if (self) {
        self.sendBlock = [sendBlock copy];
        [self setUpUI];
//        self.backgroundColor = whiteC;
//        [self addSubview:self.placeholderLabel];
        
    }
    return self;
}



-(void)resignFirstResponser
{
    [self.textView resignFirstResponder];
    
    self.textView.placeholder = @"  评论";
    
}

-(void)becomeFirstResponser
{
    [self.textView becomeFirstResponder];
    
}



-(void) setUpUI
{
    
    [self addSubview:self.textView];
    [self addSubview:self.emojiButton];
    [self addSubview:self.awardButton];
    [self addSubview:self.boradVc];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.textView.frame = CGRectMake(10.0f, 7.0f, SCREEN_WIDTH - 100.0f, self.bounds.size.height - 12.0f);
    self.placeholderLabel.frame = CGRectMake(10.0f, 7.0f, SCREEN_WIDTH - 100.0f, self.bounds.size.height - 16.0f);
    self.emojiButton.frame = CGRectMake(SCREEN_WIDTH - 80.0f, self.bounds.size.height-40.0f, 30.0f, 30.0f);
    self.awardButton.frame = CGRectMake(SCREEN_WIDTH - 40.f, self.bounds.size.height-40.0f, 30.0f, 30.0f);
    
}

#pragma mark  - UITextViewDelegate

- (void)textView:(AutoFitSizeTextView *)textView heightChanged:(NSInteger)height {
    [self setNeedsDisplay];
    if (self.frame.size.height <= 100.0f &&
        self.frame.origin.y != SCREEN_HEIGHT-50.0f-64.0f &&
        self.frame.size.height >= 50.0f) {
        self.frame = CGRectMake(self.frame.origin.x,
                                self.frame.origin.y - height - 3.0f,
                                self.frame.size.width,
                                self.frame.size.height + height + 3.0f);
    }
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]){
        if (self.textView.text.length != 0) {
            if (self.sendBlock) {
                NSString* content = [self.textView.text copy];
                self.sendBlock(content);
                self.textView.placeholder = @"  评论";
                [self.textView resignFirstResponder];
            }
        }
        return NO;
    }
    return YES;
}



-(BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    
    if (_delegate && [_delegate respondsToSelector:@selector(beginChangeComment:)]) {
        [_delegate beginChangeComment:textView];
    }

    return YES;
    
}


#pragma mark - Getter

- (QPTTextView *)textView {
    if (_textView) {
        return _textView;
    }
    _textView = [[QPTTextView alloc] initWithFrame:CGRectZero];
    _textView.layer.cornerRadius = 4.0f;
//    _textView.backgroundColor = clearC;
    _textView.font = [UIFont systemFontOfSize:mainTitleSize];
    _textView.delegate = self;
    _textView.textColor = MainColor;
    _textView.returnKeyType = UIReturnKeySend;
    _textView.sizeDelegate = self;
    _textView.layer.borderColor = [HWColor(239, 239, 239) CGColor];
    _textView.layer.borderWidth = 1.0f;
    _textView.layer.masksToBounds = YES;
    _textView.layoutManager.allowsNonContiguousLayout = NO;
    _textView.enablesReturnKeyAutomatically = YES;
    _textView.placeholderColor = SecondTitleColor;
    _textView.placeholder = @"  评论";
    
    return _textView;
}

- (UILabel *)placeholderLabel {
    if (_placeholderLabel) {
        return _placeholderLabel;
    }
    _placeholderLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _placeholderLabel.textColor = SecondTitleColor;
    _placeholderLabel.backgroundColor = whiteC;
    _placeholderLabel.font = [UIFont systemFontOfSize:15.0f];
    _placeholderLabel.layer.cornerRadius = 3.0f;
    _placeholderLabel.layer.masksToBounds = YES;
//    _placeholderLabel.layer.borderWidth = 1.0f;
//    _placeholderLabel.layer.borderColor = [HWColor(239, 239, 239) CGColor];
    
    return _placeholderLabel;
}

- (UIButton *)emojiButton {
    if (_emojiButton) {
        return _emojiButton;
    }
    _emojiButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _emojiButton.selected = NO;
    
    [_emojiButton setImage:[UIImage imageWithContentsOfFile:[[NSFileManager rongYunBundlePath] stringByAppendingPathComponent:@"chatting_biaoqing_btn_normal"]] forState:UIControlStateNormal];
    [_emojiButton setImage:[UIImage imageWithContentsOfFile:[[NSFileManager rongYunBundlePath] stringByAppendingPathComponent:@"chat_setmode_key_btn_normal"]] forState:UIControlStateSelected];
    
    [_emojiButton addTarget:self action:@selector(emojBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return _emojiButton;
}

-(UIButton *)awardButton
{
    if (!_awardButton) {
        _awardButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_awardButton setImage:[UIImage imageNamed:@"awardC"] forState:UIControlStateNormal];
        
        [_awardButton addTarget:self action:@selector(awardClickBtn:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _awardButton;
}


-(RCEmojiBoardView *)boradVc
{
    if (!_boradVc) {
        _boradVc = [[RCEmojiBoardView alloc]initWithFrame:CGRectMake(0, SCREEN_WIDTH-223.5, SCREEN_WIDTH, 223.5) delegate:self];
        
        _boradVc.emojiBackgroundView.backgroundColor = HWColor(247, 247, 247);
    }
    return _boradVc;
}


-(void)didTouchEmojiView:(RCEmojiBoardView *)emojiView touchedEmoji:(NSString *)string
{
    
    
    
}




-(void)emojBtnClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
    
//    [self.textView resignFirstResponder];
    
    self.textView.inputView = sender.selected ? self.boradVc : nil;
    
//    [self.textView becomeFirstResponder];
    
    HWLog(@"表情😊");
    
    
}


-(void)awardClickBtn:(UIButton *)sender
{
    
    HWLog(@"打赏");
    
}




@end
