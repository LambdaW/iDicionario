//
//  TabBar.m
//  Navigation
//
//  Created by Wellington Pardim Ferreira on 3/18/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "TabBar.h"
#import "LetraAViewController.h"

@implementation TabBar

-(void)viewDidLoad {
     [super viewDidLoad];
    NSLog(@"foi");
     // Do any additional setup after loading the view.
    LetraAViewController  *viewController = [[LetraAViewController alloc]
                                                  initWithNibName:nil
                                                   bundle:nil];
     UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
     TabBar *table = [[TabBar alloc] init];
    
     NSArray *views = [[NSArray alloc] initWithObjects:nav, table, nil];
     [self setViewControllers:views];
    
     nav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"A, B, C" image:nil tag:1];
     table.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"Lista" image:nil tag:2];
    
    
    
    
    
    // Do any additional setup after loading the view.
    
 
    }


@end
