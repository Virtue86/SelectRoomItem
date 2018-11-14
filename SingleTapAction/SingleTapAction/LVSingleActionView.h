//
//  LVSingleActionView.h
//  SingleTapAction
//
//  Created by Virtue on 2018/6/25.
//  Copyright © 2018年 none. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LVSingleActionView : UIView
- (instancetype)initWithFrame:(CGRect)frame actionArray:(NSArray *)actionArray;
- (NSArray *)getSlectModels;
@end
