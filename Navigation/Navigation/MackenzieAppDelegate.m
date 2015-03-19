//
//  MackenzieAppDelegate.m
//  Navigation
//
//  Created by Vinicius Miana on 2/21/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "MackenzieAppDelegate.h"
#import "LetraAViewController.h"
//#import "AlfabetoLista.h"


@implementation MackenzieAppDelegate
@synthesize tabBarController;
@synthesize firstViewController;
//@synthesize secondViewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions

{
    /*
     LetraAViewController *viewController = [[LetraAViewController alloc]
     initWithNibName:nil
     bundle:nil];
     
     
     
     
     
     
     // viewController = self.navigationController;
     //   [v1.window makeKeyAndVisible];
     
     self.navigationController = [[UINavigationController alloc]
     initWithRootViewController:viewController];
     self.tabBarController = [[UITabBarController alloc]init];
     */
    /*LetraAViewController *v1 = [[LetraAViewController alloc]init];
     LetraAViewController *v2 = [[LetraAViewController alloc]init];
     
     */
    /*
     self.tabBarController.viewControllers = [NSArray arrayWithObjects:v1,v2 ,nil];
     
     
     
     self.window = [[UIWindow alloc]
     initWithFrame:[[UIScreen mainScreen] bounds]];
     
     
     self.window.rootViewController = self.tabBarController;
     
     self.window.backgroundColor = [UIColor whiteColor];
     
     [self.window makeKeyAndVisible];
     
     [_window addSubview:self.tabBarController.view];
     
     [_window makeKeyAndVisible];
     
     
     
     // Create the nav controller for the main screen
     
     
     // Present as a modal dialog to start the application
     
     [self.tabBarController presentModalViewController:self.navigationController animated:NO];
     return YES;
     
     
     
     // Do any additional setup after loading the view.
     
     LetraAViewController *viewController = [[LetraAViewController alloc]
     initWithNibName:nil
     bundle:nil];
     
     
     self.navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
     self.tabBarController  = [[UITabBarController alloc] init];
     
     
     + UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
     + TableViewController *table = [[TableViewController alloc] init];
     +
     NSArray *views = [[NSArray alloc] initWithObjects:self.navigationController, table, nil];
     + [self setViewControllers:views];
     +
     + nav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"A, B, C" image:nil tag:1];
     + table.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"Lista" image:nil tag:*/
    
    /*  NSArray *views = [[NSArray alloc] initWithObjects:self.navigationController, self.navigationController, nil];
     [self.tabBarController setViewControllers:views];
     
     self.navigationController.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"A, B, C" image:nil tag:1];
     v1.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"Lista" image:nil tag:2];
     self.window.rootViewController = self.tabBarController;
     return YES;
     
     
     */
    /*
     LetraAViewController *viewController = [[LetraAViewController alloc]
     initWithNibName:nil
     bundle:nil];
     self.navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
     TabBar *table = [[TabBar alloc] init];
     
     
     NSArray *views = [[NSArray alloc] initWithObjects:self.navigationController, table, nil];
     [self.tabBarController setViewControllers:views];
     
     self.navigationController.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"A, B, C" image:nil tag:1];
     table.tabBarItem  = [[UITabBarItem alloc]initWithTitle:@"Lista" image:nil tag:2];
     
     self.tabBarController = [[UITabBarController alloc]init];
     self.window.rootViewController = table;
     return YES;
     */
    UITabBarController *tabBar = [[UITabBarController alloc] init];
    self.tabBarController =[[UITabBarController alloc] init];
    
    
    
    LetraAViewController  *viewController = [[LetraAViewController alloc]
                                             initWithNibName:nil
                                             bundle:nil];
    // UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    //UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    
    //TabBar *table = [[TabBar alloc] init];
    
    NSArray *views = [[NSArray alloc] initWithObjects:self.navigationController, nil];
    [self.tabBarController setViewControllers:views];
    
    self.navigationController.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"A, B, C" image:nil tag:1];
    // nav2.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"Lista" image:nil tag:2];
    
    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.tabBarController;
    
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}
- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
