//
//  NSTextView+LineNumberRulerView.m
//  macapp
//
//  Created by zhangxinwei on 15/11/5.
//  Copyright © 2015年 zhangxinwei. All rights reserved.
//

#import "NSTextView+LineNumberRulerView.h"
#import "LineNumberRulerView.h"
#import <objc/runtime.h>

static NSInteger LineNumberViewAssocObjKey = 0;

@implementation NSTextView (LineNumberRulerView)

- (void)setLineView:(LineNumberRulerView *)lineNumberRulerView {
    objc_setAssociatedObject(self, &LineNumberViewAssocObjKey, lineNumberRulerView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (LineNumberRulerView *)getLineView {
    return objc_getAssociatedObject(self, &LineNumberViewAssocObjKey);
}

- (void)lnv_setUpLineNumberView {
    if (self.font == nil) {
        self.font = [NSFont systemFontOfSize:9];
    }
    
    NSScrollView *scrollView = self.enclosingScrollView;
    if (scrollView) {
        LineNumberRulerView *lnv = [[LineNumberRulerView alloc] initWith:self];
        [self setLineView:lnv];
        
        scrollView.verticalRulerView = [self getLineView];
        scrollView.hasVerticalRuler = true;
        scrollView.rulersVisible = true;
    }
    
    self.postsFrameChangedNotifications = true;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(lnv_frameDidChange:) name:NSViewFrameDidChangeNotification object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(lnv_textDidChange:) name:NSTextDidChangeNotification object:self];
}

- (void)lnv_frameDidChange:(NSNotification *)notification {
    [self getLineView].needsDisplay = true;
}

- (void)lnv_textDidChange:(NSNotification *)notification {
    [self getLineView].needsDisplay = true;
}
@end
