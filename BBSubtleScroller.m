//
//  BBSubtleScroller.m
//  Hawler
//
//  Created by Oliver Relph & Jean-Nicolas Jolivet on 21/03/2011.
//  Copyright 2011 BAMBAMBAM & Silver Cocoa. All rights reserved.
//

#import "BBSubtleScroller.h"


@implementation BBSubtleScroller

- (id)initWithCoder:(NSCoder *)aDecoder
{
        
    self = [super initWithCoder:aDecoder];
    if (self) {        
        
        
    }
    
    return self;
    
}

+ (CGFloat) scrollerWidth
{
    return 5;
}

+ (CGFloat) scrollerWidthForControlSize:(NSControlSize)controlSize
{
    return 5;
}

- (void)drawRect:(NSRect)rect 
{
    [self drawKnob];
}

- (void) drawBackground:(NSRect) rect
{
    NSBezierPath *path = [NSBezierPath bezierPathWithRoundedRect:rect xRadius:0 yRadius:0];
    [[NSColor clearColor] set];
    [path fill];
}

- (void)drawKnob
{
    [self drawBackground:[self rectForPart:0]];
    [self drawBackground:[self rectForPart:1]];
    [self drawBackground:[self rectForPart:2]];
    [self drawBackground:[self rectForPart:4]];
    [self drawBackground:[self rectForPart:5]];
    [self drawBackground:[self rectForPart:6]];      
    
    NSRect knobRect = [self rectForPart:NSScrollerKnob];
    NSRect newRect = NSMakeRect((knobRect.size.width - [BBSubtleScroller scrollerWidth]) / 2, knobRect.origin.y, [BBSubtleScroller scrollerWidth], knobRect.size.height);
    NSBezierPath *path = [NSBezierPath bezierPathWithRoundedRect:newRect xRadius:3 yRadius:3];
    [[NSColor colorWithCalibratedWhite:255 alpha:1] set];
    [path fill];
}

@end