//
//  SideView.h
//  macapp
//
//  Created by zhangxinwei on 15/11/4.
//  Copyright © 2015年 zhangxinwei. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SideTopView.h"
#import "SideBottomView.h"

@interface SideView : NSView
@property (nonatomic, strong) SideTopView *topView;
@end
