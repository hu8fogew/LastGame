//
//  EditingController.m
//  QiPinTong
//
//  Created by mac on 2017/2/9.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "EditingController.h"

@interface EditingController ()<UITextViewDelegate>


@property(nonatomic,strong)UITextView *textView;
@property(nonatomic,strong)UILabel *lable;

@end

@implementation EditingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = grayC;
    self.navigationController.navigationBar.barTintColor = blueC;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self setupNavigationItem];
    [self createView];
}


#pragma mark ---------setNavigation
- (void)setupNavigationItem {
    NSString *prefix = self.kindTitle;
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:prefix];
    
    [string addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:MTitleSize] range:[prefix rangeOfString:prefix]];
    //创建label
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.attributedText = string;
    titleLabel.numberOfLines = 0;
    titleLabel.textColor = whiteC;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.width = 100;
    titleLabel.height = 44;
    self.navigationItem.titleView = titleLabel;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelClick)];
    [self.navigationItem.leftBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : whiteC} forState:UIControlStateNormal];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(sendClick)];
    
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : whiteC} forState:UIControlStateNormal];
    
//    self.navigationItem.rightBarButtonItem.enabled = NO;
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
    [self.view endEditing:YES];
    
//    self.writeText(self.textView.text);
//    
//    self.editText = self.textView.text;
//    if (_delegate && [_delegate respondsToSelector:@selector(backStringToComeViewWith:andTag:)]) {
//        [_delegate backStringToComeViewWith:self andTag:self.selectIndex];
//    }
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(UITextView *)textView
{
    if (!_textView) {
        _textView = [[UITextView alloc]initWithFrame:CGRectMake(10, 40, SCREEN_WIDTH-20, 40)];
        _textView.backgroundColor = whiteC;
        _textView.font = [UIFont boldSystemFontOfSize:MTitleSize];
        _textView.delegate = self;
        
    }
    return _textView;
}

-(void)createView
{
    //收起键盘
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped)];
    tapGr.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGr];
    //添加输入框
    [self.view addSubview:self.textView];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(10, self.textView.botoom+10, SCREEN_WIDTH-20, 30)];
    lab.textColor = clearC;
    lab.textColor = HWColor(113, 163, 105);
    lab.textAlignment = NSTextAlignmentRight;
    lab.text = @"0/10";
    self.lable = lab;
    [self.view addSubview:lab];
}

- (void)viewTapped{
    [self.view endEditing:YES];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    self.lable.text = [NSString stringWithFormat:@"%lu/10    ",(unsigned long)self.textView.text.length];
    if (self.textView.text.length > 10) {
        self.lable.textColor = [UIColor redColor];
    }
    else{
        self.lable.textColor = HWColor(113, 163, 105);
    }
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
    }
    return YES;
}

- (void)textViewDidChangeSelection:(UITextView *)textView{
    self.lable.text = [NSString stringWithFormat:@"%lu/10    ",(unsigned long)self.textView.text.length];
    if (self.textView.text.length > 10) {
        self.lable.textColor = redC;
    }
    else{
        self.lable.textColor = HWColor(113, 163, 105);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
