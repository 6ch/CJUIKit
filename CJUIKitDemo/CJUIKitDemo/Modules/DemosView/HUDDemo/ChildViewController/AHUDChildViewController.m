//
//  AHUDChildViewController.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 1/11/19.
//  Copyright © 2019 dvlproad. All rights reserved.
//

#import "AHUDChildViewController.h"
#import <CJBaseEffectKit/CJMJRefreshNormalHeader.h>
#import "BackFromSelfHUDViewController.h"
#import "UIViewController+CQProgressHUD.h"

@interface AHUDChildViewController ()

@end

@implementation AHUDChildViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView.mj_header beginRefreshing];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = NSLocalizedString(@"AHUDChildViewController", nil);
    self.view.backgroundColor = [UIColor yellowColor];
    
    CJMJRefreshNormalHeader *header = [CJMJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self cq_showProgressHUD];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self cq_dismissProgressHUD];
            [self.tableView.mj_header endRefreshing];
        });
    }];
    self.tableView.mj_header = header;
    
    NSMutableArray *sectionDataModels = [[NSMutableArray alloc] init];
    
    //....
    {
        CJSectionDataModel *sectionDataModel = [[CJSectionDataModel alloc] init];
        sectionDataModel.theme = @"A";
        {
            CJModuleModel *autoLayoutModule = [[CJModuleModel alloc] init];
            autoLayoutModule.title = @"A--1(点击进到下一页返回后禁止出现两个HUD)";
            autoLayoutModule.classEntry = [BackFromSelfHUDViewController class];
            [sectionDataModel.values addObject:autoLayoutModule];
        }
        
        [sectionDataModels addObject:sectionDataModel];
    }
    self.sectionDataModels = sectionDataModels;
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
