//
//  CJTextInputAlertView.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 2018/9/27.
//  Copyright © 2018年 dvlproad. All rights reserved.
//

#import "CJTextInputAlertView.h"
#import "UITextField+CJTextChangeBlock.h"

@interface CJTextInputAlertView () {
    
}

@end



@implementation CJTextInputAlertView

- (instancetype)initWithTitle:(NSString *)title
                    inputText:(NSString *)inputText
                  placeholder:(NSString *)placeholder
            cancelButtonTitle:(NSString *)cancelButtonTitle
                okButtonTitle:(NSString *)okButtonTitle
                 cancelHandle:(void(^)(void))cancelHandle
                     okHandle:(void(^)(NSString *outputText))okHandle
{
    self = [super init];
    if (self) {
        CJAlertThemeModel *alertThemeModel = [CJThemeManager serviceThemeModel].alertThemeModel;
        
        self.layer.cornerRadius = 14;
        self.backgroundColor = CJColorFromHexString(alertThemeModel.backgroundColor);
        self.clipsToBounds = YES;
        
        CGSize popupViewSize = CGSizeMake(alertThemeModel.alertWidth, 174);
        self.size = popupViewSize;
        
        //title
        CGFloat titleLabelLeftOffset = 20;
        [super addTitle:title margin:titleLabelLeftOffset];
        
        //textField
        [self addTextFiledWithPlaceholder:placeholder];
        
        //bottomButtons
        __weak typeof(self)weakSelf = self;
        [self addTwoButtonsWithCancelButtonTitle:cancelButtonTitle okButtonTitle:okButtonTitle cancelHandle:cancelHandle okHandle:^{
            NSString *outputText = weakSelf.textField.text;
            if (okHandle) {
                okHandle(outputText);
            }
        }];
        
        self.textField.text = inputText;
        
        [self __setupConstraintsWithTitleLabelLeftOffset:titleLabelLeftOffset];
    }
    return self;
}

- (void)addTextFiledWithPlaceholder:(NSString *)placeholder {
    self.textField = [CJAlertComponentFactory textFiledWithPlaceholder:placeholder];
    __weak typeof(self)weakSelf = self;
    self.textField.cjTextDidChangeBlock = ^(UITextField *textField) {
        BOOL okEnable = textField.text.length > 0;
        weakSelf.okButton.enabled = okEnable;
    };
    [self addSubview:self.textField];
    
    self.textFieldHeight = 43;
}


///获取当前alertView最小应有的高度值
- (CGFloat)getMinHeightExpectTextField {
    CGFloat minHeightWithoutMessageLabel = self.totalMarginVertical + self.titleLabelHeight + self.bottomPartHeight;;
    minHeightWithoutMessageLabel = ceil(minHeightWithoutMessageLabel);
    
    return minHeightWithoutMessageLabel;
}

- (void)showWithShouldFitHeight:(BOOL)shouldFitHeight blankBGColor:(UIColor *)blankBGColor
{
    // 计算最后 textFieldHeight 的值
    CGFloat minHeightWithoutTextField = [self getMinHeightExpectTextField];

    CGFloat textFieldHeight = 0;
    if (shouldFitHeight) {
        textFieldHeight = self.textFieldHeight;
    } else {
        textFieldHeight = self.size.height - minHeightWithoutTextField;
    }
    
    // 使用计算出来的最后 textFieldHeight
    CGFloat fixHeight = minHeightWithoutTextField + textFieldHeight;

    CGSize popupViewSize = CGSizeMake(self.size.width, fixHeight);
    [self showPopupViewSize:popupViewSize blankBGColor:blankBGColor];
}


- (void)__setupConstraintsWithTitleLabelLeftOffset:(CGFloat)titleLabelLeftOffset
{
    // alert 竖直上的间距:alertMarginVertical
    NSArray *alertMarginVerticals = @[@0, @0, @0, @0];
    NSInteger titleVerticalIndex = -1;
    NSInteger textFieldVerticalIndex = -1;
    NSInteger buttonsVerticalIndex = -1;
    alertMarginVerticals = [CJThemeManager serviceThemeModel].alertThemeModel.marginVertical_title_textField_buttons;
    titleVerticalIndex = 0;
    textFieldVerticalIndex = 1;
    buttonsVerticalIndex = 2;
    for (NSNumber *marginVertical in alertMarginVerticals) {
        self.totalMarginVertical += [marginVertical floatValue];
    }
    
    
    CGFloat titleTextHeight = self.titleLabelHeight;
    NSNumber *titleMarginTop = alertMarginVerticals[titleVerticalIndex];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.left.mas_equalTo(self).mas_offset(titleLabelLeftOffset);
        make.top.mas_greaterThanOrEqualTo(self).mas_offset(titleMarginTop);//优先级
        make.height.mas_equalTo(titleTextHeight);
    }];
    
    NSNumber *textFieldMarginTop = alertMarginVerticals[textFieldVerticalIndex];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).mas_offset(20);
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_equalTo(textFieldMarginTop);
        make.height.mas_equalTo(43);
    }];
    
    
    CGFloat actionButtonHeight = 45;
    CGFloat bottomInterval = 0;
    CGFloat bottomButtonsLeftOffset = 0;
    [self.bottomButtonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-bottomInterval);
        make.height.mas_equalTo(actionButtonHeight);
        make.left.mas_equalTo(self).mas_offset(bottomButtonsLeftOffset);
        make.centerX.mas_equalTo(self);
    }];
}

@end