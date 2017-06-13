//
//  DateSelectView.m
//  QiPinTong
//
//  Created by taylor on 2017/2/27.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "DateSelectView.h"
#define Width self.frame.size.width
#define Height self.frame.size.height

#define BtnW 60
#define toolH 44
#define DTH  SCREEN_WIDTH*0.7

@interface DateSelectView()<UIPickerViewDelegate,UIPickerViewDataSource>
{
    UIView *_DTView;
    NSMutableArray *_YearAry;
    NSArray *_MouthAry;
    UIPickerView *_pickView;
        
    NSInteger _yearIndex;
    NSInteger _monthIndex;
    
}

@property (strong,nonatomic) NSString *selectDateString;
@property (nonatomic ,copy) void(^sele)(NSString *selectStr);

@end

@implementation DateSelectView

-(instancetype)initWithFrame:(CGRect)rect SelectDateTtitle:(NSString *)title{
    
    self = [super initWithFrame:rect];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        [UIView animateWithDuration:0.3 animations:^{
            self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        }];
        
        //显示pickerView和按钮最底下的view
        _DTView = [[UIView alloc]initWithFrame:CGRectMake(0, Height, Width, DTH)];
        _DTView.backgroundColor = whiteC;
        [self addSubview:_DTView];
        
        UIView *tool = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, Width, toolH)];
        tool.backgroundColor = [UIColor whiteColor];
        [_DTView addSubview:tool];
        
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
        
        _pickView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, toolH, Width, _DTView.frame.size.height-toolH)];
        _pickView.delegate = self;
        _pickView.dataSource = self;
        _pickView.backgroundColor = whiteC;
        [_DTView addSubview:_pickView];
        
        
        NSCalendar *calendar = [NSCalendar currentCalendar];
        unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth;
        NSDateComponents *components = [calendar components:unitFlags fromDate:[NSDate date]];
        NSInteger year = [components year];  //当前的年份
        NSInteger month = [components month];  //当前的月份
        
        _YearAry =[[NSMutableArray alloc]initWithCapacity:0];
        for (NSInteger k = year - 1970 ; k > 0; k --) {
            [_YearAry addObject:[NSString stringWithFormat:@"%ld",year-k]];
        }
        for (int i= 0; i < 1; i++ ) {
            [_YearAry addObject:[NSString stringWithFormat:@"%ld",year+i]];
        }
        
        _MouthAry = [[NSArray alloc]initWithObjects:@"1", @"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",nil];
        
        [_pickView selectRow:[_YearAry indexOfObject:[NSString stringWithFormat:@"%ld",year]] inComponent:0 animated:YES];
        [_pickView selectRow:[_MouthAry indexOfObject:[NSString stringWithFormat:@"%ld",month]] inComponent:1 animated:YES];
        
        _selectDateString = [NSString stringWithFormat:@"%ld-%ld",year,month];
        
}
    
    return self;
}

//自定义每个pickerView的label
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    UILabel *pickerLabel = [UILabel new];
    pickerLabel.numberOfLines = 0;
    pickerLabel.textAlignment = NSTextAlignmentCenter;
    pickerLabel.font = [UIFont systemFontOfSize:mainTitleSize+1];
    pickerLabel.text = [self pickerView:pickerView titleForRow:row forComponent:component];
    
    return pickerLabel;
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {//刷新
        [pickerView selectRow:0 inComponent:1 animated:YES];
        [pickerView reloadComponent:1];
    }
    NSInteger yearComponent = [pickerView selectedRowInComponent:0];
    NSInteger monthComponent = [pickerView selectedRowInComponent:1];
    NSString * yearString = [_YearAry objectAtIndex:yearComponent];
    NSString * monthString = [_MouthAry objectAtIndex:monthComponent];
    _selectDateString = [NSString stringWithFormat:@"%@-%@",yearString,monthString];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return _YearAry.count;
    }else if (component == 1){
        return _MouthAry.count;
    }
    return 0;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    
    return 35;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        return [_YearAry objectAtIndex:row];
    }else{
        return [_MouthAry objectAtIndex:row];
    }
}


//取消
- (void) cancelBtnClick{
    __weak typeof (UIView *)blockView = _DTView;
    __weak typeof(self)blockself = self;
    __block int blockH = Height;
    [UIView animateWithDuration:0.3 animations:^{
        CGRect DTf = blockView.frame;
        DTf.origin.y = blockH;
        blockView.frame = DTf;
        blockself.alpha = 0.1;
    }completion:^(BOOL finished) {
        [blockself removeFromSuperview];
    }];
    
}
//选择
- (void) sureBtnClick{
    __weak typeof (UIView *)blockView = _DTView;
    __weak typeof(self)blockself = self;
    __block int blockH = Height;
    
    if (self.sele) {
        self.sele(_selectDateString);
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect DTf = blockView.frame;
        DTf.origin.y = blockH;
        blockView.frame = DTf;
        blockself.alpha = 0.1;
    }completion:^(BOOL finished) {
        [blockself removeFromSuperview];
    }];
    
}

- (void)showDateView:(void (^)(NSString *))selectStr{
    self.sele = selectStr;
    [[[UIApplication sharedApplication] keyWindow] addSubview:self];
    
    __weak typeof (UIView *)blockView = _DTView;
    __block int blockH = Height;
    __block int dtH = DTH;
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect DTf = blockView.frame;
        DTf.origin.y = blockH - dtH;
        blockView.frame = DTf;
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject] locationInView:self];
    if (!CGRectContainsPoint(_DTView.frame, point)) {
        [self cancelBtnClick];
    }
}


@end
