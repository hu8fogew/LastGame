




/********************* 有任何问题欢迎反馈给我 liuweiself@126.com ****************************************/
/***************  https://github.com/waynezxcv/Gallop 持续更新 ***************************/
/******************** 正在不断完善中，谢谢~  Enjoy ******************************************************/




#import "CellLayout.h"
#import "LWTextParser.h"
#import "Gallop.h"
#import "HKPBotView.h"
#import "CommentModel.h"

@implementation CellLayout

- (id)copyWithZone:(NSZone *)zone {
    CellLayout* one = [[CellLayout alloc] init];
    one.statusModel = [self.statusModel copy];
    one.cellHeight = self.cellHeight;
    one.lineRect = self.lineRect;
    one.menuPosition = self.menuPosition;
    one.likePosition = self.likePosition;
    one.commentPosition = self.commentPosition;
    
    one.buttPosition = self.buttPosition;
    one.commentBgPosition = self.commentBgPosition;
    one.avatarPosition = self.avatarPosition;
    one.websitePosition = self.websitePosition;
    one.deleteFrame = self.deleteFrame;
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
//        avatarStorage.cornerRadius = 22.5f;
        avatarStorage.cornerBackgroundColor = whiteC;
        avatarStorage.backgroundColor = whiteC;
        avatarStorage.frame = CGRectMake(10, 20, userHeaderImage, userHeaderImage);
        avatarStorage.tag = 9;
        avatarStorage.cornerBorderWidth = 1.0f;
        avatarStorage.cornerBorderColor = whiteC;
        
        //名字模型 nameTextStorage
        LWTextStorage* nameTextStorage = [[LWTextStorage alloc] init];
        nameTextStorage.text = statusModel.name;
        nameTextStorage.font = [UIFont systemFontOfSize:mainTitleSize];
        nameTextStorage.frame = CGRectMake(60.0f, 20.0f, SCREEN_WIDTH - 80.0f, CGFLOAT_MAX);
        [nameTextStorage lw_addLinkWithData:[NSString stringWithFormat:@"%@",statusModel.name]
                                      range:NSMakeRange(0,statusModel.name.length)
                                  linkColor:grayBlueC
                             highLightColor:RGB(0, 0, 0, 0.15)];
        
        
        //生成时间的模型 dateTextStorage
        LWTextStorage* dateTextStorage = [[LWTextStorage alloc] init];
        dateTextStorage.text = [dateFormatter stringFromDate:statusModel.date];
        dateTextStorage.font = [UIFont systemFontOfSize:descTitleSize];
        dateTextStorage.textColor = SecondTitleColor;
        dateTextStorage.frame = CGRectMake(nameTextStorage.left,
                                           avatarStorage.top+avatarStorage.height/2 + 5.0f,
                                           SCREEN_WIDTH - 80.0f,
                                           CGFLOAT_MAX);
        
        
        
        CGRect deleteFrame = CGRectZero;
        if (statusModel.statusID.intValue%2 == 0 && statusModel.statusID.intValue%3 == 0) {
            deleteFrame = CGRectMake(SCREEN_WIDTH-30, nameTextStorage.top, 20, 20);
        }else
        {
            deleteFrame = CGRectZero;
        }
        
        
        
        //正文内容模型 contentTextStorage
        LWTextStorage* contentTextStorage = [[LWTextStorage alloc] init];
        contentTextStorage.text = statusModel.content;
        contentTextStorage.font = [UIFont systemFontOfSize:mainTitleSize];
        contentTextStorage.linespacing = 5.0f;
        contentTextStorage.textColor = MainColor;
        contentTextStorage.frame = CGRectMake(nameTextStorage.left,
                                              avatarStorage.bottom + 10.0f,
                                              SCREEN_WIDTH - nameTextStorage.left-10.0f,
                                              CGFLOAT_MAX);
        //解析表情、主题、网址
        [LWTextParser parseEmojiWithTextStorage:contentTextStorage];
        [LWTextParser parseTopicWithLWTextStorage:contentTextStorage
                                        linkColor:grayBlueC
                                   highlightColor:RGB(0, 0, 0, 0.15)];
        [LWTextParser parseHttpURLWithTextStorage:contentTextStorage
                                        linkColor:grayBlueC
                                   highlightColor:RGB(0, 0, 0, 0.15f)];
        
        
        //添加长按复制
        [contentTextStorage lw_addLongPressActionWithData:contentTextStorage.text
                                           highLightColor:RGB(0, 0, 0, 0.25f)];
        

        //发布的图片模型 imgsStorage
        CGFloat imageWidth = (SCREEN_WIDTH - nameTextStorage.left-30)/3.0f;
        NSInteger imageCount = [statusModel.imgs count];
        NSMutableArray* imageStorageArray = [[NSMutableArray alloc] initWithCapacity:imageCount];
        NSMutableArray* imagePositionArray = [[NSMutableArray alloc] initWithCapacity:imageCount];
        //图片类型
        if ([statusModel.type isEqualToString:MESSAGE_TYPE_IMAGE]) {
            NSInteger row = 0;
            NSInteger column = 0;
            if (imageCount == 1) {
                CGRect imageRect = CGRectMake(nameTextStorage.left,
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
                    CGRect imageRect = CGRectMake(nameTextStorage.left + (column * (imageWidth + 5.0f)),
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
            self.websitePosition = CGRectMake(nameTextStorage.left,
                                              contentTextStorage.bottom + 15.0f,
                                              contentTextStorage.width,
                                              60.0f);
            
            //左边的图片
            LWImageStorage* imageStorage = [[LWImageStorage alloc] initWithIdentifier:WEBSITE_COVER_IDENTIFIER];
            NSString* URLString = [statusModel.imgs objectAtIndex:0];
            imageStorage.contents = [NSURL URLWithString:URLString];
            imageStorage.clipsToBounds = YES;
            imageStorage.contentMode = UIViewContentModeScaleAspectFill;
            imageStorage.frame = CGRectMake(nameTextStorage.left,
                                            contentTextStorage.bottom + 20.0f ,
                                            50.0f,
                                            50.0f);
            [imageStorageArray addObject:imageStorage];
            
            //右边的文字
            LWTextStorage* detailTextStorage = [[LWTextStorage alloc] init];
            detailTextStorage.text = statusModel.detail;
            detailTextStorage.font = [UIFont systemFontOfSize:descTitleSize];
            detailTextStorage.textColor = MainColor;
            detailTextStorage.frame = CGRectMake(imageStorage.right + 10.0f,
                                                 contentTextStorage.bottom + 20.0f,
                                                 contentTextStorage.width-imageStorage.left-10,
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
        
        //地图图标
        LWImageStorage *mapImg = [[LWImageStorage alloc]init];
        mapImg.frame = CGRectMake(nameTextStorage.left, menuPosition.origin.y, 15, 15);
        mapImg.contents = [UIImage imageNamed:@"locationIcon"];
        
        [self addStorage:mapImg];
        //地址
        LWTextStorage *mapText = [self createTextWithFrame:CGRectMake(mapImg.right+5, mapImg.top+1, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:grayBlueC andTextFont:descTitleSize];
        mapText.text = @"西安-阎良区";
        
        
        NSString *strAward = @"5人已打赏通币";
        
        NSString *awardString = @"打赏通币";
        
        CGSize awardSize = [strAward sizeWithFont:[UIFont systemFontOfSize:descTitleSize] maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
        
        LWTextStorage *awardText = [self createTextWithFrame:CGRectMake(SCREEN_WIDTH-awardSize.width-15, mapText.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:grayBlueC andTextFont:descTitleSize];
        awardText.text = strAward;
        [awardText lw_addLinkWithData:[NSString stringWithFormat:@"%@",awardString]
                                      range:NSMakeRange(0,strAward.length)
                                  linkColor:grayBlueC
                             highLightColor:RGB(0, 0, 0, 0.15)];
        
        
        
        LWImageStorage *awardImg = [[LWImageStorage alloc]init];
        awardImg.contents = [UIImage imageNamed:@"give_tongbi"];
        
        awardImg.frame = CGRectMake(awardText.left-20, mapImg.top, 15, 15);
        [self addStorage:awardImg];
        
        LWImageStorage *lineG = [[LWImageStorage alloc]init];
        lineG.contents = [UIImage imageNamed:@"line_icon_image"];
        
        lineG.frame = CGRectMake(0, mapImg.bottom+10, SCREEN_WIDTH, 1.0f);
        [self addStorage:lineG];
        
        LWImageStorage *backStorge = [[LWImageStorage alloc]init];
        backStorge.frame = CGRectMake(0, lineG.bottom+1.0f, SCREEN_WIDTH, 45.0f);
        
        self.buttPosition = backStorge.frame;
        
        LWImageStorage *lineT = [[LWImageStorage alloc]init];
        lineT.contents = [UIImage imageNamed:@"line_icon_image"];
        
        lineT.frame = CGRectMake(0, backStorge.bottom, SCREEN_WIDTH, DistanceForCell);
        [self addStorage:lineT];
        
        [self addStorage:nameTextStorage];//将Storage添加到遵循LWLayoutProtocol协议的类
        [self addStorage:contentTextStorage];
        [self addStorage:backStorge];
        [self addStorage:dateTextStorage];
        [self addStorage:avatarStorage];
        [self addStorages:imageStorageArray];//通过一个数组来添加storage，使用这个方法
        self.deleteFrame = deleteFrame;
        self.avatarPosition = CGRectMake(10, 20, 45, 45);//头像的位置
        self.menuPosition = menuPosition;//右下角菜单按钮的位置
        self.imagePostions = imagePositionArray;//保存图片位置的数组
        //如果是使用在UITableViewCell上面，可以通过以下方法快速的得到Cell的高度
        self.cellHeight = [self suggestHeightWithBottomMargin:0.0f];
    }
    return self;
    
}





//评论layout
- (id)initCommentLayoutWithStatusModel:(StatusModel *)statusModel
                                      index:(NSInteger)index
                              dateFormatter:(NSDateFormatter *)dateFormatter {
    
    self = [super init];
    if (self) {
        self.statusModel = statusModel;
        //头像模型 avatarImageStorage
        LWImageStorage* avatarStorage = [[LWImageStorage alloc] initWithIdentifier:AVATAR_IDENTIFIER];
        avatarStorage.contents = statusModel.avatar;
        //        avatarStorage.cornerRadius = 22.5f;
        avatarStorage.cornerBackgroundColor = whiteC;
        avatarStorage.backgroundColor = whiteC;
        avatarStorage.frame = CGRectMake(10, 20, userHeaderImage, userHeaderImage);
        avatarStorage.tag = 9;
        avatarStorage.cornerBorderWidth = 1.0f;
        avatarStorage.cornerBorderColor = whiteC;
        
        //名字模型 nameTextStorage
        LWTextStorage* nameTextStorage = [[LWTextStorage alloc] init];
        nameTextStorage.text = statusModel.name;
        nameTextStorage.font = [UIFont systemFontOfSize:mainTitleSize];
        nameTextStorage.frame = CGRectMake(60.0f, 20.0f, SCREEN_WIDTH - 80.0f, CGFLOAT_MAX);
        [nameTextStorage lw_addLinkWithData:[NSString stringWithFormat:@"%@",statusModel.name]
                                      range:NSMakeRange(0,statusModel.name.length)
                                  linkColor:grayBlueC
                             highLightColor:RGB(0, 0, 0, 0.15)];
        
        
        //生成时间的模型 dateTextStorage
        LWTextStorage* dateTextStorage = [[LWTextStorage alloc] init];
        dateTextStorage.text = [dateFormatter stringFromDate:statusModel.date];
        dateTextStorage.font = [UIFont systemFontOfSize:descTitleSize];
        dateTextStorage.textColor = SecondTitleColor;
        dateTextStorage.frame = CGRectMake(nameTextStorage.left,
                                           avatarStorage.top+avatarStorage.height/2 + 5.0f,
                                           SCREEN_WIDTH - 80.0f,
                                           CGFLOAT_MAX);
        
        
        
        CGRect deleteFrame = CGRectZero;
        if (statusModel.statusID.intValue%2 == 0 && statusModel.statusID.intValue%3 == 0) {
            deleteFrame = CGRectMake(SCREEN_WIDTH-30, nameTextStorage.top, 20, 20);
        }else
        {
            deleteFrame = CGRectZero;
        }
        
        
        
        //正文内容模型 contentTextStorage
        LWTextStorage* contentTextStorage = [[LWTextStorage alloc] init];
        contentTextStorage.text = statusModel.content;
        contentTextStorage.font = [UIFont systemFontOfSize:mainTitleSize];
        contentTextStorage.linespacing = 5.0f;
        contentTextStorage.textColor = MainColor;
        contentTextStorage.frame = CGRectMake(nameTextStorage.left,
                                              avatarStorage.bottom + 10.0f,
                                              SCREEN_WIDTH - nameTextStorage.left-10.0f,
                                              CGFLOAT_MAX);
        //解析表情、主题、网址
        [LWTextParser parseEmojiWithTextStorage:contentTextStorage];
        [LWTextParser parseTopicWithLWTextStorage:contentTextStorage
                                        linkColor:grayBlueC
                                   highlightColor:RGB(0, 0, 0, 0.15)];
        [LWTextParser parseHttpURLWithTextStorage:contentTextStorage
                                        linkColor:grayBlueC
                                   highlightColor:RGB(0, 0, 0, 0.15f)];
        
        
        //添加长按复制
        [contentTextStorage lw_addLongPressActionWithData:contentTextStorage.text
                                           highLightColor:RGB(0, 0, 0, 0.25f)];
        
        
        //发布的图片模型 imgsStorage
        CGFloat imageWidth = (SCREEN_WIDTH - nameTextStorage.left-30)/3.0f;
        NSInteger imageCount = [statusModel.imgs count];
        NSMutableArray* imageStorageArray = [[NSMutableArray alloc] initWithCapacity:imageCount];
        NSMutableArray* imagePositionArray = [[NSMutableArray alloc] initWithCapacity:imageCount];
        //图片类型
        if ([statusModel.type isEqualToString:MESSAGE_TYPE_IMAGE]) {
            NSInteger row = 0;
            NSInteger column = 0;
            if (imageCount == 1) {
                CGRect imageRect = CGRectMake(nameTextStorage.left,
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
                    CGRect imageRect = CGRectMake(nameTextStorage.left + (column * (imageWidth + 5.0f)),
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
            self.websitePosition = CGRectMake(nameTextStorage.left,
                                              contentTextStorage.bottom + 15.0f,
                                              contentTextStorage.width,
                                              60.0f);
            
            //左边的图片
            LWImageStorage* imageStorage = [[LWImageStorage alloc] initWithIdentifier:WEBSITE_COVER_IDENTIFIER];
            NSString* URLString = [statusModel.imgs objectAtIndex:0];
            imageStorage.contents = [NSURL URLWithString:URLString];
            imageStorage.clipsToBounds = YES;
            imageStorage.contentMode = UIViewContentModeScaleAspectFill;
            imageStorage.frame = CGRectMake(nameTextStorage.left,
                                            contentTextStorage.bottom + 20.0f ,
                                            50.0f,
                                            50.0f);
            [imageStorageArray addObject:imageStorage];
            
            //右边的文字
            LWTextStorage* detailTextStorage = [[LWTextStorage alloc] init];
            detailTextStorage.text = statusModel.detail;
            detailTextStorage.font = [UIFont systemFontOfSize:descTitleSize];
            detailTextStorage.textColor = MainColor;
            detailTextStorage.frame = CGRectMake(imageStorage.right + 10.0f,
                                                 contentTextStorage.bottom + 20.0f,
                                                 contentTextStorage.width-imageStorage.left-10,
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
        
        //地图图标
        LWImageStorage *mapImg = [[LWImageStorage alloc]init];
        mapImg.frame = CGRectMake(nameTextStorage.left, menuPosition.origin.y, 15, 15);
        mapImg.contents = [UIImage imageNamed:@"locationIcon"];
        
        [self addStorage:mapImg];
        //地址
        LWTextStorage *mapText = [self createTextWithFrame:CGRectMake(mapImg.right+5, mapImg.top+1, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:grayBlueC andTextFont:descTitleSize];
        mapText.text = @"西安-阎良区";
        
        
        NSString *strAward = @"5人已打赏通币";
        NSString *awardString = @"打赏通币";
        CGSize awardSize = [strAward sizeWithFont:[UIFont systemFontOfSize:descTitleSize] maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
        
        LWTextStorage *awardText = [self createTextWithFrame:CGRectMake(SCREEN_WIDTH-awardSize.width-15, mapText.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:grayBlueC andTextFont:descTitleSize];
        awardText.text = strAward;
        
        
        [awardText lw_addLinkWithData:[NSString stringWithFormat:@"%@",awardString]
                                range:NSMakeRange(0,strAward.length)
                            linkColor:grayBlueC
                       highLightColor:RGB(0, 0, 0, 0.15)];
        
        
        LWImageStorage *awardImg = [[LWImageStorage alloc]init];
        awardImg.contents = [UIImage imageNamed:@"give_tongbi"];
        
        awardImg.frame = CGRectMake(awardText.left-20, mapImg.top, 15, 15);
        [self addStorage:awardImg];
        
        //菜单按钮
        self.menuPosition = CGRectMake(SCREEN_WIDTH-54.0f, awardImg.bottom+10.0f, 44.0f, 44.0f);
        
        CGRect likeButtonFrame = CGRectMake(SCREEN_WIDTH-148, awardImg.bottom+10.0f, 44.0f, 44.0f);
        self.likePosition = likeButtonFrame;
        CGRect commentButtonFrame = CGRectMake(SCREEN_WIDTH-99, awardImg.bottom+10.0f, 44.0f, 44.0f);
        self.commentPosition = commentButtonFrame;
        
        
        
        LWImageStorage *lineG = [[LWImageStorage alloc]init];
        lineG.contents = [UIImage imageNamed:@"line_icon_image"];
        
        lineG.frame = CGRectMake(0, self.menuPosition.origin.y+self.menuPosition.size.height+10, SCREEN_WIDTH, 1.0f);
        [self addStorage:lineG];
        
        
        //生成评论背景
        LWImageStorage* commentBgStorage = [[LWImageStorage alloc] init];
        NSArray* commentTextStorages = @[];
        CGRect commentBgPosition = CGRectZero;
        CGRect rect = CGRectMake(avatarStorage.left,
                                 lineG.bottom + 10.0f,
                                 SCREEN_WIDTH - 25,
                                 20);
        
        CGFloat offsetY = 0.0f;
        //点赞
        LWImageStorage* likeImageSotrage = [[LWImageStorage alloc] init];
        LWTextStorage* likeTextStorage = [[LWTextStorage alloc] init];
        LWImageStorage *whiteImg = [[LWImageStorage alloc]init];
        if (statusModel.likeList.count != 0) {
            likeImageSotrage.contents = [UIImage imageNamed:@"Like"];
            likeImageSotrage.frame = CGRectMake(rect.origin.x + 0.0f,
                                                rect.origin.y + offsetY,
                                                25.0f,
                                                25.0f);
            
            NSMutableString* mutableString = [[NSMutableString alloc] init];
            NSMutableArray* composeArray = [[NSMutableArray alloc] init];
            
            int rangeOffset = 0;
            for (NSInteger i = 0;i < statusModel.likeList.count; i ++) {
                NSString* liked = statusModel.likeList[i];
                [mutableString appendString:liked];
                NSRange range = NSMakeRange(rangeOffset, liked.length);
                [composeArray addObject:[NSValue valueWithRange:range]];
                rangeOffset += liked.length;
                if (i != statusModel.likeList.count - 1) {
                    NSString* dotString = @",";
                    [mutableString appendString:dotString];
                    rangeOffset += 1;
                }
            }
            
            likeTextStorage.text = mutableString;
            likeTextStorage.font = [UIFont systemFontOfSize:mainTitleSize];
            likeTextStorage.frame = CGRectMake(likeImageSotrage.right + 5.0f,
                                               rect.origin.y + 3.0f,
                                               SCREEN_WIDTH - 110.0f,
                                               CGFLOAT_MAX);
            
            for (NSValue* rangeValue in composeArray) {
                NSRange range = [rangeValue rangeValue];
                CommentModel* commentModel = [[CommentModel alloc] init];
                commentModel.to = [likeTextStorage.text substringWithRange:range];
                commentModel.index = index;
                [likeTextStorage lw_addLinkWithData:commentModel
                                              range:range
                                          linkColor:grayBlueC
                                     highLightColor:RGB(0, 0, 0, 0.15)];
            }
            offsetY += likeTextStorage.height + 5.0f;
            
            
            whiteImg.contents = [UIImage imageNamed:@""];
            
            whiteImg.backgroundColor = whiteC;
            
            whiteImg.frame = CGRectMake(0, likeImageSotrage.bottom+5, SCREEN_WIDTH, 5);
            
            [self addStorage:whiteImg];
            
        }
        
        

        //评论
        LWImageStorage *comImage = [[LWImageStorage alloc]init];
        LWTextStorage* commentTextStorage = [[LWTextStorage alloc] init];
        LWTextStorage *comName = nil;
        
        if (statusModel.commentList.count != 0 &&
            statusModel.commentList != nil) {
            if (statusModel.likeList.count != 0) {
                self.lineRect = CGRectMake(likeTextStorage.left,
                                           likeTextStorage.bottom + 2.5f,
                                           SCREEN_WIDTH - 80,
                                           0.1f);
            }
            
            NSMutableArray* tmp = [[NSMutableArray alloc] initWithCapacity:statusModel.commentList.count];
            for (NSDictionary* commentDict in statusModel.commentList) {
                NSString* to = commentDict[@"to"];
                if (to.length != 0) {
//                    NSString* commentString = [NSString stringWithFormat:@"%@回复%@:%@",
//                                               commentDict[@"from"],
//                                               commentDict[@"to"],
//                                               commentDict[@"content"]];
                    //评论
                    comImage.contents = statusModel.avatar;
                    
                    comImage.frame = CGRectMake(likeImageSotrage.left, whiteImg.bottom + offsetY, userHeaderImage-10, userHeaderImage-10);
                    
                    comImage.cornerBorderColor = whiteC;
                    comImage.cornerBorderWidth = 0.5;
                    
                    
                    LWTextStorage *comN = [self createTextWithFrame:CGRectMake(comImage.right+10.0f,
                                                                                  rect.origin.y + 10.0f + offsetY,
                                                                                  SCREEN_WIDTH - 95.0f,
                                                                                  CGFLOAT_MAX) andTextColor:grayBlueC andTextFont:mainTitleSize];
                    comN = commentDict[@"from"];
                    
                    comName = comN;
                    
                    
                    
                    
//                    LWTextStorage* commentTextStorage = [[LWTextStorage alloc] init];
                    commentTextStorage.text = commentDict[@"content"];
                    commentTextStorage.font = [UIFont systemFontOfSize:descTitleSize];
                    commentTextStorage.textColor = MainColor;
                    commentTextStorage.frame = CGRectMake(comImage.right+10.0f,
                                                          comName.bottom+10.0f,
                                                          SCREEN_WIDTH - 70.0f,
                                                          CGFLOAT_MAX);
                    
                    CommentModel* commentModel1 = [[CommentModel alloc] init];
                    commentModel1.to = commentDict[@"from"];
                    commentModel1.index = index;
                    [commentTextStorage lw_addLinkForWholeTextStorageWithData:commentModel1
                                                               highLightColor:RGB(0, 0, 0, 0.15)];
                    
                    [commentTextStorage lw_addLinkWithData:commentModel1
                                                     range:NSMakeRange(0,[(NSString *)commentDict[@"from"] length])
                                                 linkColor:grayBlueC
                                            highLightColor:RGB(0, 0, 0, 0.15)];
                    
                    CommentModel* commentModel2 = [[CommentModel alloc] init];
                    commentModel2.to = [NSString stringWithFormat:@"%@",commentDict[@"to"]];
                    commentModel2.index = index;
                    [commentTextStorage lw_addLinkWithData:commentModel2
                                                     range:NSMakeRange([(NSString *)commentDict[@"from"] length] + 2,
                                                                       [(NSString *)commentDict[@"to"] length])
                                                 linkColor:grayBlueC
                                            highLightColor:RGB(0, 0, 0, 0.15)];
                    
                    [LWTextParser parseTopicWithLWTextStorage:commentTextStorage
                                                    linkColor:grayBlueC
                                               highlightColor:RGB(0, 0, 0, 0.15)];
                    [LWTextParser parseEmojiWithTextStorage:commentTextStorage];
                    
                    [tmp addObject:commentTextStorage];
                    [tmp addObject:comName];
                    [tmp addObject:comImage];
                    offsetY += commentTextStorage.height;
                } else {
                    NSString* commentString = [NSString stringWithFormat:@"%@:%@",
                                               commentDict[@"from"],
                                               commentDict[@"content"]];
                    
                    LWTextStorage* commentTextStorage = [[LWTextStorage alloc] init];
                    commentTextStorage.text = commentString;
                    commentTextStorage.font = [UIFont systemFontOfSize:descTitleSize];
                    commentTextStorage.textAlignment = NSTextAlignmentLeft;
                    commentTextStorage.linespacing = 2.0f;
                    commentTextStorage.textColor = RGB(40, 40, 40, 1);
                    
                    commentTextStorage.frame = CGRectMake(rect.origin.x + 10.0f,
                                                          rect.origin.y + 10.0f + offsetY,
                                                          SCREEN_WIDTH - 95.0f,
                                                          CGFLOAT_MAX);
                    
                    CommentModel* commentModel = [[CommentModel alloc] init];
                    commentModel.to = commentDict[@"from"];
                    commentModel.index = index;
                    [commentTextStorage lw_addLinkForWholeTextStorageWithData:commentModel
                                                               highLightColor:RGB(0, 0, 0, 0.15)];
                    
                    [commentTextStorage lw_addLinkWithData:commentModel
                                                     range:NSMakeRange(0,[(NSString *)commentDict[@"from"] length])
                                                 linkColor:grayBlueC
                                            highLightColor:RGB(0, 0, 0, 0.15)];
                    
                    [LWTextParser parseTopicWithLWTextStorage:commentTextStorage
                                                    linkColor:grayBlueC
                                               highlightColor:RGB(0, 0, 0, 0.15)];
                    [LWTextParser parseEmojiWithTextStorage:commentTextStorage];
                    [tmp addObject:commentTextStorage];
                    offsetY += commentTextStorage.height;
                }
            }
            //如果有评论，设置评论背景Storage
            commentTextStorages = tmp;
            commentBgPosition = CGRectMake(avatarStorage.left,
                                           lineG.bottom + 5.0f,
                                           SCREEN_WIDTH - 20,
                                           offsetY + 30.0f);
            
            commentBgStorage.frame = commentBgPosition;
//            commentBgStorage.contents = [UIImage imageNamed:@"comment"];
            [commentBgStorage stretchableImageWithLeftCapWidth:40
                                                  topCapHeight:15];
        }

        
        
        
        
        [self addStorage:nameTextStorage];//将Storage添加到遵循LWLayoutProtocol协议的类
        [self addStorage:contentTextStorage];
        [self addStorage:dateTextStorage];
        [self addStorages:commentTextStorages];//通过一个数组来添加storage
        [self addStorage:avatarStorage];
        [self addStorage:commentBgStorage];
        [self addStorage:likeImageSotrage];
        [self addStorage:comImage];
        [self addStorages:imageStorageArray];//通过一个数组来添加storage，使用这个方法
        if (likeTextStorage) {
            [self addStorage:likeTextStorage];
        }
        if (commentTextStorage) {
            [self addStorage:commentTextStorage];
            [self addStorage:comImage];
            [self addStorage: comName];
        }
        
        self.deleteFrame = deleteFrame;
        self.avatarPosition = CGRectMake(10, 20, 45, 45);//头像的位置
        self.imagePostions = imagePositionArray;//保存图片位置的数组
        
        self.commentBgPosition = commentBgPosition;//评论灰色背景位置
        
        //如果是使用在UITableViewCell上面，可以通过以下方法快速的得到Cell的高度
        self.cellHeight = [self suggestHeightWithBottomMargin:0.0f];
    }
    return self;
    
}







-(LWTextStorage *)createTextWithFrame:(CGRect)frame andTextColor:(UIColor *)color andTextFont:(CGFloat)size
{
    LWTextStorage *text = [[LWTextStorage alloc]init];
    text.frame = frame;
    text.textColor = color;
    text.backgroundColor = [UIColor whiteColor];
    text.textAlignment = NSTextAlignmentLeft;
    text.font = [UIFont systemFontOfSize:size];
    text.linespacing = 7.0f;
    [self addStorage:text];
    return text;
}


@end
