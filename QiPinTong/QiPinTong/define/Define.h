//
//  Define.h
//  家长界
//
//  Created by mac on 16/11/4.
//  Copyright © 2016年 haha😄. All rights reserved.
//

#ifndef Define_h
#define Define_h

#define Kwidth self.view.frame.size.width
#define Kheight self.view.frame.size.height
#define  NewsPath @"http://c.m.163.com/nc/video/home/%zd-10.html"


/**
 添加观察者
 */
#define QPTNotificationCenter [NSNotificationCenter defaultCenter]

/**
 用户设置管理者
 */
#define QPTUserDefaults [NSUserDefaults standardUserDefaults]
/**窗口中心*/
#define WindowCenter    [UIApplication sharedApplication].keyWindow.center

/*字体尺寸*/
//主标题大小
#define MTitleSize [[StringSizeManager shareStringManager] mTitleSize]
//副标题大小
#define subTitleSize [[StringSizeManager shareStringManager] suTitleSize]

/**表单列表cell高度*/
#define formCellHeight 45

/**保存、添加等按钮高度*/
#define formBtnHeight 45

/*-------企聘通cell图像尺寸-------*/
//对应四行文字
#define MainImageSize CGSizeMake(SCREEN_WIDTH*0.23, SCREEN_WIDTH*0.23)
//对应三行文字
#define SubImageSize CGSizeMake(SCREEN_WIDTH*0.18, SCREEN_WIDTH*0.18)
//对应两行文字
#define DeImageSize CGSizeMake(SCREEN_WIDTH*0.13, SCREEN_WIDTH*0.13)

/*-------企聘通cell高度-------*/
//对应四行文字
#define MainCellHeight SCREEN_WIDTH*0.33
//对应三行文字
#define SubCellHeight SCREEN_WIDTH*0.28
//对应两行文字
#define DeCellHeight SCREEN_WIDTH*0.23


/*视图尺寸*/
//搜索框高度
#define searchHeight [[StringSizeManager shareStringManager] searchBarSize]
//轮播高度
#define LBHeight [[StringSizeManager shareStringManager] lunboSize]
//选择按钮
#define seleBarHeight [[StringSizeManager shareStringManager] seleButtonSize]

/*家长课堂的cell高度*/
#define ParentCellHeight 130
/*cell之间的间距*/
#define DistanceForCell 10
/*筛选条的高度*/
#define siftHeight 45
/*轮播条目的高度*/
#define lunBoheight SCREEN_HEIGHT*0.24
/*选择按钮的一行高度*/
#define selecteButtonHeight 110

/*问题主标题的高度*/
#define quesMainTextView 70

/*企聘通的职位和介绍的cell高度*/
#define qptZWcellHeight SCREEN_WIDTH*0.48

/*兼职的cell高度*/
#define qptJZcellHeight SCREEN_WIDTH*0.35

#define searchViewHeight SCREEN_WIDTH*0.15


//评论中的个人名称的字体大小
#define CommentNameFont [UIFont systemFontOfSize:14]
//问题主标题的大小
#define MainQuestionFont [UIFont systemFontOfSize:17]

//正文的大小
#define MainAnswerFont [UIFont systemFontOfSize:15]
//日期大小
#define dateFont [UIFont systemFontOfSize:13]

#define mainTitleSize 15
#define descTitleSize 13
//左边边距
#define leftToMargin 10
//顶边距
#define topToMargin 15
//头像大小
#define imageWH 40


//打印NSLog的另一种写法
#ifdef DEBUG // 处于开发阶段
#define HWLog(...) NSLog(__VA_ARGS__)
#else // 处于发布阶段
#define HWLog(...)
#endif

// RGB颜色
#define HWColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

//主标题的颜色
#define MainColor HWColor(51.0f, 51.0f, 51.0f)

#define deepGrayColor HWColor(102.0f, 102.0f, 102.0f)
//父文本颜色
#define SecondTitleColor HWColor(153.0f, 153.0f, 153.0f)
//白色
#define whiteC [UIColor whiteColor]
//透明
#define clearC [UIColor clearColor]

//头像边框颜色
#define headerImgColor [UIColor colorWithWhite:0 alpha:0.5]

/**
 橙色
 */
#define orangeC HWColor(255.0f, 152.0f, 24.0f)

/**
 灰色背景
 */
#define grayC HWColor(241.0f, 241.0f, 241.0f)
/**
蓝色
 */
#define blueC HWColor(1, 147, 221)
/**
 灰蓝色
 */
#define grayBlueC HWColor(94, 115, 134)

/**
 深蓝色
 */
#define deepBlueC HWColor(26, 114, 185)

//红色
#define redC HWColor(238, 0, 0)

//打赏
#define deepRed HWColor(114.0f, 26.0f, 34.0f)//红色
#define grayOragin HWColor(241.0f, 188.0f, 120.0f)//黄色

// 随机色
#define HWRandomColor HWColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
#endif /* Define_h */

//获取当前应用视窗
#define KEYWINDOW [UIApplication sharedApplication].keyWindow

//弱引用
#define WeakSelf  __weak __typeof(&*self)weakSelf = self;


#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
//是否为iOS8及以上系统
#define iOS8 ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)

#define iOS10 ([[UIDevice currentDevice].systemVersion doubleValue] >= 10.0)

/**
 *define:获取屏幕的宽
 */
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width


/**
 *define:获取屏幕的高
 */
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
