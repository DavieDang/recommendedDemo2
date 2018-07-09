//
//  ViewController.m
//  RecommendedAnimation
//
//  Created by dangwc on 2018/7/7.
//  Copyright © 2018年 dangwc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) UIImageView *imageView;

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,assign) NSInteger allTime;

@property (nonatomic,strong) NSTimer *timer;

@property (nonatomic,strong) NSArray *images;

@end

@implementation ViewController


-(NSArray *)images{
    if (!_images) {
        _images = @[@"selected_icon",@"selected_icon",@"selected_icon"];
    }
    return _images;
}


-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [UIImageView new];
        _imageView.layer.cornerRadius = 40;
        _imageView.layer.masksToBounds = YES;
        _imageView.image = [UIImage imageNamed:@"test_icon"];
    }
    return _imageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.bgView = [[UIView alloc] init];
    self.bgView.frame = CGRectMake(90, 90, 80, 80);
    self.bgView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.bgView];
    
    //防止显示画面超出父视图
    [self.bgView setClipsToBounds:YES];
    
    self.imageView.frame = CGRectMake(0, 0, 80, 80);
    _imageView.backgroundColor = [UIColor grayColor];
    [self.bgView addSubview:_imageView];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(switchAnimation) userInfo:nil repeats:YES];
  
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)switchAnimation{

 
    
    if (self.allTime == 0) {
        
        _imageView.image = [UIImage imageNamed:self.images.firstObject];
        CATransition *transition = [CATransition animation];
        transition.type = @"oglFlip";
        transition.duration = 1.0;
        transition.subtype = kCATransitionFromRight;
        [_imageView.layer addAnimation:transition forKey:nil];
        
    }else if(self.allTime == self.images.count){
        
        _imageView.image = [UIImage imageNamed:@"test_icon"];
        CATransition *transition = [CATransition animation];
        transition.type = @"oglFlip";
        transition.duration = 1.0;
        transition.subtype = kCATransitionFromRight;
        [_imageView.layer addAnimation:transition forKey:nil];

        [self.timer invalidate];
        self.timer = nil;
        
    }else{
        
        _imageView.image = [UIImage imageNamed:self.images[self.allTime]];
        CATransition *transition = [CATransition animation];
        transition.type = @"push";
        transition.duration = 1.0;
        transition.subtype = kCATransitionFromRight;
        [_imageView.layer addAnimation:transition forKey:nil];
    }
    self.allTime ++;
}


@end
