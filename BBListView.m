//
//  BBListView.m
//  Hawler
//
//  Created by Oliver Relph & Jean-Nicolas Jolivet on 21/03/2011.
//  Copyright 2011 BAMBAMBAM & Silver Cocoa. All rights reserved.
//

#import "BBListView.h"


@implementation BBListView

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)viewDidMoveToWindow 
{
       
    if (trackingArea == nil) {
        trackingArea = [[NSTrackingArea alloc] initWithRect:[self bounds]
                                                    options:NSTrackingMouseMoved+NSTrackingActiveInKeyWindow+NSTrackingMouseEnteredAndExited
                                                      owner:self
                                                   userInfo:nil];
        [self addTrackingArea:trackingArea];
        [self becomeFirstResponder];  
    }
        
}

#pragma mark -
#pragma mark Drawing

- (NSRect)contentViewRect
{
	NSRect frame = [self frame];
	NSSize frameSize = NSMakeSize(NSWidth(frame), NSHeight(frame));
	NSSize availableSize = [[self class] contentSizeForFrameSize:frameSize
										   hasHorizontalScroller:NO
											 hasVerticalScroller:NO
													  borderType:[self borderType]];
	
	return NSMakeRect(0.0f, 0.0f, availableSize.width, availableSize.height);
}

- (void)tile
{    
    [super tile];
    
    [self setAutohidesScrollers:NO];
    
    [[self verticalScroller] removeFromSuperview];    
    [[self contentView] setFrame:[self bounds]];
    [self addSubview:[self verticalScroller]];    
    
    [[self verticalScroller] setHidden:YES];
}
#pragma mark -
#pragma mark Animation

- (void)showControls:(bool)show 
{
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    transition.type = kCATransitionFade; 
    
    [[[self verticalScroller] layer] addAnimation:transition forKey:nil];
    
    [[self verticalScroller] setHidden:!show];
    
}


#pragma mark -
#pragma mark Mouse Tracking

-(void)mouseEntered:(NSEvent *)theEvent 
{
        
    [self showControls:YES];
    
}

-(void)mouseExited:(NSEvent *)theEvent 
{
    
    [self showControls:NO];
    
}


@end
