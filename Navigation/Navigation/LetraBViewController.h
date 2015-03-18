//
//  LetraBViewController.h
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LetraAViewController.h"

@interface LetraBViewController : NSObject
{
     NSArray *alfabeto ;
}

@property UITabBarController *tabBarController;

-(UIColor* )getRandomColor;

@property UILabel *fromLabel;
@property UIImageView *img;

@property NSArray *alfabeto;
@property  int i;


@end
