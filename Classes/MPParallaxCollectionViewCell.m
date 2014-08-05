//
//  MPParallaxCollectionViewCell.m
//  MPPercentDriven
//
//  Created by Alex Manzella on 27/05/14.
//  Copyright (c) 2014 mpow. All rights reserved.
//

#import "MPParallaxCollectionViewCell.h"

@implementation MPParallaxCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.clipsToBounds=YES;
        self.imageView=[[UIImageView alloc] initWithFrame:CGRectInset(self.bounds, -MAX_HORIZONTAL_PARALLAX, 0)];
        self.imageView.contentMode=UIViewContentModeScaleAspectFill;
        self.imageView.clipsToBounds=YES;
        self.imageView.autoresizingMask=UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [self addSubview:self.imageView];
    }
    return self;
}



- (void)setParallaxValue:(CGFloat)parallaxValue{
    
    _parallaxValue=parallaxValue;
    
    CGRect frame=self.imageView.frame;
    frame.origin.x=-MAX_HORIZONTAL_PARALLAX + parallaxValue*MAX_HORIZONTAL_PARALLAX;
    self.imageView.frame=frame;
    
    if ([[self delegate] respondsToSelector:@selector(cell:changeParallaxValueTo:)]) {
        [[self delegate] cell:self changeParallaxValueTo:parallaxValue];
    }
    
}


- (void)dealloc{
    self.delegate=nil;
}





- (UIImage *)image{
    return self.imageView.image;
}

- (void)setImage:(UIImage *)image{
    self.imageView.image=image;
}

@end
