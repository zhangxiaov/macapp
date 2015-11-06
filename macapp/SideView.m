//
//  SideView.m
//  macapp
//
//  Created by zhangxinwei on 15/11/4.
//  Copyright © 2015年 zhangxinwei. All rights reserved.
//

#import "SideView.h"

@implementation SideView

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _topView = [[SideTopView alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
        
        [self addSubview:_topView];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    NSLog(@"test");
    [[NSColor clearColor] set];
    [NSBezierPath fillRect:dirtyRect];
}

- (void)resizeWithOldSuperviewSize:(NSSize)oldSize {
    NSLog(@"sideview");
}

- (BOOL)isFlipped {
    return YES;
}

@end
