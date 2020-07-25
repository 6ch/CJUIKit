//
//  DataUtilViewController.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 2017/12/1.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "DataUtilViewController.h"
#import "CJPinyinHelper.h"

#import "CJSortUtil.h"

@interface DataUtilViewController ()

@property (nonatomic, weak) IBOutlet UITextView *originTextView;
@property (nonatomic, weak) IBOutlet UITextView *lastTextView;

@end

@implementation DataUtilViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.originTextView.text = @"厦门这个地方是个多音字";
    
    NSMutableArray *mutableArray = @[@(4), @(7), @(6), @(5), @(3), @(2), @(8), @(1)].mutableCopy;
    [CJSortUtil quickSortArray:mutableArray withLeftIndex:0 andRightIndex:mutableArray.count-1];
    NSLog(@"mutableArray = %@", mutableArray);
}

- (IBAction)changeToPlacePinyin:(id)sender {
    NSString *originText = self.originTextView.text;
    NSString *lastText = [CJPinyinHelper placePinyinFromChineseString:originText];
    self.lastTextView.text = lastText;
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
