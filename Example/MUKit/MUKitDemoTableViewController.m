//
//  MUKitDemoTableViewController.m
//  MUKit
//
//  Created by Jekity on 2017/8/17.
//  Copyright © 2017年 Jeykit. All rights reserved.
//

#import "MUKitDemoTableViewController.h"

#import "MUCameraAndPhotosManager.h"
#import "MUImagePickerManager.h"

#import "MUImagePickerManager.h"


@interface MUKitDemoTableViewController ()

@property(nonatomic, strong)MUTableViewManager *tableViewManger;
@end


@implementation MUKitDemoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MUKitDemo";
    self.navigationBarHiddenMu = YES;
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAutomatic;
    }
    [self configuredDataSource];
    
}
#pragma -mark init
-(void)configuredDataSource{

    self.tableViewManger = [[MUTableViewManager alloc]initWithTableView:self.tableView registerCellClass:NSStringFromClass([UITableViewCell class]) subKeyPath:nil];
   __block NSArray *mArray = [NSArray array];

     self.tableViewManger.tipsView.tipsImage = [UIImage imageNamed:@"icon_store"];

        mArray = @[@"MUSignal",@"MVVVTableView",@"MVVVCollectionView",@"MUEPaymentManager",@"MUShared",@"MutileSelectedPhotos",@"MUPaperView",@"QRCodeScan",@"MUCarousel"];
        self.tableViewManger.modelArray = mArray;


    self.tableViewManger.renderBlock = ^UITableViewCell *(UITableViewCell *cell, NSIndexPath *indexPath, id model, CGFloat *height) {
        
        cell.textLabel.text = [NSString stringWithFormat:@"%@",model];
        return cell;
    };

   self.tableViewManger.headerViewBlock = ^UIView * (UITableView *  tableView, NSUInteger sections, NSString *__autoreleasing   *  title, id   model, CGFloat *  height) {
       *title  = @"Demo";
       
       return nil;
   };
    
   self.tableViewManger.footerViewBlock = ^UIView *(UITableView *tableView, NSUInteger sections, NSString *__autoreleasing *title, id model, CGFloat *height) {
       
       *title = @"我想写就写";
       return nil;
   };
    
   
    weakify(self)
    self.tableViewManger.selectedCellBlock = ^(UITableView *  tableView, NSIndexPath *  indexPath, id  model, CGFloat *  height) {
        normalize(self)
        if (indexPath.row == 0) {
        
            [self.navigationController pushViewControllerStringMu:@"MUViewController" animated:YES parameters:nil];
            return ;
        }
        
        if (indexPath.row == 1) {
            
            
            UIViewController  *controller = [NSClassFromString(@"MUKitDemoMVVMTableViewController") new];
            [self.navigationController pushViewControllerMu:controller animated:YES parameters:nil];

            return ;
        }
        if (indexPath.row == 2) {
            
        
            UIViewController  *controller = [NSClassFromString(@"MUKitDemoMVVMColloectionController") new];
            [self.navigationController pushViewController:controller animated:YES];
            return ;
        }
        if (indexPath.row == 3) {
            
             UIViewController  *controller = [NSClassFromString(@"MUKitDemoPaymentTableViewController") new];
            [self.navigationController pushViewController:controller animated:YES];
        }
        
        if (indexPath.row == 4) {
            
            UIViewController  *controller = [NSClassFromString(@"MUKitDemoSharedTableViewController") new];
            [self.navigationController pushViewController:controller animated:YES];
//           [MUCameraAndPhotosManager pickImageControllerPresentIn:self selectedImage:^(UIImage *image) {
//
//
//           }];
        }
        if (indexPath.row == 5) {
            
            MUImagePickerManager  *controller = [MUImagePickerManager new];
            controller.navigationBarTintColor = [UIColor orangeColor];
            controller.titleColorMu   = [UIColor blueColor];
            controller.maximumNumberOfSelection = 3;
            [controller presentInViewController:self];
           
        }
        if (indexPath.row == 6) {
            [self.navigationController pushViewControllerStringMu:@"MUKitDemoPaperTableViewController" animated:YES parameters:^(NSMutableDictionary *dict) {
                
            }];
        }
        if (indexPath.row == 7) {
            
            [self.navigationController pushViewControllerStringMu:@"MUKitDemoQRCodeScanController" animated:YES parameters:^(NSMutableDictionary *dict) {
                
            }];
            
        }
        
        if (indexPath.row == 8) {
            [self.navigationController pushViewControllerStringMu:@"MUKitDemoViewCarouselController" animated:YES parameters:^(NSMutableDictionary *dict) {
                
            }];
        }
    
    };
   

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
