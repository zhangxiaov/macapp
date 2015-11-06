//
//  SideBottomView.m
//  macapp
//
//  Created by zhangxinwei on 15/11/4.
//  Copyright © 2015年 zhangxinwei. All rights reserved.
//

#import "SideBottomView.h"

@implementation SideBottomView

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _textField = [[NSTextField alloc] initWithFrame:CGRectMake((frame.size.width - 180)/2, 0, 180, 30)];
        [_textField setBezelStyle:NSTextFieldRoundedBezel];
//        [_textField setaccept]
        [self addSubview:_textField];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

@end
