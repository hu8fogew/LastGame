//
//  SingleSelectView.m
//  QiPinTong
//
//  Created by taylor on 2017/3/2.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "SingleSelectView.h"
#define Width self.frame.size.width
#define Height self.frame.size.height

#define BtnW 60
#define toolH 44
#define BJH  SCREEN_WIDTH*0.7
@interface SingleSelectView ()<UIPickerViewDelegate,UIPickerViewDataSource>{
    UIView *_BJView;
    NSArray *_titleAry;
    UIPickerView *_pickView;
    
    NSInteger _selectIndex;
   
}

@property (nonatomic ,copy) void(^sele)(NSString *singleStr);

@end

@implementation SingleSelectView

- (instancetype)initWithFrame:(CGRect)rect SelectTtitle:(NSString *)title TitleArr:(NSArray *)arr{
    if (self = [super initWithFrame:rect]) {
        
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        [UIView animateWithDuration:0.3 animations:^{
            self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        }];

        //显示pickerView和按钮最底下的view
        _BJView = [[UIView alloc]initWithFrame:CGRectMake(0, Height, Width, BJH)];
        _BJView.backgroundColor = whiteC;
        [self addSubview:_BJView];
        
        UIView *tool = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, Width, toolH)];
        tool.backgroundColor = [UIColor whiteColor];
        [_BJView addSubview:tool];
        
        //按钮 和 中间显示的标题内容
        UIButton *cancel = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        cancel.frame = CGRectMake(0, 0, BtnW, toolH);
        [cancel setTitle:@"取消" forState:UIControlStateNormal];
        [cancel addTarget:self action:@selector(cancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [tool addSubview:cancel];
        
        UILabel *titeLabel = [[UILabel alloc]initWithFrame:CGRectMake(cancel.frame.size.width, 0, Width - (cancel.frame.size.width * 2), toolH)];
        titeLabel.text = title;
        titeLabel.textColor = [UIColor blackColor];
        titeLabel.textAlignment = NSTextAlignmentCenter;
        [tool addSubview:titeLabel];
        
        UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        sureBtn.frame = CGRectMake(Width - BtnW, 0, BtnW, toolH);
        [sureBtn setTitle:@"选择" forState:UIControlStateNormal];
        [sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [tool addSubview:sureBtn];
        
        _pickView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, toolH, Width, _BJView.frame.size.height-toolH)];
        _pickView.delegate = self;
        _pickView.dataSource = self;
        _pickView.backgroundColor = whiteC;
        [_BJView addSubview:_pickView];
        
        _titleAry = arr;
    }
    return self;
}

//自定义每个pickerView的label
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel *pickerLabel = [UILabel new];
    pickerLabel.numberOfLines = 0;
    pickerLabel.textAlignment = NSTextAlignmentCenter;
    [pickerLabel setFont:[UIFont systemFontOfSize:15]];
    pickerLabel.text = [self pickerView:pickerView titleForRow:row forComponent:component];
    
    ((UILabel *)[pickerView.subviews objectAtIndex:1]).backgroundColor = HWColor(210, 210, 210);
    
    ((UILabel *)[pickerView.subviews objectAtIndex:2]).backgroundColor = HWColor(210, 210, 210);
    
    return pickerLabel;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    _selectIndex = row;
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    
    return 35;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _titleAry.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{

    return [_titleAry objectAtIndex:row];
   
}


//取消
- (void) cancelBtnClick{
    __weak typeof (UIView *)blockView = _BJView;
    __weak typeof(self)blockself = self;
    __block int blockH = Height;
    [UIView animateWithDuration:0.3 animations:^{
        CGRect BJf = blockView.frame;
        BJf.origin.y = blockH;
        blockView.frame = BJf;
        blockself.alpha = 0.1;
    }completion:^(BOOL finished) {
        [blockself removeFromSuperview];
    }];
    
}
//选择
- (void) sureBtnClick{
    __weak typeof (UIView *)blockView = _BJView;
    __weak typeof(self)blockself = self;
    __block int blockH = Height;
    
    if (self.sele) {
        self.sele(_titleAry[_selectIndex]);
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect BJf = blockView.frame;
        BJf.origin.y = blockH;
        blockView.frame = BJf;
        blockself.alpha = 0.1;
    }completion:^(BOOL finished) {
        [blockself removeFromSuperview];
    }];
    
}

- (void)showView:(void (^)(NSString *))selectStr{
    self.sele = selectStr;
    [[[UIApplication sharedApplication] keyWindow] addSubview:self];
    
    __weak typeof (UIView *)blockView = _BJView;
    __block int blockH = Height;
    __block int bjH = BJH;
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect BJf = blockView.frame;
        BJf.origin.y = blockH - bjH;
        blockView.frame = BJf;
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject] locationInView:self];
    if (!CGRectContainsPoint(_BJView.frame, point)) {
        [self cancelBtnClick];
    }
}


@end
