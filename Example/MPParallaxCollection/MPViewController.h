//
//  MPViewController.h
//  MPPercentDriven
//
//  Created by Alex Manzella on 27/05/14.
//  Copyright (c) 2014 mpow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MPParallaxLayout.h"
#import "MPParallaxCollectionViewCell.h"

@interface MPViewController : UIViewController<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate,MPParallaxCellDelegate>{
    
    UICollectionView *_collectionView;
    
}

@end
