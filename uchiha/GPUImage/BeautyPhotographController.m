//
//  BeautyPhotographController.m
//  uchiha
//
//  Created by uchiha on 2017/8/28.
//  Copyright © 2017年 creditease. All rights reserved.
//

/**
 * 美拍
 */
#import "BeautyPhotographController.h"
#import <SDAutoLayout/SDAutoLayout.h>
#import <GPUImage/GPUImage.h>

@interface BeautyPhotographController ()
@property(nonatomic,strong)UIImageView *imgView;
@end

@implementation BeautyPhotographController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"美拍";
    [self initView];
}

- (void)initView {
    UIImage * inputImage = [UIImage imageNamed:@"HomePage1_newYear"];
    //使用黑白素描滤镜
    GPUImageSketchFilter *disFilter = [[GPUImageSketchFilter alloc] init];
    
    //设置要渲染的区域
    [disFilter forceProcessingAtSize:inputImage.size];
    [disFilter useNextFrameForImageCapture];
    
    //获取数据源
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc]initWithImage:inputImage];
    
    //添加上滤镜
    [stillImageSource addTarget:disFilter];
    //开始渲染
    [stillImageSource processImage];
    //获取渲染后的图片
    UIImage *newImage = [disFilter imageFromCurrentFramebuffer];
    //加载出来
    UIImageView *imageView = [[UIImageView alloc] initWithImage:newImage];
    imageView.frame = CGRectMake(50,50,inputImage.size.width ,inputImage.size.height);
    [self.view addSubview:imageView];
    
}



@end
