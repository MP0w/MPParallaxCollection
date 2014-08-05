//
//  MPTextReavealLabel.m
//  MPTextReveal
//
//  Created by Alex Manzella on 27/05/14.
//  Copyright (c) 2014 mpow. All rights reserved.
//

#import "MPTextReavealLabel.h"

@implementation MPTextReavealLabel

@synthesize attributedText=_attributedText,font=_font,text=_text,textColor=_textColor;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        self.backgroundColor=[UIColor clearColor];
        self.reversedAnimation=1;

    }
    return self;
}

+ (Class) layerClass{
    
    return [CAShapeLayer class];
    
}

- (void)drawRect:(CGRect)rect
{
    
    [super drawRect:rect];
    
    if (!self.attributedText) {
        return;
    }
    
    NSRange range=NSMakeRange(0, 1);
    
    
    UIColor *textColor;
    if(_attributedText)
        textColor = [_attributedText attribute:NSForegroundColorAttributeName atIndex:0 longestEffectiveRange:&range inRange:NSMakeRange(0, 1)];
    else textColor = self.textColor;
    
    self.layer.fillRule = kCAFillRuleNonZero;
    self.layer.fillColor=[UIColor clearColor].CGColor;
    self.layer.strokeColor=textColor.CGColor;
    self.layer.lineWidth=_lineWidth>0 ? _lineWidth :  1;
    self.layer.path=[self pathRefFromText];

}




- (void)animateWithDuration:(CGFloat)duration{

    
    [self addLayerAnimationForKeyPath:@"strokeEnd" fromValue:@0 toValue:@1 duration:duration];
    
}

- (void)hideAnimatedWithDuration:(CGFloat)duration{
    
    [self addLayerAnimationForKeyPath:@"strokeStart" fromValue:@0 toValue:@1 duration:duration];
}


- (void)addLayerAnimationForKeyPath:(NSString *)keypath fromValue:(id)from toValue:(id)value duration:(CGFloat)duration{
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:keypath];
    animation.delegate=self;
    animation.fromValue= from;
    animation.toValue = value;
    animation.duration = duration;
    [self.layer addAnimation:animation forKey:keypath];
    
}

- (void)drawToValue:(CGFloat)value{
    
    self.layer.strokeEnd=value;
}

-(CGPathRef)pathRefFromText
{
    NSAttributedString *attributed = self.attributedText;
    
    CGMutablePathRef letters = CGPathCreateMutable();
    CTLineRef line = CTLineCreateWithAttributedString((__bridge CFAttributedStringRef)attributed);
    CFArrayRef runArray = CTLineGetGlyphRuns(line);
    for (CFIndex runIndex = 0; runIndex < CFArrayGetCount(runArray); runIndex++)
    {
        CTRunRef run = (CTRunRef)CFArrayGetValueAtIndex(runArray, runIndex);
        CTFontRef runFont = CFDictionaryGetValue(CTRunGetAttributes(run), kCTFontAttributeName);
        
        for (CFIndex runGlyphIndex = 0; runGlyphIndex < CTRunGetGlyphCount(run); runGlyphIndex++)
        {
            CFRange thisGlyphRange = CFRangeMake(runGlyphIndex, 1);
            CGGlyph glyph;
            CGPoint position;
            CTRunGetGlyphs(run, thisGlyphRange, &glyph);
            CTRunGetPositions(run, thisGlyphRange, &position);
            
            CGPathRef letter = CTFontCreatePathForGlyph(runFont, glyph, NULL);
            CGAffineTransform t = CGAffineTransformMakeTranslation(position.x, position.y);
            CGPathAddPath(letters, &t, letter);
            CGPathRelease(letter);
        }
    }
    
    UIBezierPath *path = [UIBezierPath bezierPathWithCGPath:letters];
    CGRect boundingBox = CGPathGetBoundingBox(letters);
    CGPathRelease(letters);
    CFRelease(line);
    
    
    [path applyTransform:CGAffineTransformMakeScale(1.0, -1.0)];
    [path applyTransform:CGAffineTransformMakeTranslation(0.0, boundingBox.size.height)];
    
    
    if (self.reversedAnimation) {
        return [[path bezierPathByReversingPath] CGPath];
    }
    
    return [path CGPath];
}


- (void)animationDidStop:(CABasicAnimation *)anim finished:(BOOL)flag{

    if ([self.delegate respondsToSelector:@selector(textReavealLabel:didFinishAnimationKey:)]) {
        [self.delegate textReavealLabel:self didFinishAnimationKey:[[anim keyPath] copy]];
    }
    
}




#pragma mark custom setters

- (void)setFont:(UIFont *)font{
    _font=font;
    [self setNeedsDisplay];
}

- (void)setText:(NSString *)text{
    _text=text;
    [self setNeedsDisplay];
}

- (void)setTextColor:(UIColor *)textColor{
    _textColor=textColor;
    [self setNeedsDisplay];
}

-(void)setAttributedText:(NSAttributedString *)attributedtext{
    _attributedText=attributedtext;
    [self setNeedsDisplay];
}

#pragma mark custom getters

- (UIFont *)font{
    
    return _font ? _font : [UIFont systemFontOfSize:20];
}


- (UIColor *)textColor{
    
    return _textColor ? _textColor : [UIColor blueColor];
}

- (NSString *)text{
    
    return _text;
    
}


- (NSAttributedString *)attributedText{
    
    if (_attributedText) {
        return _attributedText;
    }else if(self.text){
        
        return [[NSAttributedString alloc] initWithString:self.text attributes:@{NSForegroundColorAttributeName : self.textColor, NSFontAttributeName : self.font}];
    }
    
    return nil;
}


@end
