//
//  SelectView.m
//  SelectCity
//
//  Created by zgq on 16/11/2.
//  Copyright © 2016年 zgq. All rights reserved.
//

#import "AddressSelectView.h"

#define Width self.frame.size.width
#define Height self.frame.size.height

#define BtnW 60
#define toolH 44
#define BJH  SCREEN_WIDTH*0.7
@interface AddressSelectView ()<UIPickerViewDelegate,UIPickerViewDataSource>{
    UIView *_BJView;  //工具栏和pickerView都添加到上面方便管理
    NSArray *_ALLARY; //取出所有数据(json类型，在plist里面)
    NSMutableArray *_ProvinceAry; //装省份数据
    NSMutableArray *_CityAry;     //装城市数据
    NSMutableArray *_DisAry;      //装区（县）的数组
    UIPickerView *_pickView;      //选择器
    
    NSInteger _proIndex;     //选择省份的索引
    NSInteger _cityIndex;    //选择城市的索引
    NSInteger _distrIndex;    //选择区（县）的索引
}

@property (nonatomic ,copy) void(^sele)(NSString *proviceStr,NSString *cityStr,NSString *disStr);

@end

@implementation AddressSelectView

- (instancetype)initWithFrame:(CGRect)rect SelectCityTtitle:(NSString *)title{
    if (self = [super initWithFrame:rect]) {
        _ProvinceAry = [NSMutableArray array];
        _CityAry = [NSMutableArray array];
        _DisAry = [NSMutableArray array];
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        [UIView animateWithDuration:0.3 animations:^{
            self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        }];
        _ALLARY = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Address" ofType:@"plist"]];
        for (NSDictionary *dic in _ALLARY) {
            [_ProvinceAry addObject:[[dic allKeys] firstObject]];
        }
        if (!_ProvinceAry.count) {
            NSLog(@"没有城市相关数据");
        }
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
        
        for (NSDictionary *dic in _ALLARY) {
            if ([dic objectForKey:_ProvinceAry[_proIndex]]) {
                _CityAry = [NSMutableArray arrayWithArray:[[dic objectForKey:_ProvinceAry[_proIndex]] allKeys]];
                [_pickView reloadComponent:1];
                [_pickView selectRow:0 inComponent:1 animated:YES];
                
                _DisAry = [NSMutableArray arrayWithArray:[[dic objectForKey:_ProvinceAry[_proIndex]] objectForKey:_CityAry[0]]];
                [_pickView reloadComponent:2];
                [_pickView selectRow:0 inComponent:2 animated:YES];
            }
        }
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
    return pickerLabel;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
        _proIndex = row;
        _cityIndex = 0;
        _distrIndex = 0;
        for (NSDictionary *dic in _ALLARY) {
            if ([dic objectForKey:_ProvinceAry[_proIndex]]) {
                _CityAry = [NSMutableArray arrayWithArray:[[dic objectForKey:_ProvinceAry[_proIndex]] allKeys]];
                [_pickView reloadComponent:1];
                [pickerView selectRow:0 inComponent:1 animated:YES];
                
                _DisAry = [NSMutableArray arrayWithArray:[[dic objectForKey:_ProvinceAry[_proIndex]] objectForKey:_CityAry[0]]];
                [_pickView reloadComponent:2];
                [_pickView selectRow:0 inComponent:2 animated:YES];
            }
        }
    }
    if (component == 1) {
        _cityIndex = row;
        _distrIndex = 0;
        for (NSDictionary *dic in _ALLARY) {
            if ([dic objectForKey:_ProvinceAry[_proIndex]]) {
                _DisAry = [[dic objectForKey:_ProvinceAry[_proIndex]] objectForKey:_CityAry[_cityIndex]];
                [_pickView reloadComponent:2];
                [_pickView selectRow:0 inComponent:2 animated:YES];
            }
        }
    }
    if (component == 2) {
        _distrIndex = row;
    }
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    
    return 35;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return _ProvinceAry.count;
    }else if (component == 1){
        return _CityAry.count;
    }else if (component == 2){
        return _DisAry.count;
    }
    return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        return [_ProvinceAry objectAtIndex:row];
    }else if (component == 1){
        return [_CityAry objectAtIndex:row];
    }else if (component == 2){
        return [_DisAry objectAtIndex:row];
    }
    return nil;
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
        self.sele(_ProvinceAry[_proIndex],_CityAry[_cityIndex],_DisAry[_distrIndex]);
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

- (void)showCityView:(void (^)(NSString *, NSString *, NSString *))selectStr{
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
