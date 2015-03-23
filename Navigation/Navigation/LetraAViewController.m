//
//  LetraAViewController.m
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "Contador.h"
#import "AlfabetoLista.h"

@implementation LetraAViewController{
    NSString *savedImgPath;
}



@synthesize  alfabeto, fromLabel, img, tabBarController, proximo1, proximo2, myVC, navigationController;
@synthesize  btnEdit, currentPoint, _height, _width, _x, _y, datePicker;


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
    [obj addObject:[[UIBarButtonItem alloc] initWithTitle:@"Editar" style:UIBarButtonItemStylePlain target:self action:@selector(edit:)]];
    
    [obj addObject:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(getPhoto)]];
    
    [obj addObject:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(pickerChanged)]];
    
    [obj addObject:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(salvarData)]];
    
    [toolB setItems:obj animated:NO];
    
    CGRect pickerFrame = CGRectMake(0,250,0,0);
    
    datePicker = [[UIDatePicker alloc] initWithFrame:pickerFrame];
    [self.view addSubview:datePicker];
    [datePicker setHidden:YES];
    
    [self.view addSubview:toolB];
    
     btnEdit = [[UIButton alloc] initWithFrame:CGRectMake(0,100, 60, 54)];
    [btnEdit addTarget:self action:@selector(edit:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnEdit];
    
    Contador *sharedManager = [Contador sharedManager];
    
    img =[[UIImageView alloc] initWithFrame:CGRectMake(110, 200, 80, 80)];
    _height = img.frame.size.height;
    _width = img.frame.size.width;
    _x = img.frame.origin.x;
    _y = img.frame.origin.y;
    

    NSString *imgurl = sharedManager.imgPath[sharedManager.cont];
    self.title = imgurl;
    
    imgurl = [imgurl stringByAppendingString:@".png"];
    [self.view addSubview:fromLabel];
 //   [datePicker setHidden:YES];

    
    
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

-(void)salvarData{
    
    Contador *sharedManager = [Contador sharedManager];
    [sharedManager.data replaceObjectAtIndex:sharedManager.cont withObject:[datePicker date]];
    [datePicker setHidden:YES];
    NSLog(@"%@", sharedManager.data[sharedManager.cont]);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sua data foi salva"
                                                    message:nil
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];

}

-(void)getPhoto{
    

    
    UIImagePickerController *cardPicker = [[UIImagePickerController alloc]init];
    cardPicker.allowsEditing = YES;
    cardPicker.delegate = self;
    cardPicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    [self presentModalViewController:cardPicker animated:YES];
    

    
}
- (void)pickerChanged
{

    [datePicker setHidden:NO];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
                  editingInfo:(NSDictionary *)editingInfo{
    
    Contador *sharedManager = [Contador sharedManager];

    
    
    
    
    
    //_fotinha.image= image;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,     NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *imgurl = sharedManager.imgPath[sharedManager.cont];
    imgurl = [imgurl stringByAppendingString:imgurl];
    NSString *savedImagePath = [documentsDirectory stringByAppendingPathComponent:sharedManager.alfabeto[sharedManager.cont]];
    UIImage *imgza = image; // imageView is my image from camera
    
   // _fotinha2.image = [UIImage imageNamed:savedImagePath];
    
    savedImagePath = [savedImagePath stringByAppendingString:@".png"];
    
    
 //   savedImgPath = [documentsDirectory stringByAppendingPathComponent:imgurl];
    //UIImage *imga = image; // imageView is my image from camera
    NSData *imageData = UIImagePNGRepresentation(imgza);
    [imageData writeToFile:savedImagePath atomically:NO];

    [picker dismissModalViewControllerAnimated:YES];

    

    
    
    img.image = [UIImage imageNamed:savedImagePath];
    [sharedManager.imgPath replaceObjectAtIndex:sharedManager.cont withObject:savedImagePath];

    NSLog(@"%i <-------", sharedManager.cont);
    NSLog(@"%@ ---------->", sharedManager.imgPath[sharedManager.cont]);
    
    
    NSLog(@"%@", savedImagePath);
    
 
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
    
    
    NSString *imgurl = sharedManager.imgPath[sharedManager.cont] ;
    self.title = imgurl;
  //  imgurl  =   [imgurl lowercaseString];
    NSString *file = [[NSBundle mainBundle] pathForResource:imgurl ofType:@"png"];

  //  imgurl = [imgurl stringByAppendingString:@".png"];
   
    NSLog(@"%@ ---------!!!!", imgurl
          );

    UIImage *image = [UIImage imageWithContentsOfFile:imgurl];
  
    img.image = image;
    
  


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
    
    
    self.fromLabel.text = sharedManager.alfabeto[sharedManager.cont];
    
    
    NSString *imgurl = sharedManager.imgPath[sharedManager.cont];
  self.title = imgurl;
  //  imgurl  =   [imgurl lowercaseString];
    NSString *file = [[NSBundle mainBundle] pathForResource:imgurl ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:imgurl];

 //   imgurl = [imgurl stringByAppendingString:@".png"];
    
    
    
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
        
        
        NSString *imgurl = sharedManager.imgPath[sharedManager.cont];
        self.title = imgurl;
       // imgurl = [imgurl stringByAppendingString:@".png"];
        NSLog(@"%@", imgurl);
     //   imgurl =[imgurl lowercaseString];
        
        UIImage *image = [UIImage imageWithContentsOfFile:imgurl];
        img.image= image;

    }
    if(sharedManager.cont >= 26){
        sharedManager.cont = 0;
        self.fromLabel.text = sharedManager.alfabeto[sharedManager.cont];
        
        
        NSString *imgurl = sharedManager.imgPath[sharedManager.cont];
        
        self.title = imgurl;
      //  imgurl =[imgurl lowercaseString];

     //   imgurl = [imgurl stringByAppendingString:@".png"];
        
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
        
        
        NSString *imgurl = sharedManager.imgPath[sharedManager.cont];
        self.title = imgurl;

        UIImage *image = [UIImage imageNamed:imgurl];
        //imgurl = [imgurl stringByAppendingString:@".png"];

        NSLog(@"%@", imgurl);

        img.image = image;
        
        
        [self.navigationController pushViewController:[self myVC] animated:YES];
    
        

    }
}

@end
