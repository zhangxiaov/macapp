//
//  LineNumberRulerView.m
//  macapp
//
//  Created by zhangxinwei on 15/11/5.
//  Copyright © 2015年 zhangxinwei. All rights reserved.
//

#import "LineNumberRulerView.h"

typedef void(^DrawLineNumber)(NSString *, CGFloat);

@interface LineNumberRulerView ()
@property (nonatomic, strong) DrawLineNumber drawLineNumber;
@end

@implementation LineNumberRulerView

- (instancetype)initWith:(NSTextView *)textView
{
    self = [super init];
    if (self) {
        self.clientView = textView;
        self.ruleThickness = 30;
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    
    
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (void)drawHashMarksAndLabelsInRect:(NSRect)rect {
    NSTextView *textView = (NSTextView *)self.clientView;
    if (textView) {
        NSLayoutManager *layoutManager = textView.layoutManager;
        if (layoutManager) {
            NSPoint relativePoint = [self convertPoint:NSZeroPoint fromView:textView];
//            NSMutableAttributedString *lineNumberAttributes = [];
            NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:NSFontAttributeName,textView.font, NSForegroundColorAttributeName,[NSColor grayColor], nil];
//            NSAttributedString *attr = [[NSAttributedString alloc] initWithString:@"" attributes:dict];
            _drawLineNumber = ^(NSString *lineNumberString, CGFloat y){
                NSAttributedString *attString = [[NSAttributedString alloc] initWithString:lineNumberString attributes:dict];
                NSInteger x = 35 - attString.size.width;
                [attString drawAtPoint:NSMakePoint(x, relativePoint.y + y)];
            };
            
            NSRange visibleGlyphRange = [layoutManager glyphRangeForBoundingRect:textView.visibleRect inTextContainer:textView.textContainer];
            NSInteger firstVisibleGlyphCharacterIndex = [layoutManager characterIndexForGlyphAtIndex:visibleGlyphRange.location];
            NSRegularExpression *newLineRegex = [[NSRegularExpression alloc] initWithPattern:@"\n" options:0 error:nil];
            NSInteger lineNumber = [newLineRegex numberOfMatchesInString:textView.string options:0 range:NSMakeRange(0, firstVisibleGlyphCharacterIndex)] + 1;
            NSInteger glyphIndexForStringLine = visibleGlyphRange.location;
            
            while (glyphIndexForStringLine < NSMaxRange(visibleGlyphRange)) {
                NSRange characterRangeForStringLine = [((NSString *)textView.string) lineRangeForRange:NSMakeRange([layoutManager characterIndexForGlyphAtIndex:glyphIndexForStringLine], 0)];
                NSRange glyphRangeForStringLine = [layoutManager glyphRangeForCharacterRange:characterRangeForStringLine actualCharacterRange:nil];
                NSInteger glyphIndexForGlyphLine = glyphIndexForStringLine;
                NSInteger glyphLineCount = 0;
                
                while (glyphIndexForGlyphLine < NSMaxRange(glyphRangeForStringLine)) {
                    NSRange effectiveRange = NSMakeRange(0, 0);
                    NSRect lineRect = [layoutManager lineFragmentRectForGlyphAtIndex:glyphIndexForGlyphLine effectiveRange:&effectiveRange withoutAdditionalLayout:true];
                    if (glyphLineCount > 0) {
                        _drawLineNumber(@"-", NSMinY(lineRect));
                    }else {
                        _drawLineNumber([NSString stringWithFormat:@"%ld", lineNumber], NSMinY(lineRect));
                    }
                    
                    glyphLineCount ++;
                    glyphIndexForGlyphLine = NSMaxRange(effectiveRange);
                }
                
                glyphIndexForStringLine = NSMaxRange(glyphRangeForStringLine);
                lineNumber++;
            }
            
            if ([layoutManager extraLineFragmentTextContainer] != nil) {
                
            }
        }
    }
}


@end
