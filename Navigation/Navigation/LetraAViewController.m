//
//  LetraAViewController.m
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "Contador.h"
#import "AlfabetoLista.h"

@implementation LetraAViewController



@synthesize  alfabeto, fromLabel, img, tabBarController, proximo1, proximo2, myVC, navigationController;
@synthesize  btnEdit, currentPoint, _height, _width, _x, _y;


-(UIColor *)getRandomColor{
    CGFloat hue = ( arc4random() % 256 / 256.0 ); // 0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    return color;
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:touch.view];
    img.center = location;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [self touchesBegan:touches withEvent:event];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"%@",[[alertView textFieldAtIndex:0] text]);
}


-(void) viewDidLoad {
    [super viewDidLoad];
 
    UIPinchGestureRecognizer *p = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];

    [self.view addGestureRecognizer:p];

    self.navigationController.toolbarHidden = true;
    
    UIToolbar *toolB = [[UIToolbar alloc] init];
    toolB.frame = CGRectMake(0, 465, self.view.frame.size.width, 54);
    NSMutableArray *obj = [[NSMutableArray alloc] init];
    [obj addObject:[[UIBarButtonItem alloc] initWithTitle:@"Editar" style:UIBarButtonItemStylePlain target:self action:@selector(edit:
                                                                                                                                   )]];
    [toolB setItems:obj animated:NO];
   // toolbar.center = self.view.center;
    [self.view addSubview:toolB];
    
     btnEdit = [[UIButton alloc] initWithFrame:CGRectMake(0,100, 60, 54)];
    [btnEdit addTarget:self action:@selector(edit:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnEdit];
    
    Contador *sharedManager = [Contador sharedManager];
    
    img =[[UIImageView alloc] initWithFrame:CGRectMake(110,200,80,80)];
    _height = img.frame.size.height;
    _width = img.frame.size.width;
    _x = img.frame.origin.x;
    _y = img.frame.origin.y;
    

    NSString *imgurl = [alfabeto[sharedManager.cont] substringWithRange:NSMakeRange(0, 1)];
    self.title = imgurl;
    
    imgurl = [imgurl stringByAppendingString:@".png"];
    [self.view addSubview:fromLabel];
    UIImage *image = [UIImage imageWithContentsOfFile:imgurl];
    img.image= image;
    
    self.fromLabel.text = imgurl;
    

    [self.view addSubview:img];
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(getNext:)];
    self.navigationItem.rightBarButtonItem = next;
    UIBarButtonItem *back = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(getBack:)];
    self.navigationItem.leftBarButtonItem = back;
    //UILabel *alfaLabel = [[UILabel alloc]initWithFrame:YES];
    fromLabel = [[UITextField alloc]initWithFrame:CGRectMake(0,0, 100, 73)];
    [fromLabel setTextAlignment:NSTextAlignmentCenter];
    fromLabel.center = self.view.center;
    [fromLabel setEnabled:NO];
    [self.view addSubview:fromLabel];
    fromLabel.delegate = self;
    [self.view setTag:1];
    
    
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [fromLabel resignFirstResponder];
    
    Contador *sharedManager = [Contador sharedManager];
    [sharedManager.alfabeto replaceObjectAtIndex:sharedManager.cont withObject:fromLabel.text];
    [btnEdit setTitle:@"Alterar" forState:UIControlStateHighlighted];
    
    return YES;
}
-(IBAction)edit:(id)sender{
   // NSLog(@"alterar");
    
    [fromLabel setEnabled:YES];
    [btnEdit setTitle:@"Salvar" forState:UIControlStateHighlighted];
}


- (void)pan:(UIPanGestureRecognizer *)recognizer{
  
    _height += 10;
    _width += 10;
    
    img.frame =CGRectMake(img.frame.origin.x,img.frame.origin.y , _width, _height);
    if(recognizer.state == UIGestureRecognizerStateEnded){
     img.frame = CGRectMake(img.frame.origin.x, img.frame.origin.y
                            , 80, 80);
        _width  = 0;
        _height = 0;
     }


}

-(void)viewDidAppear:(BOOL)animated{
    Contador *sharedManager = [Contador sharedManager];
    NSLog(@"load");


    self.fromLabel.text = sharedManager.alfabeto[sharedManager.cont];
    
    
    NSString *imgurl = [sharedManager.alfabeto[sharedManager.cont] substringWithRange:NSMakeRange(0, 1)];
    self.title = imgurl;
    imgurl  =   [imgurl lowercaseString];
    NSString *file = [[NSBundle mainBundle] pathForResource:imgurl ofType:@"png"];


    imgurl = [imgurl stringByAppendingString:@".png"];
   

    UIImage *image = [UIImage imageWithContentsOfFile:file];
  
    img.image= image;
    
  


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
    
    Contador *sharedManager = [Contador sharedManager];
    NSLog(@"load");
    
    
    self.fromLabel.text = sharedManager.alfabeto[sharedManager.cont];
    
    
    NSString *imgurl = [sharedManager.alfabeto[sharedManager.cont] substringWithRange:NSMakeRange(0, 1)];    self.title = imgurl;
    imgurl  =   [imgurl lowercaseString];
    NSString *file = [[NSBundle mainBundle] pathForResource:imgurl ofType:@"png"];
    
    
    imgurl = [imgurl stringByAppendingString:@".png"];
    
    
    UIImage *image = [UIImage imageWithContentsOfFile:file];
    
    img.image= image;
    
    
    
    
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
    if (myVC == nil)
        myVC = [[LetraAViewController alloc]initWithNibName:nil bundle:NULL];
    return myVC;
}




-(void)getNext:(id)sender {
    
    Contador *sharedManager = [Contador sharedManager];
    
    [sharedManager nextInt];


    
    if(sharedManager.cont <= 25){
        
        self.fromLabel.text = sharedManager.alfabeto[sharedManager.cont];
        
        
        NSString *imgurl = [sharedManager.alfabeto[sharedManager.cont] substringWithRange:NSMakeRange(0, 1)];
        self.title = imgurl;
        imgurl = [imgurl stringByAppendingString:@".png"];

        
        UIImage *image = [UIImage imageWithContentsOfFile:imgurl];
        img.image= image;

    }
    if(sharedManager.cont >= 26){
        sharedManager.cont = 0;
        self.fromLabel.text = sharedManager.alfabeto[sharedManager.cont];
        
        
        NSString *imgurl = [sharedManager.alfabeto[sharedManager.cont] substringWithRange:NSMakeRange(0, 1)];
        
        self.title = imgurl;
        imgurl  =   [imgurl lowercaseString];

        imgurl = [imgurl stringByAppendingString:@".png"];
        
        UIImage *image = [UIImage imageWithContentsOfFile:imgurl];
        img.image= image;
    }

        
        
        [self.navigationController pushViewController:[self myVC] animated:YES];


}
-(void)getBack:(id)sender{

    Contador *sharedManager = [Contador sharedManager];
    

    
    if(    sharedManager.cont > 0){
        [sharedManager previousInt];

        
        
        self.fromLabel.text = sharedManager.alfabeto[sharedManager.cont];
        
        
        NSString *imgurl = [sharedManager.alfabeto[sharedManager.cont] substringWithRange:NSMakeRange(0, 1)];
        self.title = imgurl;
        imgurl = [imgurl stringByAppendingString:@".png"];
        imgurl =  [imgurl lowercaseString];

        UIImage *image = [UIImage imageWithContentsOfFile:imgurl];
        img.image = image;
        
        
        [self.navigationController pushViewController:[self myVC] animated:YES];
    
        

    }
}

@end
