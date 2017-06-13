




/********************* 有任何问题欢迎反馈给我 liuweiself@126.com ****************************************/
/***************  https://github.com/waynezxcv/Gallop 持续更新 ***************************/
/******************** 正在不断完善中，谢谢~  Enjoy ******************************************************/




#import "CellLayout.h"
#import "LWTextParser.h"
#import "Gallop.h"
#import "HKPBotView.h"


@implementation CellLayout

- (id)copyWithZone:(NSZone *)zone {
    CellLayout* one = [[CellLayout alloc] init];
    one.statusModel = [self.statusModel copy];
    one.cellHeight = self.cellHeight;
    one.lineRect = self.lineRect;
    one.menuPosition = self.menuPosition;
    one.commentBgPosition = self.commentBgPosition;
    one.avatarPosition = self.avatarPosition;
    one.websitePosition = self.websitePosition;
    one.imagePostions = [self.imagePostions copy];
    return one;
}

//全部展开的cell
- (id)initContentOpendLayoutWithStatusModel:(StatusModel *)statusModel
                                      index:(NSInteger)index
                              dateFormatter:(NSDateFormatter *)dateFormatter {
    
    self = [super init];
    if (self) {
        self.statusModel = statusModel;
        //头像模型 avatarImageStorage
        LWImageStorage* avatarStorage = [[LWImageStorage alloc] initWithIdentifier:AVATAR_IDENTIFIER];
        avatarStorage.contents = statusModel.avatar;
        avatarStorage.cornerRadius = 22.5f;
        avatarStorage.cornerBackgroundColor = [UIColor whiteColor];
        avatarStorage.backgroundColor = [UIColor whiteColor];
        avatarStorage.frame = CGRectMake(10, 20, 45, 45);
        avatarStorage.tag = 9;
        avatarStorage.cornerBorderWidth = 1.0f;
        avatarStorage.cornerBorderColor = [UIColor grayColor];
        
        //名字模型 nameTextStorage
        LWTextStorage* nameTextStorage = [[LWTextStorage alloc] init];
        nameTextStorage.text = statusModel.name;
        nameTextStorage.font = [UIFont fontWithName:@"Heiti SC" size:15.0f];
        nameTextStorage.frame = CGRectMake(60.0f, 20.0f, SCREEN_WIDTH - 80.0f, CGFLOAT_MAX);
        [nameTextStorage lw_addLinkWithData:[NSString stringWithFormat:@"%@",statusModel.name]
                                      range:NSMakeRange(0,statusModel.name.length)
                                  linkColor:RGB(113, 129, 161, 1)
                             highLightColor:RGB(0, 0, 0, 0.15)];
        
        
        //生成时间的模型 dateTextStorage
        LWTextStorage* dateTextStorage = [[LWTextStorage alloc] init];
        dateTextStorage.text = [dateFormatter stringFromDate:statusModel.date];
        dateTextStorage.font = [UIFont fontWithName:@"Heiti SC" size:13.0f];
        dateTextStorage.textColor = [UIColor grayColor];
        dateTextStorage.frame = CGRectMake(nameTextStorage.left,
                                           nameTextStorage.bottom + 3.0f,
                                           SCREEN_WIDTH - 80.0f,
                                           CGFLOAT_MAX);

        
        //正文内容模型 contentTextStorage
        LWTextStorage* contentTextStorage = [[LWTextStorage alloc] init];
        contentTextStorage.text = statusModel.content;
        contentTextStorage.font = [UIFont fontWithName:@"Heiti SC" size:15.0f];
        contentTextStorage.textColor = RGB(40, 40, 40, 1);
        contentTextStorage.frame = CGRectMake(avatarStorage.left,
                                              avatarStorage.bottom + 10.0f,
                                              SCREEN_WIDTH - 20.0f,
                                              CGFLOAT_MAX);
        //解析表情、主题、网址
        [LWTextParser parseEmojiWithTextStorage:contentTextStorage];
        [LWTextParser parseTopicWithLWTextStorage:contentTextStorage
                                        linkColor:RGB(113, 129, 161, 1)
                                   highlightColor:RGB(0, 0, 0, 0.15)];
        [LWTextParser parseHttpURLWithTextStorage:contentTextStorage
                                        linkColor:RGB(113, 129, 161, 1)
                                   highlightColor:RGB(0, 0, 0, 0.15f)];
        
        
        //添加长按复制
        [contentTextStorage lw_addLongPressActionWithData:contentTextStorage.text
                                           highLightColor:RGB(0, 0, 0, 0.25f)];
        

        //发布的图片模型 imgsStorage
        CGFloat imageWidth = (SCREEN_WIDTH - 30.0f)/3.0f;
        NSInteger imageCount = [statusModel.imgs count];
        NSMutableArray* imageStorageArray = [[NSMutableArray alloc] initWithCapacity:imageCount];
        NSMutableArray* imagePositionArray = [[NSMutableArray alloc] initWithCapacity:imageCount];
        //图片类型
        if ([statusModel.type isEqualToString:MESSAGE_TYPE_IMAGE]) {
            NSInteger row = 0;
            NSInteger column = 0;
            if (imageCount == 1) {
                CGRect imageRect = CGRectMake(avatarStorage.left,
                                              contentTextStorage.bottom + 15.0f + (row * (imageWidth + 5.0f)),
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
                NSString* URLString = [statusModel.imgs objectAtIndex:0];
                imageStorage.contents = [NSURL URLWithString:URLString];
                [imageStorageArray addObject:imageStorage];
                
            } else {
                for (NSInteger i = 0; i < imageCount; i ++) {
                    CGRect imageRect = CGRectMake(avatarStorage.left + (column * (imageWidth + 5.0f)),
                                                  contentTextStorage.bottom + 15.0f + (row * (imageWidth + 5.0f)),
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
                    NSString* URLString = [statusModel.imgs objectAtIndex:i];
                    imageStorage.contents = [NSURL URLWithString:URLString];
                    [imageStorageArray addObject:imageStorage];
                    column = column + 1;
                    if (column > 2) {
                        column = 0;
                        row = row + 1;
                    }
                }
            }
        }
        
        //网页链接类型
        else if ([statusModel.type isEqualToString:MESSAGE_TYPE_WEBSITE]) {
            //这个CGRect用来绘制背景颜色
            self.websitePosition = CGRectMake(avatarStorage.left,
                                              contentTextStorage.bottom + 15.0f,
                                              SCREEN_WIDTH - 20.0f,
                                              60.0f);
            
            //左边的图片
            LWImageStorage* imageStorage = [[LWImageStorage alloc] initWithIdentifier:WEBSITE_COVER_IDENTIFIER];
            NSString* URLString = [statusModel.imgs objectAtIndex:0];
            imageStorage.contents = [NSURL URLWithString:URLString];
            imageStorage.clipsToBounds = YES;
            imageStorage.contentMode = UIViewContentModeScaleAspectFill;
            imageStorage.frame = CGRectMake(avatarStorage.left,
                                            contentTextStorage.bottom + 15.0f ,
                                            50.0f,
                                            50.0f);
            [imageStorageArray addObject:imageStorage];
            
            //右边的文字
            LWTextStorage* detailTextStorage = [[LWTextStorage alloc] init];
            detailTextStorage.text = statusModel.detail;
            detailTextStorage.font = [UIFont fontWithName:@"Heiti SC" size:12.0f];
            detailTextStorage.textColor = RGB(40, 40, 40, 1);
            detailTextStorage.frame = CGRectMake(imageStorage.right + 10.0f,
                                                 contentTextStorage.bottom + 15.0f,
                                                 SCREEN_WIDTH - 80.0f,
                                                 60.0f);
            
            detailTextStorage.linespacing = 0.5f;
            [detailTextStorage lw_addLinkForWholeTextStorageWithData:@"https://github.com/waynezxcv/LWAlchemy"
                                                      highLightColor:RGB(0, 0, 0, 0.15)];
            [self addStorage:detailTextStorage];
        }
        
        //视频类型
        else if ([statusModel.type isEqualToString:MESSAGE_TYPE_VIDEO]) {
            //TODO：
            
        }
        
        //获取最后一张图片的模型
        LWImageStorage* lastImageStorage = (LWImageStorage *)[imageStorageArray lastObject];
       
        //菜单按钮
        CGRect menuPosition = CGRectZero;
        if (![statusModel.type isEqualToString:@"video"]) {
            menuPosition = CGRectMake(0,
                                      25.0f + contentTextStorage.bottom,
                                      SCREEN_WIDTH,
                                      45.0f);
            
            if (lastImageStorage) {
                menuPosition = CGRectMake(0,
                                          25.0f + lastImageStorage.bottom,
                                          SCREEN_WIDTH,
                                          45.0f);
            }
        }
        LWImageStorage *backStorge = [[LWImageStorage alloc]init];
        backStorge.frame = CGRectMake(0, menuPosition.origin.y, SCREEN_WIDTH, 45.0f);
        [self addStorage:nameTextStorage];//将Storage添加到遵循LWLayoutProtocol协议的类
        [self addStorage:contentTextStorage];
        [self addStorage:backStorge];
        [self addStorage:dateTextStorage];
        [self addStorage:avatarStorage];
        [self addStorages:imageStorageArray];//通过一个数组来添加storage，使用这个方法
        self.avatarPosition = CGRectMake(10, 20, 45, 45);//头像的位置
        self.menuPosition = menuPosition;//右下角菜单按钮的位置
        self.imagePostions = imagePositionArray;//保存图片位置的数组
        //如果是使用在UITableViewCell上面，可以通过以下方法快速的得到Cell的高度
        self.cellHeight = [self suggestHeightWithBottomMargin:0.0f];
    }
    return self;
    
}

@end
