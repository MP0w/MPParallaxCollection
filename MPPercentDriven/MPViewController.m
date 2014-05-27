//
//  MPViewController.m
//  MPSkewed
//
//  Created by Alex Manzella on 23/05/14.
//  Copyright (c) 2014 mpow. All rights reserved.
//

#import "MPViewController.h"

static NSString *kCell=@"cell";



@interface MPViewController ()

@end

@implementation MPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden=YES;
    
   
    MPPallaxLayout *layout=[[MPPallaxLayout alloc] init];

    _collectionView=[[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.delegate=self;
    _collectionView.dataSource=self;
    _collectionView.showsHorizontalScrollIndicator=NO;
    _collectionView.pagingEnabled=YES;
    _collectionView.backgroundColor=[UIColor whiteColor];
    [_collectionView registerClass:[MPParallaxCollectionViewCell class] forCellWithReuseIdentifier:kCell];
    [self.view addSubview:_collectionView];
    
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MPParallaxCollectionViewCell* cell =  (MPParallaxCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kCell forIndexPath:indexPath];
    
#if DEBUG
    cell.imageView.backgroundColor=[UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
#endif

    cell.image=[UIImage imageNamed:[NSString stringWithFormat:@"%li",(long)indexPath.item%5+1]];
    
//    NSString *text;
//    
//    NSInteger index=choosed>=0 ? choosed : indexPath.row%5;
//    
//    switch (index) {
//        case 0:
//            text=@"DESERT\n hot";
//            break;
//        case 1:
//            text=@"MOUNTAIN\n cold";
//            break;
//        case 2:
//            text=@"BLAH\n warm";
//            break;
//        case 3:
//            text=@"SUNSET\n red";
//            break;
//        case 4:
//            text=@"AJACCIO\n beach";
//            break;
//        default:
//            break;
//            
//    }
//    
//    cell.text=text;
    
    return cell;
}



@end
