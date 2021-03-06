//
//  MUKitSignalTableViewController.m
//  MUKit
//
//  Created by Jekity on 2017/8/17.
//  Copyright © 2017年 Jeykit. All rights reserved.
//

#import "MUKitSignalTableViewController.h"

#import "MUKitDemoSignalCell.h"
#import "MUView.h"

//#import "UIScrollView+MUNormal.h"
@interface MUKitSignalTableViewController ()
@property(nonatomic, strong)MUTableViewManager *tableViewManger;
@end

static NSString * const cellIndentifier = @"cell";
static NSString * const cellTempIndentifier = @"tempCell";

@implementation MUKitSignalTableViewController
-(instancetype)init{
    if (self = [super init]) {
       self.title = @"Orange";
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBarBackgroundImageMu = [UIImage imageFromColorMu:[UIColor whiteColor]];
    self.navigationController.navigationBarTintColor = [UIColor blueColor];
    _tableViewManger = [[MUTableViewManager alloc]initWithTableView:self.tableView registerCellNib:NSStringFromClass([MUKitDemoSignalCell class]) subKeyPath:nil];
    _tableViewManger.modelArray = [self modelData];
    [self configuredTableView];
}

-(NSMutableArray *)modelData{
    NSMutableArray *modelArray = [NSMutableArray array];
    
    modelArray = [@[@"model1",@"model2",@"model3",@"model4",@"model5",@"model6",@"model7",@"model8",@"model9",@"model0"] mutableCopy];
                           
    return modelArray;
}
-(void)configuredTableView{
    
    self.tableViewManger.renderBlock = ^UITableViewCell *(UITableViewCell *cell, NSIndexPath *indexPath, id model, CGFloat *height) {
//        *height = 250.;
        return cell;

    };
    self.tableViewManger.selectedCellBlock = ^(UITableView *tableView, NSIndexPath *indexPath, id model, CGFloat *height) {
        
        NSLog(@"点击了section=%ld,row=%ld,高度是=%f",indexPath.section,indexPath.row,*height);
    };
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

Click_MUSignal(label){
    
    UILabel *view = (UILabel *)object;
    NSIndexPath *indexPath = view.indexPath;
    NSLog(@"我是cell上子控件的信号------%@---------%@-------",NSStringFromClass([object class]),indexPath);
}

Click_MUSignal(button){
    UIButton *view = (UIButton *)object;
    NSIndexPath *indexPath = view.indexPath;
    NSLog(@"我是cell上子控件的信号-----%@---------%@-------",NSStringFromClass([object class]),indexPath);
}

Click_MUSignal(segmentedController){
    UISegmentedControl *view = (UISegmentedControl *)object;
    NSIndexPath *indexPath = view.indexPath;
    NSLog(@"我是cell上子控件的信号------%@---------%@-------",NSStringFromClass([object class]),indexPath);
}

Click_MUSignal(textFile){
    UITextField *view = (UITextField *)object;
    NSIndexPath *indexPath = view.indexPath;
    NSLog(@"我是cell上子控件的信号%@---------%@-------%@",NSStringFromClass([object class]),indexPath,view.text);
}

Click_MUSignal(slider){
    UISlider *view = (UISlider *)object;
    NSIndexPath *indexPath = view.indexPath;
    NSLog(@"我是cell上子控件的信号%@---------%@-------%@",NSStringFromClass([object class]),indexPath,NSStringFromClass([view.viewController class]));
}

Click_MUSignal(muswitch){
    UISwitch *view = (UISwitch *)object;
    NSIndexPath *indexPath = view.indexPath;
    NSLog(@"我是cell上子控件的信号-----%@---------%@-------",NSStringFromClass([object class]),indexPath);
}

Click_MUSignal(greenView){
    MUView *view = (MUView *)object;
    NSIndexPath *indexPath = view.indexPath;
    NSLog(@"我是cell上子控件的信号------%@---------%@-------",NSStringFromClass([object class]),indexPath);
}

Click_MUSignal(blueView){
    UIView *view = (UIView *)object;
    NSIndexPath *indexPath = view.indexPath;
    NSLog(@"我是cell上子控件的信号%@---------%@-------",NSStringFromClass([object class]),indexPath);
}

Click_MUSignal(mmimageView){
    UIImageView *view = (UIImageView *)object;
    NSIndexPath *indexPath = view.indexPath;
    NSLog(@"我是cell上子控件的信号%@---------%@------",NSStringFromClass([object class]),indexPath);
}

Click_MUSignal(stepper){
    UIStepper *view = (UIStepper *)object;
    NSIndexPath *indexPath = view.indexPath;
    NSLog(@"我是cell上子控件的信号%@---------%@------",NSStringFromClass([object class]),indexPath);
}
@end
