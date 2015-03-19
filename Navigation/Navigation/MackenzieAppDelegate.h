//
//  MackenzieAppDelegate.h
//  Navigation
//
//  Created by Vinicius Miana on 2/21/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LetraAViewController.h"
#import "AlfabetoLista.h"

@interface MackenzieAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) LetraAViewController *firstViewController;
@property (strong, nonatomic) AlfabetoLista *secondViewController;

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) UINavigationController *navigationController;
@property (nonatomic, strong) UITabBarController *tabBarController;




@end
