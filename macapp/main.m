//
//  main.m
//  macapp
//
//  Created by zhangxinwei on 15/11/4.
//  Copyright © 2015年 zhangxinwei. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        NSApplication *app = [NSApplication sharedApplication];
        id delegate = [[AppDelegate alloc] init];
        app.delegate = delegate;
        
        return NSApplicationMain(argc, argv);
    }
}


