//
//  MPPallaxLayout.m
//  MPPercentDriven
//
//  Created by Alex Manzella on 27/05/14.
//  Copyright (c) 2014 mpow. All rights reserved.
//

#import "MPParallaxLayout.h"
#import "MPParallaxCollectionViewCell.h"

@implementation MPParallaxLayout

- (id)init{
    
    if (self=[super init]) {
        
        self.itemSize=[UIScreen mainScreen].bounds.size;
        self.minimumLineSpacing=0;
        self.minimumInteritemSpacing=0;
        self.scrollDirection=UICollectionViewScrollDirectionHorizontal;
        
    }
    
    return self;
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    NSMutableArray *attributes=[[super layoutAttributesForElementsInRect:rect] mutableCopy];

    [attributes enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes* obj, NSUInteger idx, BOOL *stop) {
        
        MPParallaxCollectionViewCell *cell=(MPParallaxCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:obj.indexPath];
        
        if (cell) {
            
            CGFloat position=self.collectionView.contentOffset.x;
            CGFloat final=self.itemSize.width*obj.indexPath.item;
            
            CGFloat missing=final-position;
            
            CGFloat parallaxValue=missing/self.collectionView.frame.size.width;
            
            cell.parallaxValue=parallaxValue;
            
        }
        
        
    }];

    return attributes;
}

- (CGSize)itemSize{
    return self.collectionView.frame.size;
}


- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

@end
