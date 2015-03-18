//
//  Contador.h
//  Navigation
//
//  Created by Wellington Pardim Ferreira on 3/17/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LetraAViewController.h"
#import "LetraBViewController.h"


@interface Contador : NSObject
{
    
    int cont;
    

}
//@property LetraAViewController *promo2;



-(int)previousInt;
-(int)nextInt;
@property int cont;




+ (id)sharedManager;

@end
