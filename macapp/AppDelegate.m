//
//  AppDelegate.m
//  macapp
//
//  Created by zhangxinwei on 15/11/4.
//  Copyright © 2015年 zhangxinwei. All rights reserved.
//

#import "AppDelegate.h"
#import "MyWindow.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationWillFinishLaunching:(NSNotification *)notification {
    /* Create Menu */
    NSMenu *menu;
    NSMenu *info;
    
    menu = [NSMenu new];
    [menu addItemWithTitle: @"Info"
                    action: NULL
             keyEquivalent: @""];
    [menu addItemWithTitle: @"Hide"
                    action: @selector(hide:)
             keyEquivalent: @"h"];
    [menu addItemWithTitle: @"Quit"
                    action: @selector(terminate:)
             keyEquivalent: @"q"];
    
    info = [NSMenu new];
    [info addItemWithTitle: @"Info Panel..."
                    action: @selector(orderFrontStandardInfoPanel:)
             keyEquivalent: @""];
    [info addItemWithTitle: @"Preferences"
                    action: NULL
             keyEquivalent: @""];
    [info addItemWithTitle: @"Help"
                    action: @selector (orderFrontHelpPanel:)
             keyEquivalent: @"?"];
    
    [menu setSubmenu: info
             forItem: [menu itemWithTitle:@"Info"]];
    //    RELEASE(info);
    
    [NSApp setMainMenu:menu];
    //    RELEASE(menu);
    
    /* Create Window */
//    _window = [[NSWindow alloc] initWithContentRect: NSMakeRect(300, 300, 200, 100)
//                                          styleMask: (NSTitledWindowMask |
//                                                      NSMiniaturizableWindowMask |
//                                                      NSResizableWindowMask)
//                                            backing: NSBackingStoreBuffered
//                                              defer: YES];
    
    NSRect rc = NSMakeRect(0, 0, 400, 400);
    NSUInteger uiStyle = NSTitledWindowMask | NSResizableWindowMask | NSClosableWindowMask;
    NSBackingStoreType backingStoreStyle = NSBackingStoreBuffered;
    _window = [[MyWindow alloc] initWithContentRect:rc styleMask:uiStyle backing:backingStoreStyle defer:NO];
    [_window setTitle: @"Hello World"];
    
    /* Create Label */
    _label = [[NSTextField alloc] initWithFrame: NSMakeRect(30, 30, 80, 30)];
    [_label setSelectable: NO];
    [_label setBezeled: NO];
    [_label setDrawsBackground: NO];
    [_label setStringValue: @"Helloa World"];
    
    [[_window contentView] addSubview: _label];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    [_window makeKeyAndOrderFront: self];

    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {

}

- (void)windowDidResize:(NSNotification *)notification {
    
}


@end
