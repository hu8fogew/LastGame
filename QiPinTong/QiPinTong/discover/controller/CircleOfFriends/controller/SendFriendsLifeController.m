//
//  SendFriendsLifeController.m
//  QiPinTong
//
//  Created by 企聘通 on 2017/5/9.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "SendFriendsLifeController.h"

#import "QPTTextView.h"
#import "POIMapViewController.h"
#import "LWActionSheetView.h"
@interface SendFriendsLifeController ()<UITableViewDelegate,UITableViewDataSource,LQPhotoPickerViewDelegate,QPTTextViewDelegate,RCEmojiViewDelegate,LWActionSheetViewDelegate>

//输入框
@property (nonatomic,strong) QPTTextView *noteTextView;

//tableview
@property (nonatomic,strong) UITableView *sendTable;


@property (nonatomic,strong) UIView *textHeaderView;

@property (nonatomic,strong) UIView *inputTextView;

@property (nonatomic, assign) CGFloat animationDuration;  //动画时间

@property (nonatomic ,strong) UIButton *faceButton;

@property (nonatomic ,strong) RCEmojiBoardView *emojiView;

@property (nonatomic ,strong) AMapLocationManager *locationManger;


@property (nonatomic,copy) NSString *locationStr;

@end

@implementation SendFriendsLifeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = whiteC;
    
    //设置导航
    [self setupNav];
    
    // 设置UI
    [self setupUI];
    
    
}


-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    
    [self updateViewsFrame];
    
    
}

-(void)setupNav
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelClick)];
    
    [self.navigationItem.leftBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName:whiteC} forState:UIControlStateNormal];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发布" style:UIBarButtonItemStylePlain target:self action:@selector(sendClick)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName:whiteC} forState:UIControlStateNormal];
}


-(void)updateViewsFrame
{
    self.noteTextView.frame = CGRectMake(10, 10, SCREEN_WIDTH-20, 100);
    
    [self LQPhotoPicker_updatePickerViewFrameY:self.noteTextView.botoom];
    
    
    self.textHeaderView.frame = CGRectMake(0, 0, SCREEN_WIDTH, [self LQPhotoPicker_getPickerViewFrame].origin.y + [self LQPhotoPicker_getPickerViewFrame].size.height +15);
    
    
}





-(void)setupUI
{
    self.navigationItem.title = @"编辑动态";
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.view addSubview:self.sendTable];
    
    [self.view insertSubview:self.inputTextView aboveSubview:self.sendTable];
    
    
    self.sendTable.tableHeaderView = self.textHeaderView;
    
    //添加通知中心，监听键盘
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self.inputTextView];
    
    
}

//键盘弹出
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
    CGFloat offsetMarginY = isKeyBoardHidden ? SCREEN_HEIGHT - self.inputTextView.height - 64.0f : SCREEN_HEIGHT - self.inputTextView.height-keyboardHeight - 64.0f;
    
    
    [UIView animateKeyframesWithDuration:self.animationDuration delay:0 options:option animations:^{
        
        self.inputTextView.y = offsetMarginY;
        self.inputTextView.hidden = NO;
        
        
    } completion:nil];
    
}

-(void)textDidChange
{
    self.inputTextView.y = SCREEN_HEIGHT-50-64;
    self.inputTextView.hidden = YES;
    
    self.faceButton.selected = NO;
    
    
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.noteTextView resignFirstResponder];
    self.inputTextView.hidden = YES;
    [self.sendTable reloadData];
}


//取消编辑
-(void)cancelClick
{
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}
//编辑成功--------发布
-(void)sendClick
{
    HWLog(@"已经发表");
    
    [LWAlertView shoWithMessage:@"暂时未实现哦！"];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.noteTextView resignFirstResponder];
    
    self.inputTextView.hidden = YES;
    
    
}


-(void)textView:(QPTTextView *)textView heightChanged:(NSInteger)height
{
    
    if (height>100) {
        self.noteTextView.height = 100;
    }
    
    [self updateViewsFrame];
    
}



//弹出表情输入框
-(void)faceButtonClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
    
    [self.noteTextView resignFirstResponder];
    
    self.noteTextView.inputView = sender.selected ? self.emojiView : nil;
    
    [self.noteTextView becomeFirstResponder];
    
    
    
}


#pragma mark emojiViewDelegate
-(void)didSendButtonEvent:(RCEmojiBoardView *)emojiView sendButton:(UIButton *)sendButton
{
    
    self.noteTextView.text = [self.noteTextView.text stringByAppendingString:@"\n"];
    
}


