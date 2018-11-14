//
//  LVSelecModel.h
//  SingleTapAction
//
//  Created by Virtue on 2018/6/25.
//  Copyright © 2018年 none. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LVSelecModel : NSObject
@property (nonatomic, assign) BOOL isSelect;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) int order;
@end
