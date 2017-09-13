//
//  MUTranslucentRootController.m
//  MUKit
//
//  Created by Jekity on 2017/9/13.
//  Copyright © 2017年 Jeykit. All rights reserved.
//

#import "MUTranslucentRootController.h"

@interface MUTranslucentRootController ()
@property(nonatomic, strong)UIView *contentView;
@property (nonatomic,strong)UIToolbar *toolBar;

@property(nonatomic, strong)UIBarButtonItem *leftButton;
@property(nonatomic, strong)UIBarButtonItem *rightButton;
@property(nonatomic, strong)UIBarButtonItem *centerButton;
@end

@implementation MUTranslucentRootController
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
    [super viewWillAppear:animated];
    _customView.backgroundColor = [UIColor blackColor];
    CGFloat height = CGRectGetHeight(_contentView.frame);
    __block CGRect rect = _contentView.frame;
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        rect.origin.y =  CGRectGetHeight(self.view.frame) - height;
        _contentView.frame = rect;
    } completion:^(BOOL finished) {
        
      
    }];
}

-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
    [super viewWillDisappear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self configuredInit];

}
-(void)configuredInit{
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
    _contentView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame), CGRectGetWidth(self.view.frame), 44.)];
    [self.view addSubview:_contentView];
    
    _toolBar           = [[UIToolbar alloc]init];
    _toolBar.frame     = CGRectMake(0,  0, CGRectGetWidth(self.view.frame), 44.);
    _leftButton   = [[UIBarButtonItem alloc]initWithTitle:@"  取消  " style:UIBarButtonItemStylePlain target:self action:@selector(cancle)];
    _leftButton.tintColor = [UIColor grayColor];
    _rightButton  = [[UIBarButtonItem alloc]initWithTitle:@"  确定  " style:UIBarButtonItemStylePlain target:self action:@selector(sure)];
    _rightButton.tintColor = [UIColor grayColor];
    _centerButton  = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    _centerButton.tintColor = [UIColor grayColor];
    UIBarButtonItem *spaceButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    self.toolBar.items            = @[_leftButton,spaceButton,_centerButton,spaceButton,_rightButton];
    [self.contentView addSubview:_toolBar];
}
-(void)dismiss{
    [self dismissViewControllerAnimated:YES completion:^{
        
        self.view.backgroundColor = [UIColor clearColor];
    }];
   
}
-(void)setLeftImage:(UIImage *)leftImage{
    _leftImage = leftImage;
    if (leftImage) {
        _leftButton.title = @"";
        _leftButton.image = leftImage;
    }
}
-(void)setRightImage:(UIImage *)rightImage{
    _rightImage = rightImage;
    if (rightImage) {
        _rightButton.title = @"";
        _rightButton.image = rightImage;
    }
}
-(void)setShowLeftBarItem:(BOOL)showLeftBarItem{
    _showLeftBarItem = showLeftBarItem;
    if (showLeftBarItem) {
        
        _leftButton.enabled = !showLeftBarItem;
        _leftButton.title   = @"";
    }
}
-(void)setShowRightBarItem:(BOOL)showRightBarItem{
    _showRightBarItem = showRightBarItem;
    if (showRightBarItem) {
        _rightButton.enabled = !showRightBarItem;
        _rightButton.title   = @"";
    }
}
-(void)setCenterTitle:(NSString *)centerTitle{
    _centerTitle = centerTitle;
    _centerButton.title = centerTitle;
}
-(void)sure{
    [self dismiss];
}
-(void)cancle{
    [self dismiss];
}
-(void)setCustomView:(UIView *)customView{
    _customView = customView;
    CGRect rect = customView.frame;
    rect.origin.y = 44.;
    customView.frame = rect;
    
    CGRect contentRect = _contentView.frame;
    contentRect.size.height += rect.size.height;
    _contentView.frame = contentRect;
    [_contentView addSubview:customView];

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