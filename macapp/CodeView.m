//
//  CodeView.m
//  macapp
//
//  Created by zhangxinwei on 15/11/4.
//  Copyright © 2015年 zhangxinwei. All rights reserved.
//

#import "CodeView.h"
#import "NSTextView+LineNumberRulerView.h"

@interface CodeView ()
@property (nonatomic, strong) NSTextView *txtView;
@end

@implementation CodeView

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _scrollView = [[NSScrollView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [_scrollView setBorderType:NSNoBorder];
        [_scrollView setHasVerticalScroller:YES];
        [_scrollView setHasHorizontalScroller:NO];
        [_scrollView setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
        
        _txtView = [[NSTextView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width - 30 - 10, frame.size.height)];
        _txtView.string = @"fafafa";
//        [_txtView setBackgroundColor:[NSColor grayColor]];
//        [_txtView wantsUpdateLayer];
//        [txtView setMinSize:NSMakeSize(0.0, 190)];
//        [txtView setMaxSize:NSMakeSize(FLT_MAX, FLT_MAX)];
//        [txtView setVerticallyResizable:YES];
//        [txtView setHorizontallyResizable:NO];
//        [txtView setAutoresizingMask:NSViewWidthSizable];
//        [[txtView textContainer]setContainerSize:NSMakeSize(335,FLT_MAX)];
//        [[txtView textContainer]setWidthTracksTextView:YES];
//        [txtView setFont:[NSFont fontWithName:@"Helvetica" size:12.0]];
//        [txtView setEditable:NO];

        [_scrollView setDocumentView:_txtView];
        [_txtView lnv_setUpLineNumberView];
        
        [self addSubview:_scrollView];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    
    NSLog(@"tstc");
    [NSBezierPath fillRect:dirtyRect];
    
    NSPoint p1 = {self.frame.origin.x, 0};
    NSPoint p2 = {self.frame.origin.x, self.frame.size.height};
    [[NSColor redColor] set];
    [NSBezierPath strokeLineFromPoint:p1 toPoint:p2];
}

- (BOOL)isFlipped {
    return YES;
}

//- (void)setTextViewFrame:(CGSize)size {
//    [_scrollView setFrameSize:size];
//    [self setNeedsDisplay:YES];
//}

- (void)setFrameSize:(NSSize)newSize {
    [super setFrameSize:newSize];
    NSSize s = {newSize.width - 30 - 10, newSize.height};
    [_txtView setFrameSize:s];

}

@end
