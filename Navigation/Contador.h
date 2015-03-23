//
//  Contador.h
//  Navigation
//
//  Created by Wellington Pardim Ferreira on 3/17/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LetraAViewController.h"
#import <Realm/Realm.h>
@interface Contador : RLMObject
{
    
    int cont;
    
    NSMutableArray  *alfabeto ;
    NSMutableArray *imgPath;
}
//@property LetraAViewController *promo2;



-(void)previousInt;
-(void)nextInt;
@property int cont;
@property NSMutableArray *alfabeto;
@property NSMutableArray *imgPath;






+ (id)sharedManager;

@end
