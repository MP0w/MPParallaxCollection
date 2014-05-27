//
//  MPParallaxCollectionViewCell.h
//  MPPercentDriven
//
//  Created by Alex Manzella on 27/05/14.
//  Copyright (c) 2014 mpow. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MAX_HORIZONTAL_PARALLAX 150

@interface MPParallaxCollectionViewCell : UICollectionViewCell


@property (nonatomic,readwrite) UIImage *image;
@property (nonatomic,readwrite) UIImageView *imageView;
@property (nonatomic,assign) CGFloat parallaxValue; // from -1 to 1 that represent the minimum form to left to maximim right


@end
