//
//  ViewController.m
//  SingleTapAction
//
//  Created by Virtue on 2018/6/25.
//  Copyright © 2018年 none. All rights reserved.
//

#import "ViewController.h"
#import "LVSelecModel.h"
#import "LVSingleActionView.h"

@interface ViewController ()
@property (nonatomic, strong) LVSingleActionView *selectView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < 8; i++) {
        LVSelecModel *model = [LVSelecModel new];
        model.isSelect = NO;
        model.order = i;
        model.title = [NSString stringWithFormat:@"点我 %d",i];
        [arr addObject:model];
    }
    self.selectView = [[LVSingleActionView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, 400) actionArray:arr];
    
    [self.view addSubview:self.selectView];
    
    UIButton *seBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [seBtn setTitle:@"点我获得值" forState:0];
    [seBtn setTitleColor:[UIColor blackColor] forState:0];
    seBtn.frame = CGRectMake(20, 500, 100, 30);
    
    [self.view addSubview:seBtn];
    [seBtn  addTarget:self action:@selector(getSeleAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)getSeleAction {
  NSArray *resultArray = [self.selectView getSlectModels];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
