//
//  LVSingleActionView.m
//  SingleTapAction
//
//  Created by Virtue on 2018/6/25.
//  Copyright © 2018年 none. All rights reserved.
//

#import "LVSingleActionView.h"
#import "LVSelecModel.h"

#define kBtnTag 7890
#define kLimitCount 3

@interface LVSingleActionView ()
@property (nonatomic, strong) NSMutableArray *actionArray;
@end


@implementation LVSingleActionView

- (instancetype)initWithFrame:(CGRect)frame actionArray:(NSArray *)actionArray{
    if (self = [super initWithFrame:frame]) {
        self.actionArray = [NSMutableArray arrayWithArray:actionArray];
        [self setView];
    }
    return self;
}

- (void)setView {
    NSUInteger row = 0;     // 行
    NSUInteger column = 0;  // 列
    CGFloat itemWidth = 90;
    CGFloat itemheight = 40;

    for (int i = 0; i < self.actionArray.count; i++) {
        LVSelecModel *model = self.actionArray[i];
        row = i / 3;
        column = i % 3;
        CGFloat x = 15 + column * (itemWidth + 4);
        CGFloat y = 45 + row * (itemheight + 4);
        UIButton *newBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        newBtn.tag = i + kBtnTag;
        newBtn.layer.masksToBounds = YES;
        newBtn.layer.cornerRadius = 6;
        newBtn.layer.borderWidth = 1;
        newBtn.layer.borderColor = [UIColor yellowColor].CGColor;
        newBtn.frame = CGRectMake(x, y, itemWidth, itemheight);
        [newBtn setTitleColor:[UIColor blackColor] forState:0];
        [newBtn setTitle:model.title forState:0];
        [self addSubview:newBtn];
        [newBtn addTarget:self action:@selector(didTapActionBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)didTapActionBtn:(UIButton *)sender {
    LVSelecModel *model = self.actionArray[sender.tag - kBtnTag];
    if (model) {
        if (!model.isSelect) {
            if ([self limitCount]) {
                NSLog(@"最多选择三个啊！！！！");
            }
            else {
                model.isSelect = !model.isSelect;
                sender.backgroundColor = model.isSelect ? [UIColor redColor] : [UIColor whiteColor];
            }
        }
        else {
            model.isSelect = !model.isSelect;
            sender.backgroundColor = model.isSelect ? [UIColor redColor] : [UIColor whiteColor];
        }
    }
}

- (BOOL)limitCount {
    NSMutableArray *tempArray = [NSMutableArray array];
    [self.actionArray enumerateObjectsUsingBlock:^(LVSelecModel  * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.isSelect) {
            [tempArray addObject:obj];
        }
    }];
    if (tempArray.count >= kLimitCount) {
        return YES;
    }
    return NO;
}
- (NSArray *)getSlectModels {
    NSMutableArray *tempArray = [NSMutableArray array];
    [self.actionArray enumerateObjectsUsingBlock:^(LVSelecModel  * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.isSelect) {
            [tempArray addObject:obj];
        }
    }];
    
    return tempArray;
}
@end