-(void)didTouchEmojiView:(RCEmojiBoardView *)emojiView touchedEmoji:(NSString *)string
{
    if (string == NULL) {
        string = @"";
        
        [self.noteTextView deleteBackward];
    }else
    {
        self.noteTextView.placeHolderHidden = YES;
    }
    
    NSMutableString *str = [NSMutableString stringWithFormat:@"%@",string];
    
    self.noteTextView.text = [self.noteTextView.text stringByAppendingString:str];
    
}


#pragma mark ----tableViewDelegate&&dataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.imageView.image = [UIImage imageNamed:@"locationIcon"];
    
    
    cell.textLabel.text = self.locationStr == nil ? @"所在位置" : self.locationStr;
    
    cell.textLabel.textColor = MainColor;
    
    cell.textLabel.font = [UIFont systemFontOfSize:mainTitleSize];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    return cell;
    
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    POIMapViewController *vc = [[POIMapViewController alloc]init];
    
    vc.selectLocation = ^(NSString *locationString) {
      
        HWLog(@" 反向传值 ====%@",locationString);
        self.locationStr = locationString;
        
    };
    
    
    MainNavigationController *nvc = [[MainNavigationController alloc]initWithRootViewController:vc];
    
    [self presentViewController:nvc animated:YES completion:nil];
    
    
}



#pragma mark ------上传数据到服务器将图片转data（上传服务器用form表单）


-(void)submitToServer
{
    
    
}

-(void)LQPhotoPicker_pickerViewFrameChanged
{
    [self updateViewsFrame];
    
    [self.sendTable reloadData];
    
}


-(UITableView *)sendTable
{
    if (!_sendTable) {
        _sendTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        
        _sendTable.delegate = self;
        _sendTable.dataSource = self;
        
    }
    
    return _sendTable;
}

-(QPTTextView *)noteTextView
{
    if (!_noteTextView) {
        _noteTextView = [[QPTTextView alloc]init];
        
        _noteTextView.font = [UIFont systemFontOfSize:mainTitleSize];
        
        _noteTextView.textColor = MainColor;
        
        _noteTextView.tintColor = _noteTextView.textColor;
        
        _noteTextView.enablesReturnKeyAutomatically = YES;
        
        _noteTextView.placeholderColor = SecondTitleColor;
        _noteTextView.placeholder = @"这一刻的想法...";
        
        _noteTextView.sizeDelegate = self;
    }
    return _noteTextView;
}


-(UIView *)textHeaderView
{
    if (!_textHeaderView) {
        _textHeaderView = [[UIView alloc]initWithFrame:CGRectZero];
        _textHeaderView.backgroundColor = whiteC;
        
        [_textHeaderView addSubview:self.noteTextView];
        
        
        self.LQPhotoPicker_superView = _textHeaderView;
        
        [self LQPhotoPicker_initPickerView];
        
        self.LQPhotoPicker_imgMaxCount = 9;
        
        self.LQPhotoPicker_delegate = self;
        
        
    }
    return _textHeaderView;
}



-(UIView *)inputTextView
{
    if (!_inputTextView) {
        _inputTextView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-50-64, SCREEN_WIDTH, 50)];
        
        _inputTextView.backgroundColor = whiteC;
        
        [_inputTextView addSubview:self.faceButton];
        
        _inputTextView.hidden = YES;
        
    }
    
    return _inputTextView;
}


-(UIButton *)faceButton
{
    if (!_faceButton) {
        _faceButton = [UIButton buttonWithType:UIButtonTypeCustom];
        //    _faceButton.selected = NO;
        _faceButton.frame = CGRectMake(10, 10, 30, 30);
        [_faceButton setImage:[UIImage imageWithContentsOfFile:[[NSFileManager rongYunBundlePath] stringByAppendingPathComponent:@"chatting_biaoqing_btn_normal"]] forState:UIControlStateNormal];
        [_faceButton setImage:[UIImage imageWithContentsOfFile:[[NSFileManager rongYunBundlePath] stringByAppendingPathComponent:@"chat_setmode_key_btn_normal"]] forState:UIControlStateSelected];
        
        [_faceButton addTarget:self action:@selector(faceButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _faceButton;
}


-(RCEmojiBoardView *)emojiView
{
    if (!_emojiView) {
        _emojiView = [[RCEmojiBoardView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, emojBoardViewHeight) delegate:self];
        _emojiView.backgroundColor = whiteC;
        
        [_emojiView enableSendButton:YES];
        
    }
    return _emojiView;
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
