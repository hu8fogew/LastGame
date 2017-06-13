//
//  MSTDViewController.m
//  家长界
//
//  Created by taylor on 2016/12/5.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "MSTDViewController.h"

@interface MSTDViewController ()<UITableViewDelegate,UITableViewDataSource,WYAutoCaruselDelegate>

/*tableView*/
@property (strong,nonatomic) UITableView *tableView;

/*tableView的headerView*/
@property (strong,nonatomic) UIView *headerView;

/*轮播数组*/
@property (strong,nonatomic) NSMutableArray *lunBoArr;

/*筛选视图*/
@property (strong,nonatomic) UIView *siftView;

@property (strong,nonatomic) UIButton *btn1;
@property (strong,nonatomic) UIButton *btn2;
@property (strong,nonatomic) UIButton *btn3;
@property (strong,nonatomic) UIButton *btn4;
@property (strong,nonatomic) UIButton *btn5;

/*筛选按钮数组*/
@property (strong,nonatomic) NSMutableArray *buttonArray;

@end

@implementation MSTDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];
    
    [self createAdsPageWithArr:self.lunBoArr];

}

#pragma mark -----懒加载-----

-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, lunBoheight+5)];
        _headerView.backgroundColor = [UIColor whiteColor];
    }
    return _headerView;
}

-(NSMutableArray *)lunBoArr{
    if (!_lunBoArr) {
        _lunBoArr = [DataBase addSelecteArray];
    }
    return _lunBoArr;
}


-(UIView *)siftView{
    if (!_siftView) {
        _siftView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 40)];
        _siftView.backgroundColor = [UIColor whiteColor];
        
        NSArray *titleArray = @[@"城市",@"价格",@"美食",@"选择",@"排序"];
        _buttonArray = [NSMutableArray array];
        for (int i = 0; i<titleArray.count; i++) {
            
            UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
            bt.frame = CGRectMake(SCREEN_WIDTH/titleArray.count*i,0,SCREEN_WIDTH/titleArray.count-1, 40-1);
            [bt setTitle:titleArray[i] forState:UIControlStateNormal];
            [bt setTitleEdgeInsets: UIEdgeInsetsMake(0,-12 , 0, 12)];
            [bt setImageEdgeInsets:UIEdgeInsetsMake(0, 38, 0, -38)];
            [bt setImage:[UIImage imageNamed:@"icon_down"] forState:UIControlStateNormal];
            [bt setImage:[UIImage imageNamed:@"icon_up"] forState:UIControlStateSelected];
            [bt setTitleColor:HWColor(153, 153, 153) forState:UIControlStateNormal];
            [bt setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
            bt.selected = NO;
            bt.tag = i;
            [bt addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            [_buttonArray addObject:bt];
            
            if (bt.tag == 0) {
                self.btn1 = bt;
            }
            else if (bt.tag == 1){
                self.btn2 = bt;
            }
            else if (bt.tag == 2){
                self.btn3 = bt;
            }
            else if (bt.tag == 3){
                self.btn4 = bt;
            }
            else{
                self.btn5 = bt;
            }
            
            for (int j = 1; j < 5; j++) {
                UIView *view = [UIView new];
                view.frame = CGRectMake(j*(SCREEN_WIDTH/titleArray.count-1), 8, 1, 24);
                view.backgroundColor = HWColor(241, 241, 241);
                
                [_siftView addSubview:view];
            }
            
            [_siftView addSubview:bt];
        }

    }
    return _siftView;
}


#pragma mark /*********轮播图的实现*******/
-(void)createAdsPageWithArr:(NSMutableArray *)source
{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (NSDictionary *dic in source) {
        [arr addObject:[dic objectForKey:@"slecteImg"]];
    }
    //封装的轮播view实现
    WYAutoCarusel *aut = [[WYAutoCarusel alloc]init];
    [aut createCaruselWithFrame:CGRectMake(0, 5, SCREEN_WIDTH, lunBoheight) WithSuperView:self.headerView WithImageUrlArr:arr WithPlaceholderImageName:@"1" WithInterval:2];
    
    [aut createPageControlWithFrame:CGRectMake(SCREEN_WIDTH-60, lunBoheight-30, 30, 20) WithSuperView:self.headerView WithPageNum:arr.count WithCurrentColor:HWColor(248, 114, 1) WithTintColor:[UIColor whiteColor]];
    
    aut.delegate = self;
}

-(void)pushViewController:(NSInteger)tag{
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offset = self.tableView.contentOffset.y;
    if (offset >lunBoheight) {
        HWLog(@"开始显示");
        [UIView animateWithDuration:0.1 animations:^{
            [self.view addSubview:self.siftView];

        }];
    }
    else{
        [UIView animateWithDuration:0.1 animations:^{
            [self.siftView removeFromSuperview];
        }];
    }
}

-(void)buttonAction:(UIButton *)sender{
    sender.selected = !sender.selected;
    switch (sender.tag) {
        case 0:
            self.btn2.selected = NO;
            self.btn3.selected = NO;
            self.btn4.selected = NO;
            self.btn5.selected = NO;
            break;
        case 1:
            self.btn1.selected = NO;
            self.btn3.selected = NO;
            self.btn4.selected = NO;
            self.btn5.selected = NO;
            break;
        case 2:
            self.btn1.selected = NO;
            self.btn2.selected = NO;
            self.btn4.selected = NO;
            self.btn5.selected = NO;
            break;
        case 3:
            self.btn1.selected = NO;
            self.btn2.selected = NO;
            self.btn3.selected = NO;
            self.btn5.selected = NO;
            break;
        default:
            self.btn1.selected = NO;
            self.btn2.selected = NO;
            self.btn3.selected = NO;
            self.btn4.selected = NO;
            break;
    }
}

#pragma mark =====tableview及方法======

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height = self.headerView.height;
    }
    return _tableView;
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return SCREEN_WIDTH*0.46;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"identifier";
        YSYKTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[YSYKTableViewCell alloc]initWithFrame:cell.bounds];
            cell.backgroundColor = HWColor(241, 241, 241);
            cell.imgView.image = [UIImage imageNamed:@"cellView"];
            cell.titleLabel.text = @"鲜生活*喵小春的鱼";
            cell.addressLabel.text = @"大雁塔";
            cell.typeLabel.text = @"中餐";
            cell.parkIcon.image = [UIImage imageNamed:@"p"];
            cell.wifiIcon.image = [UIImage imageNamed:@"WiFi"];
            cell.priceLabel.text = @"￥39";
            cell.priceLabel.textColor = HWColor(253, 151, 46);
            cell.averageLabel.text = @"人均 :";
            cell.averageLabel.textColor = HWColor(51, 51, 51);
            cell.distanceLabel.text = @"2.3km";
            cell.firstIcon.image = [UIImage imageNamed:@"金币"];
            cell.firstLabel.text = @"10通币冲抵1元";
            cell.secondIcon.image = [UIImage imageNamed:@"优惠"];
            cell.secondLabel.text = @"每满10减1（买单立享）";
        
        }
    
    return cell;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
