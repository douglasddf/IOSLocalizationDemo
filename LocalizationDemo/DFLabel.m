//
//  DFLabel.m
//  InternationalizationDemo
//
//  Created by Douglas Frari on 7/22/15.
//  Copyright (c) 2015 Douglas Frari. All rights reserved.
//

#import "DFLabel.h"

@implementation DFLabel


- (void)drawRect:(CGRect)rect {
    NSString *text = NSLocalizedStringWithDefaultValue([self text], nil, [NSBundle mainBundle], [self text], EMPTY_STRING);
    if (self.attributedText && [[self text] length] > 0) {
        
        NSDictionary *attributes = [(NSAttributedString *)self.attributedText attributesAtIndex:0
                                                                                 effectiveRange:NULL];
        [self setText:text];
        self.attributedText = [[NSAttributedString alloc] initWithString:self.text attributes:attributes];
    }else{
        [self setText:text];
    }
    
    [super drawRect:rect];
}


@end
