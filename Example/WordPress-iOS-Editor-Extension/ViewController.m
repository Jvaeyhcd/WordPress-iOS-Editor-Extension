//
//  ViewController.m
//  WordPress-iOS-Editor-Extension
//
//  Created by polesapp-hcd on 2016/11/11.
//  Copyright © 2016年 Jvaeyhcd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initView {
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发表"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(publishedAction:)];
    
    
    self.title = @"发表文章";
    
    self.bodyPlaceholderText = @"写点什么吧";
    self.titlePlaceholderText = @"请输入标题";
    
}

-(void)backAction:(UIButton *)back{
    
}

- (void)publishedAction:(UIButton *)sender {
    
}

@end
