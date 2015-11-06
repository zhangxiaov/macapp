//
//  main.m
//  macapp
//
//  Created by zhangxinwei on 15/11/4.
//  Copyright © 2015年 zhangxinwei. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MyWindow.h"

int main(int argc, const char * argv[]) {
//    return NSApplicationMain(argc, argv);
    
    NSRect rc = NSMakeRect(0, 0, 400, 400);
    NSUInteger uiStyle = NSTitledWindowMask | NSResizableWindowMask | NSClosableWindowMask;
    NSBackingStoreType backingStoreStyle = NSBackingStoreBuffered;
    MyWindow *win = [[MyWindow alloc] initWithContentRect:rc styleMask:uiStyle backing:backingStoreStyle defer:NO];
    [win makeKeyAndOrderFront:win];
    [win makeMainWindow];
    
    [NSApp run];
}


