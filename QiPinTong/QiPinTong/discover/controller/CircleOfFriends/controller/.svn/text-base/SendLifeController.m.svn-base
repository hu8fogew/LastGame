//
//  SendLifeController.m
//  家长界
//
//  Created by mac on 2016/12/29.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "SendLifeController.h"
#import "DSTextView.h"
#import "DSComposeToolbar.h"

#define SourceCompose @"compose"
#define SourceComment @"comment"
@interface SendLifeController ()<DSComposeToolbarDelegate,UITextViewDelegate>

//底部选项按钮
@property(nonatomic,strong)DSComposeToolbar *toolBar;
//输入view
@property(nonatomic,strong)DSTextView *editView;

//是否正在切换键盘
@property (nonatomic ,assign, getter=isChangingKeyboard) BOOL ChangingKeyboard;

@end

@implementation SendLifeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //设置导航
    [self setupNavigationItem];
    
    //设置底部toolBar
    [self.view addSubview:self.toolBar];
    //设置编辑框
    [self.view addSubview:self.editView];
    
    
    HWLog(@"%@",self.editingType);
    
}


#pragma mark ---------setNavigation
- (void)setupNavigationItem {
    
        NSString *prefix = @"";
        if ([self.editingType isEqual:SourceCompose]){
            prefix = @"编辑动态";
        }
        if ([self.editingType isEqual:SourceComment]){
            prefix = @"编辑评论";
        }
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:prefix];
        
        [string addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:15] range:[prefix rangeOfString:prefix]];
        
        //创建label
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.attributedText = string;
        titleLabel.numberOfLines = 0;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.width = 100;
        titleLabel.height = 44;
        self.navigationItem.titleView = titleLabel;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelClick)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStylePlain target:self action:@selector(sendClick)];
    
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
    
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
    
}

#pragma mark -------------setEditingTextView

-(DSComposeToolbar *)toolBar
{
    if (!_toolBar) {
        _toolBar = [[DSComposeToolbar alloc]init];
        _toolBar.width = self.view.width;
        _toolBar.height = 44;
        _toolBar.delegate = self;
        
        _toolBar.y = self.view.height - _toolBar.height;
    }
    return _toolBar;
}


#pragma mark -------toolBarDelegate
-(void)composeTool:(DSComposeToolbar *)toolbar didClickedButton:(DSComposeToolbarButtonType)buttonType
{
    switch (buttonType) {
        case DSComposeToolbarButtonTypeCamera: // 照相机
//            [self openCamera];
            HWLog(@"照相机");
            break;
            
        case DSComposeToolbarButtonTypePicture: // 相册
//            [self openAlbum];
            HWLog(@"相册");
            break;
            
        case DSComposeToolbarButtonTypeEmotion: // 表情
//            [self openEmotion];
            HWLog(@"表情");
            break;
            
        default:
            break;
    }
}


#pragma mark ----------setingEditingView
-(DSTextView *)editView
{
    if (!_editView) {
        _editView = [[DSTextView alloc]init];
        _editView.alwaysBounceVertical = YES ;//垂直方向上有弹簧效果
        _editView.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64);
        _editView.delegate = self;
        // 2.设置提醒文字
        _editView.placeholder = @"请输入您要编辑的内容 . . .";
        
        // 3.设置字体
        _editView.font = [UIFont systemFontOfSize:15];
        
        // 4.监听键盘
        // 键盘的frame(位置)即将改变, 就会发出UIKeyboardWillChangeFrameNotification
        // 键盘即将弹出, 就会发出UIKeyboardWillShowNotification
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        // 键盘即将隐藏, 就会发出UIKeyboardWillHideNotification
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
        
    }
    return _editView;
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

/**
 *  view显示完毕的时候再弹出键盘，避免显示控制器view的时候会卡住
 */
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // 成为第一响应者（叫出键盘）
    [self.editView becomeFirstResponder];
}


#pragma mark - 键盘处理
/**
 *  键盘即将隐藏：工具条（toolbar）随着键盘移动
 */
- (void)keyboardWillHide:(NSNotification *)note
{
    //需要判断是否自定义切换的键盘
    if (self.isChangingKeyboard) {
        self.ChangingKeyboard = NO;
        return;
    }
    
    // 1.键盘弹出需要的时间
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // 2.动画
    [UIView animateWithDuration:duration animations:^{
        self.toolBar.transform = CGAffineTransformIdentity;//回复之前的位置
    }];
}

/**
 *  键盘即将弹出
 */
- (void)keyboardWillShow:(NSNotification *)note
{
    // 1.键盘弹出需要的时间
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // 2.动画
    [UIView animateWithDuration:duration animations:^{
        // 取出键盘高度
        CGRect keyboardF = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
        CGFloat keyboardH = keyboardF.size.height;
        self.toolBar.transform = CGAffineTransformMakeTranslation(0, - keyboardH);
    }];
}



#pragma mark - UITextViewDelegate
/**
 *  当用户开始拖拽scrollView时调用
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
