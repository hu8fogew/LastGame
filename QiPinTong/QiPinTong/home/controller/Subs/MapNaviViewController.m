//
//  MapNaviViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/2/14.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "MapNaviViewController.h"
#import <MapKit/MapKit.h>

@interface MapNaviViewController ()<MKMapViewDelegate,UITextFieldDelegate,CLLocationManagerDelegate>

@property(nonatomic,strong)CLGeocoder *gecocoder;
@property(nonatomic,strong)MKMapView *mapView;
@property(nonatomic,strong)UIButton *backBtn;
@property(nonatomic,strong)NSMutableArray *polyLineMutable;
@property(nonatomic,strong)NSMutableArray *routeDetails;
@property(nonatomic,strong)CLLocationManager *manager;

@property (nonatomic,strong) NSString *address;
@property(nonatomic) CLLocationCoordinate2D location;

@end

@implementation MapNaviViewController

-(CLGeocoder *)gecocoder{
    if (!_gecocoder) {
        _gecocoder = [[CLGeocoder alloc]init];
    }
    
    return _gecocoder;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = whiteC;
    
    _polyLineMutable = [NSMutableArray array];
    _routeDetails = [NSMutableArray array];

    [self addMapView];

    [self addBackBtn];
    
    self.address = @"西安市太白南路沙井村";

}

#pragma mark - 返回到当前位置按钮
-(void)addBackBtn{
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-40, 200, 30, 40)];
    backBtn.backgroundColor = [UIColor whiteColor];
    backBtn.layer.borderColor = HWColor(241, 241, 241).CGColor;
    backBtn.layer.borderWidth = 1;
    backBtn.layer.masksToBounds = YES;
    backBtn.layer.cornerRadius = 4;
    [backBtn setImage:[UIImage imageNamed:@"naviIcon"] forState:UIControlStateNormal];
    backBtn.imageEdgeInsets = UIEdgeInsetsMake(10, 5, 10, 5);
    [backBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(clickBackBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    _backBtn = backBtn;
}

-(void)clickBackBtn{
    CLLocationCoordinate2D coordinate = self.mapView.userLocation.location.coordinate;
    // 设置跨度 = 当前地图的跨度
    MKCoordinateSpan spn = self.mapView.region.span;
    [self.mapView setRegion:MKCoordinateRegionMake(coordinate, spn) animated:YES];
}

#pragma mark - 添加地图
-(void)addMapView{
    MKMapView *map = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
    [self.view addSubview:map];
    map.userTrackingMode = MKUserTrackingModeFollow;
    map.delegate = self;
    map.showsUserLocation = YES;
    map.showsScale = YES;
    map.mapType = MKMapTypeStandard;
    self.mapView = map;
    
    self.manager = [[CLLocationManager alloc] init];
    self.manager.delegate = self;
    [self.manager requestWhenInUseAuthorization];
    [self.manager setDesiredAccuracy:kCLLocationAccuracyBest];
}

#pragma mark - MKMapViewDelegate
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    [self.gecocoder reverseGeocodeLocation:userLocation.location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (placemarks.count == 0 || error) {
            return ;
        }
        CLPlacemark *pm = placemarks.lastObject;
        self.mapView.userLocation.title = [NSString stringWithFormat:@"%@%@%@",pm.administrativeArea,pm.locality,pm.subLocality];
        self.mapView.userLocation.subtitle = pm.name;
        
    }];
}

-(void)viewWillAppear:(BOOL)animated{
    if (nil != _polyLineMutable) {
        [self.mapView removeOverlays:_polyLineMutable];
        [_polyLineMutable removeAllObjects];
    }
    
    // 1、创建导航请求对象
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
    // 2、设置起点和终点
    request.source = [MKMapItem mapItemForCurrentLocation];
    [self.gecocoder geocodeAddressString:self.address completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        //添加大头针
        CLPlacemark *placemark=[placemarks firstObject];
        self.location = CLLocationCoordinate2DMake(placemark.location.coordinate.latitude, placemark.location.coordinate.longitude);
        
//        HWLog(@"纬度是%f,经度是%f",placemark.location.coordinate.latitude, placemark.location.coordinate.longitude);
        
        MKPointAnnotation *annotation=[[MKPointAnnotation alloc]init];
        annotation.title=placemark.locality;
        annotation.subtitle=placemark.name;
        annotation.coordinate=self.location;
        [self.mapView addAnnotation:annotation];
        
        
        CLPlacemark *clPm = placemarks.lastObject;
        MKPlacemark *pm = [[MKPlacemark alloc] initWithPlacemark:clPm];
        request.destination = [[MKMapItem alloc] initWithPlacemark:pm];
        //3.创建导航对象
        MKDirections *direction = [[MKDirections alloc] initWithRequest:request];
        //4.计算导航路线 传递数据给服务器
        [direction calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse * _Nullable response, NSError * _Nullable error) {
            for (MKRoute *route in response.routes) {
                
                for (MKRouteStep *step in route.steps) {
                    NSDictionary *dict = [NSDictionary dictionaryWithObjects:@[step.instructions,@(step.distance)] forKeys:@[@"details",@"distance"]];
                    [_routeDetails addObject:dict];
                }
                [self.mapView addOverlay:route.polyline];
                [_polyLineMutable addObject:route.polyline];
            }
        }];
    }];
}


#pragma mark - MKMapViewDelegate
-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay{
    MKPolylineRenderer *render = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
    render.lineWidth = 6;
    render.strokeColor = [UIColor magentaColor];
    render.fillColor = [UIColor magentaColor];
    
    return render;
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation{
    
    //和cell重用机制类似
    static NSString *identifier = @"aAnn";
    
    //此处不用MKAnnotationView，应该用MKPinAnnotationView，是MKAnnotationView其中的一个子view（大头针）
    MKPinAnnotationView *annView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!annView) {
        annView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
    }
    //当annotation是当前用户的位置时，返回nil
    if (_mapView.userLocation == annotation) {
        return nil;
    }
    //设置其大头针的颜色（只有红，绿，紫）
    annView.pinTintColor = [UIColor greenColor];
    
    //显示弹出框（气泡）里面的内容
    annView.canShowCallout = YES;
    //设置弹出框左边的view
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hr"]];
    imageView.frame = CGRectMake(0, 0, 30, 30);
    annView.leftCalloutAccessoryView = imageView;
    
    return annView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
