//
//  LetraAViewController.m
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "LetraAViewController.h"
#import "LetraBViewController.h"
#import "Contador.h"
#import "LetraC.h"

@implementation LetraAViewController



@synthesize i, alfabeto, fromLabel, img, tabBarController, proximo1, proximo2, myVC;



-(UIColor *)getRandomColor{
    CGFloat hue = ( arc4random() % 256 / 256.0 ); // 0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    return color;
}
-(void) viewDidLoad {
    [super viewDidLoad];
    NSLog(@"load");
    Contador *sharedManager = [Contador sharedManager];

    alfabeto =[NSArray arrayWithObjects:@"Avião", @"Bola",@"Carro",@"Dado",@"Elefante",@"Fruta",@"Gato",@"Hipopotamo",@"Indio",@"Jacaré",@"Ketchup",@"Lua",@"Macaco",@"Navio",@"Ovo",@"Palhaço",@"Queijo",@"Robô",@"Sapo",@"Tomate",@"Urso",@"Vaca",@"Walkman",@"Xicara",@"Yoda",@"Zebra", nil];
    img =[[UIImageView alloc] initWithFrame:CGRectMake(110,200,80,80)];
    NSString *imgurl = [alfabeto[sharedManager.cont] substringWithRange:NSMakeRange(0, 1)];
    self.title = imgurl;
    imgurl = [imgurl stringByAppendingString:@".png"];
    img.image=[UIImage imageNamed:imgurl];

    [self.view addSubview:img];
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(getNext:)];
    self.navigationItem.rightBarButtonItem = next;
    UIBarButtonItem *back = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(getBack:)];
    self.navigationItem.leftBarButtonItem = back;
    //UILabel *alfaLabel = [[UILabel alloc]initWithFrame:YES];
    fromLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,0, 100, 73)];
    [fromLabel setTextAlignment:NSTextAlignmentCenter];
    fromLabel.center = self.view.center;
    [self.view addSubview:fromLabel];
    self.fromLabel.text = alfabeto[0];

    /*UIButton *botao = [UIButton
     buttonWithType:UIButtonTypeSystem];
     [botao
     setTitle:@"Mostre uma palavra, uma figura e leia a palavra ao apertar um botao"
     forState:UIControlStateNormal];
     [botao sizeToFit];
     botao.center = self.view.center;
     [self.view addSubview:botao];
     */
}
-(void)viewDidAppear:(BOOL)animated{
    Contador *sharedManager = [Contador sharedManager];

    self.fromLabel.text = alfabeto[sharedManager.cont];
    NSString *imgurl = [alfabeto[sharedManager.cont] substringWithRange:NSMakeRange(0, 1)];
    self.title = imgurl;
    imgurl = [imgurl stringByAppendingString:@".png"];
    img.image=[UIImage imageNamed:imgurl];

    NSLog(@"appar");

    self.title = alfabeto[i];

    self.view.backgroundColor = [UIColor whiteColor];
    CAKeyframeAnimation *theAnimation = [CAKeyframeAnimation animation];
    theAnimation.values = [NSArray arrayWithObjects:
                           [NSValue valueWithCATransform3D:CATransform3DMakeRotation(0, 0,1,0)],
                           [NSValue valueWithCATransform3D:CATransform3DMakeRotation(3.13, 0,1,0)],
                           [NSValue valueWithCATransform3D:CATransform3DMakeRotation(3.13, 0,1,0)],
                           [NSValue valueWithCATransform3D:CATransform3DMakeRotation(6.26, 0,1,0)],
                           nil];
    
    theAnimation.cumulative = YES;
    theAnimation.duration = 2.2;
    theAnimation.repeatCount = 1;
    theAnimation.removedOnCompletion = YES;
    
    
    theAnimation.timingFunctions =
    [NSArray arrayWithObjects:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
     
     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],nil
     ];
    
    [img.layer addAnimation:theAnimation forKey:@"transform"];
    
    [UIView animateWithDuration:3
                          delay:0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [self.view setAlpha:0.7f];
                         CABasicAnimation *animation = [CABasicAnimation animation];
                         animation.keyPath = @"position.y";
                         animation.fromValue = @0;
                         animation.toValue = @230;
                         animation.duration = 2;
                         [img.layer addAnimation:animation forKey:@"basic"];
                         self.view.backgroundColor = [self getRandomColor];
                         //   [self.view setBackgroundColor:color];
                         // [fromLabel setBackgroundColor:blackColor ];
                     }
                     completion:^(BOOL finished){
                     }];
}

