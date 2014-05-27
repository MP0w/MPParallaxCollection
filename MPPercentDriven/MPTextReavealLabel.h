//
//  MPTextReavealLabel.h
//  MPTextReveal
//
//  Created by Alex Manzella on 27/05/14.
//  Copyright (c) 2014 mpow. All rights reserved.
//

#import <UIKit/UIKit.h>

@import CoreText;

@class MPTextReavealLabel;

@protocol MPTextReavealLabelAnimationsDelegate <NSObject>

- (void)textReavealLabel:(MPTextReavealLabel *)label didFinishAnimationKey:(NSString *)key;

@end

@interface MPTextReavealLabel : UIView

@property (nonatomic,readwrite) CAShapeLayer *layer;
@property (nonatomic,assign) id<MPTextReavealLabelAnimationsDelegate> delegate;
@property (nonatomic,readwrite) UIFont *font;
@property (nonatomic,readwrite) UIColor *textColor;
@property (nonatomic,copy)      NSString *text;
@property (nonatomic,assign) BOOL reversedAnimation;
@property (nonatomic,copy) NSAttributedString *attributedText; // alternative of the other...
@property (nonatomic,assign) CGFloat lineWidth;

- (void)animateWithDuration:(CGFloat)duration;
- (void)hideAnimatedWithDuration:(CGFloat)duration;

- (void)drawToValue:(CGFloat)value; // between 0 and 1

@end
