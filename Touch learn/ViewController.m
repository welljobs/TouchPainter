//
//  ViewController.m
//  Touch learn
//
//  Created by 魏素宝 on 14/12/12.
//  Copyright (c) 2014年 魏素宝. All rights reserved.
//

#import "ViewController.h"
#import "OXCPaintView.h"
@interface ViewController ()
@property (strong, nonatomic) OXCPaintView *baibanV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的画板";
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.baibanV];
}
-(OXCPaintView *)baibanV{
    if(_baibanV==nil){
        _baibanV=[[OXCPaintView alloc] initWithFrame:self.view.bounds];
        _baibanV.backgroundColor = [UIColor redColor];
    }
    return  _baibanV;
}
- (IBAction)backAction:(id)sender {
    [self.baibanV back];
}
- (IBAction)clearAction:(id)sender {
    [self.baibanV clear];
}

@end
