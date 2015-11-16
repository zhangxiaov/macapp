//
//  AppDelegate.h
//  macapp
//
//  Created by zhangxinwei on 15/11/4.
//  Copyright © 2015年 zhangxinwei. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MyWindow.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>
//@property (nonatomic, strong) NSWindow *window;
@property (nonatomic, strong) MyWindow *window;

//@property (nonatomic, strong) NSView *sideView;
//@property (nonatomic, strong) NSView *mainView;
//@property (nonatomic, strong) NSView *consoleView;
@property (nonatomic, strong) NSTextField *label;
@end

