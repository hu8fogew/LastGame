//
//  SelectPhotoViewController.m
//  QiPinTong
//
//  Created by 企聘通 on 2017/4/27.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "SelectPhotoViewController.h"

@interface SelectPhotoViewController ()<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

{
    
    UIImagePickerController *imagePicker;
    
}



@property (nonatomic,strong) UITableView *tableVc;
@property (nonatomic,strong) NSMutableArray *arr;
//@property (nonatomic,strong) UIImagePickerController *imagePicker;

@end

@implementation SelectPhotoViewController

-(NSMutableArray *)arr
{
    if (!_arr) {
        _arr = [NSMutableArray arrayWithObjects:@"从相册中选一张",@"拍一张", nil];
    }
    return _arr;
}




-(UITableView *)tableVc
{
    if (!_tableVc) {
        _tableVc = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
//        _tableVc.backgroundColor = whiteC;
        _tableVc.delegate = self;
        _tableVc.dataSource = self;
//        _tableVc.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        
        
        
    }
    return _tableVc;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    if (section == 0) {
        return self.arr.count;
//    }else
//    {
//        return 1;
//    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    YCYMFormTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    
//    if (cell == nil) {
//        cell = [[YCYMFormTableViewCell alloc]initWithFrame:cell.bounds];
//        
//    }
//    
//    cell.textLabel.text = self.arr[indexPath.row];
    id AllCELL = nil;
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//    UITableViewCell *secCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"sybCell"];
    
    

//    if (indexPath.section == 0) {
        cell.textLabel.text = self.arr[indexPath.row];
        cell.textLabel.textColor = MainColor;
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        AllCELL = cell;
//    }else
//    {
//        secCell.textLabel.text = @"摄影师推荐";
//        secCell.textLabel.textColor = MainColor;
//        
//        
//        secCell.detailTextLabel.text = @"卓伟新作,意想不到的高清作品";
//        secCell.detailTextLabel.textColor = SecondTitleColor;
//        
//        secCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        AllCELL = secCell;
//    }

    
    
    
    return AllCELL;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
//    if (section == 0) {
//        return 20;
//    }
    
    return 20;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 10;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section == 1) {
//        return 60;
//    }else
//    {
//        return 44;
//    }
//
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        
        if (indexPath.row == 1) {
            
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                picker.delegate = self;
                picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                picker.allowsEditing = YES;
                [self presentViewController:picker animated:YES completion:nil];
            }
        }
        if (indexPath.row == 0) {
            
            UIImagePickerController *imagePick = [[UIImagePickerController alloc]init];
            
            [imagePick.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : whiteC} forState:UIControlStateNormal];
            
            [imagePick.navigationItem.leftBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : whiteC} forState:UIControlStateNormal];
            
            imagePick.delegate = self;
            
            imagePick.allowsEditing = YES;
            
            [self presentViewController:imagePick animated:YES completion:nil];
            
            
        }
    }
//    }else
//    {
//        
//    }

    
    
    
}

#pragma mark -------imagePickerDelegate

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    
    UIImage *image = info[UIImagePickerControllerEditedImage];
    
    if (image == nil) {
        image = info[UIImagePickerControllerEditedImage];
    }
    if (_delegate && [_delegate respondsToSelector:@selector(getImage:)]) {
        [_delegate getImage:image];
    }
    [picker dismissViewControllerAnimated:NO completion:^{
        WeakSelf(weakSelf);
        
        [weakSelf.navigationController popViewControllerAnimated:NO];
        
        
    }];
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = whiteC;
    [self.view addSubview:self.tableVc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