-(LetraAViewController *) myVC;
{
    if (myVC == nil)
        myVC = [[LetraAViewController alloc]initWithNibName:nil bundle:NULL];
    return myVC;
}


-(void)getNext:(id)sender {
   
    
    


//[self myVC]
    Contador *sharedManager = [Contador sharedManager];
    
    
    
    

 /* self.view.backgroundColor = [UIColor whiteColor];
    CAKeyframeAnimation *theAnimation = [CAKeyframeAnimation animation];
    theAnimation.values = [NSArray arrayWithObjects:
                           [NSValue valueWithCATransform3D:CATransform3DMakeRotation(0, 0,1,0)],
                           [NSValue valueWithCATransform3D:CATransform3DMakeRotation(3.13, 0,1,0)],
                           [NSValue valueWithCATransform3D:CATransform3DMakeRotation(3.13, 0,1,0)],
                           [NSValue valueWithCATransform3D:CATransform3DMakeRotation(6.26, 0,1,0)],
                           nil];
    
    theAnimation.cumulative = YES;
    theAnimation.duration = 2.2;
    theAnimation.repeatCount = 1;
    theAnimation.removedOnCompletion = YES;
    
    
    theAnimation.timingFunctions =
    [NSArray arrayWithObjects:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
     
     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],nil
     ];
    
    [img.layer addAnimation:theAnimation forKey:@"transform"];
    
    [UIView animateWithDuration:3
                          delay:0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [self.view setAlpha:0.7f];
                         CABasicAnimation *animation = [CABasicAnimation animation];
                         animation.keyPath = @"position.y";
                         animation.fromValue = @0;
                         animation.toValue = @230;
                         animation.duration = 2;
                         [img.layer addAnimation:animation forKey:@"basic"];
                         self.view.backgroundColor = [self getRandomColor];
                         //   [self.view setBackgroundColor:color];
                         // [fromLabel setBackgroundColor:blackColor ];
                     }
                     completion:^(BOOL finished){
                     }];

    */if(myVC == nil){
        [self dismissViewControllerAnimated:YES completion:nil];


   [self.navigationController pushViewController:[self myVC] animated:YES];
    }else{
        self.view = nil;

        [self dismissViewControllerAnimated:YES completion:nil];
        


        [self.navigationController popToViewController: myVC animated:YES];
    }

    
    if(    sharedManager.cont <= 24){
        [sharedManager nextInt];
        self.fromLabel.text = alfabeto[sharedManager.cont];
        NSString *imgurl = [alfabeto[sharedManager.cont] substringWithRange:NSMakeRange(0, 1)];
        self.title = imgurl;
        imgurl = [imgurl stringByAppendingString:@".png"];
        img.image=[UIImage imageNamed:imgurl];
    }
}
-(void)getBack:(id)sender{
    [UIView animateWithDuration:3
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [self.view setAlpha:0.7f];
                         CABasicAnimation *animation = [CABasicAnimation animation];
                         animation.keyPath = @"position.y";
                         animation.fromValue = @0;
                         animation.toValue = @230;
                         animation.duration = 2;
                         [img.layer addAnimation:animation forKey:@"basic"];
                         self.view.backgroundColor = [self getRandomColor];
                         //[self.view setBackgroundColor:c];
                         // [fromLabel setBackgroundColor:blackColor ];
                     }
                     completion:^(BOOL finished){
                     }];
    if(i >= 1){
        i = i - 1;
        self.fromLabel.text = alfabeto[i];
        NSString *imgurl = [alfabeto[i] substringWithRange:NSMakeRange(0, 1)];
        self.title = imgurl;
        imgurl = [imgurl stringByAppendingString:@".png"];
        img.image = [UIImage imageNamed:imgurl];
        
    }
}






@end
