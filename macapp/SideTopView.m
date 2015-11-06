//
//  SideTopView.m
//  macapp
//
//  Created by zhangxinwei on 15/11/4.
//  Copyright © 2015年 zhangxinwei. All rights reserved.
//

#import "SideTopView.h"

@implementation SideTopView

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _runButton = [[NSButton alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
        NSButtonCell *cell = [[NSButtonCell alloc] init];
        [cell setBezelStyle:NSTexturedSquareBezelStyle];
        [cell setTitle:@"Run"];
        [_runButton setCell:cell];
        
        NSButtonCell *cell2 = [[NSButtonCell alloc] init];
        [cell2 setBezelStyle:NSTexturedSquareBezelStyle];
        [cell2 setTitle:@"Stop"];
        _stopButton = [[NSButton alloc] initWithFrame:CGRectMake(60, 0, 50, 30)];
        [_stopButton setCell:cell2];
        
        [self addSubview:_runButton];
        [self addSubview:_stopButton];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    NSPoint p1 = {self.frame.origin.x, self.frame.size.height};
    NSPoint p2 = {self.frame.size.width, self.frame.size.height};
    [[NSColor grayColor] set];
    [NSBezierPath strokeLineFromPoint:p1 toPoint:p2];
}

- (BOOL)isFlipped {
    return YES;
}

@end
