//
//  QPTCommonAPIConstant.m
//  QiPinTong
//
//  Created by 企聘通 on 2017/4/6.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "QPTCommonAPIConstant.h"

@implementation QPTCommonAPIConstant


/**
 获取首页接口数据
 */
NSString *const QPTHomeSevericeAPI = @"http://auth.qipintong.com/svc/home.ashx";


/**
 企聘通服务器的地址
 */
NSString *const QPTSevericeHeaderAPI = @"http://weixin.qipintong.com";


//http://weixin.qipintong.com/assets/js/kindeditor/attached/image/20170414/41fd83e1e5007389d135fef67de57ae4.jpg

//http://weixin.qipintong.com/news/newdetail.aspx?id=156


/**
 获取微信token
 */
NSString *const QPTGETWX_access_tokenAPI = @"https://api.weixin.qq.com/sns/oauth2/access_token?";


/**
 获取微信用户信息
 */
NSString *const QPTGETWX_PersonInformationAPI = @"https://api.weixin.qq.com/sns/userinfo?";

@end
