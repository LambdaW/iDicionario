//
//  LetraAViewController.h
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contador.h"

@interface LetraAViewController : UIViewController{
     NSArray *alfabeto ;

}
-(UIColor* )getRandomColor;
@property LetraAViewController *proximo1;
@property LetraAViewController *proximo2 ;

@property UITabBarController *tabBarController;
@property UILabel *fromLabel;
@property UIImageView *img;
@property NSArray *alfabeto;
@property  int i;
@property (nonatomic, strong) LetraAViewController *myVC;
@end
