//
//  PhotoViewLayout.m
//  家长界
//
//  Created by mac on 2016/12/31.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "PhotoViewLayout.h"



@implementation PhotoViewLayout
-(id)copyWithZone:(NSZone *)zone
{
    PhotoViewLayout *one = [[PhotoViewLayout alloc]init];
    one.photoCellHeight = self.photoCellHeight;
    one.photoPosition = [self.photoPosition copy];
    
    return one;
}


-(id)initPhotoCellLayout
{
    self = [super init];
    if (self) {
        
        NSArray *arr = @[@"http://ww2.sinaimg.cn/mw690/5f13f24ajw1f2hc1r6j47j20dc0dc0t4.jpg",
                         @"http://ww2.sinaimg.cn/mw690/60718250jw1f2jg46smtmj20go0go77r.jpg"
                       ];
        self.imageArr = arr;
        //发布的图片模型 imgsStorage
        CGFloat imageWidth = (SCREEN_WIDTH - 30.0f)/3.0f;
        NSInteger imageCount = arr.count;
        
        NSMutableArray* imageStorageArray = [[NSMutableArray alloc] initWithCapacity:imageCount];
        NSMutableArray* imagePositionArray = [[NSMutableArray alloc] initWithCapacity:imageCount];
        
        //图片类型
       
            NSInteger row = 0;
            NSInteger column = 0;
            if (imageCount == 1) {
                CGRect imageRect = CGRectMake(leftToMargin,
                                              5.0f + 15.0f + (row * (imageWidth + 5.0f)),
                                              imageWidth*1.7,
                                              imageWidth*1.7);
                NSString* imagePositionString = NSStringFromCGRect(imageRect);
                [imagePositionArray addObject:imagePositionString];
                LWImageStorage* imageStorage = [[LWImageStorage alloc] initWithIdentifier:IMAGE_IDENTIFIER];
                imageStorage.tag = 0;
                imageStorage.clipsToBounds = YES;
                imageStorage.contentMode = UIViewContentModeScaleAspectFill;
                imageStorage.frame = imageRect;
                imageStorage.backgroundColor = RGB(240, 240, 240, 1);
                NSString* URLString = [arr objectAtIndex:0];
                imageStorage.contents = [NSURL URLWithString:URLString];
                [imageStorageArray addObject:imageStorage];
                
            } else {
                for (NSInteger i = 0; i < imageCount; i ++) {
                    CGRect imageRect = CGRectMake(leftToMargin + (column * (imageWidth + 5.0f)),
                                                  5.0f + 15.0f + (row * (imageWidth + 5.0f)),
                                                  imageWidth,
                                                  imageWidth);
                    
                    NSString* imagePositionString = NSStringFromCGRect(imageRect);
                    [imagePositionArray addObject:imagePositionString];
                    LWImageStorage* imageStorage = [[LWImageStorage alloc] initWithIdentifier:IMAGE_IDENTIFIER];
                    imageStorage.clipsToBounds = YES;
                    imageStorage.contentMode = UIViewContentModeScaleAspectFill;
                    imageStorage.tag = i;
                    imageStorage.frame = imageRect;
                    imageStorage.backgroundColor = RGB(240, 240, 240, 1);
                    NSString* URLString = [arr objectAtIndex:i];
                    imageStorage.contents = [NSURL URLWithString:URLString];
                    [imageStorageArray addObject:imageStorage];
                    column = column + 1;
                    if (column > 2) {
                        column = 0;
                        row = row + 1;
                    }
                }
            }
        
        [self addStorages:imageStorageArray];
        
        self.photoPosition = imagePositionArray;
        
        self.photoCellHeight = [self suggestHeightWithBottomMargin:10.0f];
    }
    return self;
}




@end
