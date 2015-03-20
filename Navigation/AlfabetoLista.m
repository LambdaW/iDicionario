//
//  AlfabetoLista.m
//  Navigation
//
//  Created by Wellington Pardim Ferreira on 3/19/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "AlfabetoLista.h"

@implementation AlfabetoLista
@synthesize alfabetoArray, fromLabel ;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    alfabetoArray =[NSArray arrayWithObjects:@"Avião", @"Bola",@"Carro",@"Dado",@"Elefante",@"Fruta",@"Gato",@"Hipopotamo",@"Indio",@"Jacaré",@"Ketchup",@"Lua",@"Macaco",@"Navio",@"Ovo",@"Palhaço",@"Queijo",@"Robô",@"Sapo",@"Tomate",@"Urso",@"Vaca",@"Walkman",@"Xicara",@"Yoda",@"Zebra", nil];
 


    fromLabel = [[UILabel alloc]initWithFrame:CGRectMake(70,50, 100, 63)];
    [fromLabel setTextAlignment:NSTextAlignmentCenter];
    
    
    
        UITableView *tableAlfa = [[UITableView alloc]init];
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f,self.tableView.bounds.size.width , 80.f)];
    fromLabel.center = self.tableView.tableHeaderView.center;
    fromLabel.text = @"Lista de Palavras";
 
 
 
    fromLabel.font=[fromLabel.font fontWithSize:12];
    
    fromLabel.textColor = [self getRandomColor];
[self.tableView.tableHeaderView addSubview:fromLabel];
    NSLog(@"%@", fromLabel.text);
    


    [tableAlfa delegate];
    
    
        
        [self.view addSubview:tableAlfa];
        
    }
    
    - (void)didReceiveMemoryWarning {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }
    
    
    - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

        return 1;
    }
    
    - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

        return [alfabetoArray count];
    }

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Letra"];
    
    long row = indexPath.row;
        [cell.detailTextLabel setText: [alfabetoArray objectAtIndex:row]];
    cell.backgroundColor = [self getRandomColor];
    cell.detailTextLabel.textColor = [UIColor whiteColor];
    return cell;
}



-(UIColor *)getRandomColor{
    CGFloat hue = ( arc4random() % 256 / 256.0 ); // 0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    return color;
}



@end
