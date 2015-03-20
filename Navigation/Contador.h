//
//  Contador.h
//  Navigation
//
//  Created by Wellington Pardim Ferreira on 3/17/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LetraAViewController.h"


@interface Contador : NSObject
{
    
    int cont;
    
    NSMutableArray  *alfabeto ;
    
}
//@property LetraAViewController *promo2;



-(void)previousInt;
-(void)nextInt;
@property int cont;
@property NSMutableArray *alfabeto;





+ (id)sharedManager;

@end
