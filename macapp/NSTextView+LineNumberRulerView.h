//
//  NSTextView+LineNumberRulerView.h
//  macapp
//
//  Created by zhangxinwei on 15/11/5.
//  Copyright © 2015年 zhangxinwei. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class LineNumberRulerView;

@interface NSTextView (LineNumberRulerView)
- (void)setLineView:(LineNumberRulerView *)lineNumberRulerView;
- (LineNumberRulerView *)getLineView;
- (void)lnv_setUpLineNumberView;
@end
