




/********************* 有任何问题欢迎反馈给我 liuweiself@126.com ****************************************/
/***************  https://github.com/waynezxcv/Gallop 持续更新 ***************************/
/******************** 正在不断完善中，谢谢~  Enjoy ******************************************************/








#import "LWLayout.h"
#import "StatusModel.h"


#define MESSAGE_TYPE_IMAGE @"image"
#define MESSAGE_TYPE_WEBSITE @"website"
#define MESSAGE_TYPE_VIDEO @"video"
#define AVATAR_IDENTIFIER @"avatar"
//#define IMAGE_IDENTIFIER @"image"
#define WEBSITE_COVER_IDENTIFIER @"cover"


@interface CellLayout : LWLayout <NSCopying>

@property (nonatomic,strong) StatusModel* statusModel;
@property (nonatomic,assign) CGFloat cellHeight;
@property (nonatomic,assign) CGRect lineRect;
@property (nonatomic,assign) CGRect menuPosition;//打赏按钮
@property (nonatomic,assign) CGRect likePosition;//点赞
@property (nonatomic,assign) CGRect commentPosition;//评论
@property (nonatomic,assign) CGRect buttPosition;
@property (nonatomic,assign) CGRect deleteFrame;
@property (nonatomic,assign) CGRect commentBgPosition;
@property (nonatomic,assign) CGRect avatarPosition;
@property (nonatomic,assign) CGRect websitePosition;
@property (nonatomic,copy) NSArray* imagePostions;


/**
 朋友圈cell的layout布局
 statusModel是模型类
 
 传入cell对应的indexPath.row = index
 
 传入时间dateFormatter
 
 */
- (id)initContentOpendLayoutWithStatusModel:(StatusModel *)stautsModel
                                      index:(NSInteger)index
                              dateFormatter:(NSDateFormatter *)dateFormatter;


/**
 评论cell的初始化
 评论的模型类
 传入cell对应的index
 
 传入时间模型dateFormatter
 
 */
- (id)initCommentLayoutWithStatusModel:(StatusModel *)statusModel
                                 index:(NSInteger)index
                         dateFormatter:(NSDateFormatter *)dateFormatter;

@end
