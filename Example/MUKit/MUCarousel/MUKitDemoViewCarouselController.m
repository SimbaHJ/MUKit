//
//  MUKitDemoViewCarouselController.m
//  MUKit_Example
//
//  Created by Jekity on 2017/12/18.
//  Copyright © 2017年 Jeykit. All rights reserved.
//

#import "MUKitDemoViewCarouselController.h"

@interface MUKitDemoViewCarouselController ()
@property(nonatomic, strong)MUCarouselView *carouselView1;
@property(nonatomic, strong)MUCarouselView *carouselView2;
@end

@implementation MUKitDemoViewCarouselController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Carousel";
    
        self.carouselView1 = [[MUCarouselView alloc]initWithFrame:CGRectMake(0, 0.0, kScreenWidth, 300)];
        [self.view addSubview:self.carouselView1];
        self.carouselView1.imageMode = MUCarouselViewImageModeScaleAspectFit;
        self.carouselView1.scrollDirection = MUCarouselScrollDirectionHorizontal;
        self.carouselView1.placeholderImage = [UIImage imageNamed:@"1024_s"];
//     网络图片数组
        self.carouselView1.urlImages = @[
                           @"http://pic34.nipic.com/20131028/2455348_171218804000_2.jpg",
                           @"http://img1.3lian.com/2015/a2/228/d/129.jpg",
                           @"http://img.boqiicdn.com/Data/Bbs/Pushs/img79891399602390.jpg",
                           @"http://sc.jb51.net/uploads/allimg/150703/14-150F3164339355.jpg",
                           @"http://img1.3lian.com/2015/a2/243/d/187.jpg",
                           @"http://pic7.nipic.com/20100503/1792030_163333013611_2.jpg",
                           @"http://www.microfotos.com/pic/0/90/9023/902372preview4.jpg",
                           @"http://pic1.win4000.com/wallpaper/b/55b9e2271b119.jpg"
                           ];
    
    self.carouselView2 = [[MUCarouselView alloc]initWithFrame:CGRectMake(0, 350., kScreenWidth, 44.)];
    [self.view addSubview:self.carouselView2];
    self.carouselView2.titleColor = [UIColor purpleColor];
    self.carouselView2.textAlignment = NSTextAlignmentLeft;
    self.carouselView2.backgroundColor = [UIColor lightGrayColor];
    self.carouselView2.scrollDirection = MUCarouselScrollDirectionVertical;
        self.carouselView2.titlesArray = @[
                                          @"http://pic34.nipic.com/20131028/2455348_171218804000_2.jpg",
                                          @"http://img1.3lian.com/2015/a2/228/d/129.jpg",
                                          @"http://img.boqiicdn.com/Data/Bbs/Pushs/img79891399602390.jpg",
                                          @"http://sc.jb51.net/uploads/allimg/150703/14-150F3164339355.jpg",
                                          @"http://img1.3lian.com/2015/a2/243/d/187.jpg",
                                          @"http://pic7.nipic.com/20100503/1792030_163333013611_2.jpg",
                                          @"http://www.microfotos.com/pic/0/90/9023/902372preview4.jpg",
                                          @"http://pic1.win4000.com/wallpaper/b/55b9e2271b119.jpg"
                                          ];
    
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
