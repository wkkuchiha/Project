//
//  QRCodeGenerateController.m
//  uchiha
//
//  Created by uchiha on 2017/8/28.
//  Copyright © 2017年 creditease. All rights reserved.
//

/**
 * 生成二维码
 */
#import "QRCodeGenerateController.h"
#import "QRCodeImageManager.h"

@interface QRCodeGenerateController ()
@property(nonatomic,strong)UITextView *textView;
@property(nonatomic,strong)UIButton *generateBtn;
@property(nonatomic,strong)UIImageView *imgView;
@property(nonatomic,strong)UIButton *saveBtn;


- (void)initViews;
- (void)generateButtonClick:(id)sender;
@end

@implementation QRCodeGenerateController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"生成二维码";
    self.view.backgroundColor = [UIColor colorWithRed:245.0f/255 green:247.0f/255 blue:251.0f/255 alpha:1.0];
    [self initTextView];
    [self initGenerateBtn];
    [self initImgView];
    [self initSaveBtn];
}

- (void)initTextView {
    _textView = [[UITextView alloc]init];
    [self.view addSubview:_textView];
    _textView.sd_layout.topSpaceToView(self.view, 10).leftSpaceToView(self.view, 20).rightSpaceToView(self.view, 20).heightIs(100);
    _textView.layer.cornerRadius = 3.0f;
    _textView.font = [UIFont systemFontOfSize:13.0f];
}

- (void)initGenerateBtn {
    _generateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_generateBtn];
    [_generateBtn setTitle:@"生成二维码" forState:UIControlStateNormal];
    _generateBtn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    _generateBtn.sd_layout.centerXEqualToView(self.view).topSpaceToView(_textView, 10).widthRatioToView(_textView, 1).heightIs(34);
    [_generateBtn setBackgroundColor:[UIColor grayColor]];
    [[_generateBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        [_textView resignFirstResponder];
        _imgView.image = [QRCodeImageManager qrImageForString:_textView.text imageSize:200];
        _imgView.hidden = NO;
        _saveBtn.hidden = NO;
        _saveBtn.enabled = YES;
    }];
}

- (void)initImgView {
    _imgView = [[UIImageView alloc]init];
    [self.view addSubview:_imgView];
    _imgView.sd_layout.leftSpaceToView(self.view, 20).rightSpaceToView(self.view, 20).topSpaceToView(_generateBtn, 10).heightIs(220);
    _imgView.hidden = YES;
}

- (void)initSaveBtn {
    _saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_saveBtn];
    [_saveBtn setTitle:@"保存二维码" forState:UIControlStateNormal];
    _saveBtn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    _saveBtn.sd_layout.centerXEqualToView(self.view).topSpaceToView(_imgView, 10).widthRatioToView(_textView, 1).heightIs(34);
    [_saveBtn setBackgroundColor:[UIColor grayColor]];
    [[_saveBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
    
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"文本对话框" message:nil preferredStyle:UIAlertControllerStyleAlert];
        /*
        [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
            textField.placeholder = @"登录";
        }];
        [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
            textField.placeholder = @"密码";
            textField.secureTextEntry = YES;
        }];
         */
    
        UIAlertAction *aa = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            return;
        }];
        UIAlertAction *bb = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"确定");
        }];
        
        [alertController addAction:aa];
        [alertController addAction:bb];
        [self presentViewController:alertController animated:YES completion:nil];
    }];
    _saveBtn.hidden = YES;
}


@end
