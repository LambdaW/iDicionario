//
//  LetraAViewController.m
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "LetraAViewController.h"
#import "LetraBViewController.h"

@implementation LetraAViewController
{
}

@synthesize i, alfabeto, fromLabel, img;

-(void) viewDidLoad {

    [super viewDidLoad];
    alfabeto =[NSArray arrayWithObjects:@"Avião", @"Bola",@"Carro",@"Dado",@"Elefante",@"Fruta",@"Gato",@"Hipopotamo",@"Indio",@"Jacaré",@"Ketchup",@"Lua",@"Macaco",@"Navio",@"Ovo",@"Palhaço",@"Queijo",@"Robô",@"Sapo",@"Tomate",@"Urso",@"Vaca",@"Walkman",@"Xicara",@"Yoda",@"Zebra", nil];

    
    img =[[UIImageView alloc] initWithFrame:CGRectMake(140,200,50,80)];
    img.image=[UIImage imageNamed:@"a.png"];
    
    [self.view addSubview:img];


    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(getNext:)];
    self.navigationItem.rightBarButtonItem = next;
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(getBack:)];
    
    self.navigationItem.leftBarButtonItem = back;

   
    //UILabel *alfaLabel = [[UILabel alloc]initWithFrame:YES];
    fromLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 50, 80,100)];
    
    
    fromLabel.center = self.view.center;
    
    [self.view addSubview:fromLabel];
 
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
  //  i++;
    self.title = alfabeto[i];
}

-(void)getNext:(id)sender {

    if(i <=24){
        i = i + 1;
        
        
        self.fromLabel.text = alfabeto[i];
       NSString *imgurl = [alfabeto[i] substringWithRange:NSMakeRange(0, 1)];
        self.title = imgurl;

        imgurl = [imgurl stringByAppendingString:@".png"];
        
        
        img.image=[UIImage imageNamed:imgurl];

    
        
    }
    

    
    
}

-(void)getBack:(id)sender{

    if(i >= 1){
       i = i - 1;
       self.fromLabel.text = alfabeto[i];
        NSString *imgurl = [alfabeto[i] substringWithRange:NSMakeRange(0, 1)];
        self.title = imgurl;

        imgurl = [imgurl stringByAppendingString:@".png"];
        

        img.image=[UIImage imageNamed:imgurl];
    }
}







@end
